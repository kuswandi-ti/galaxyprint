<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Pengiriman extends MX_Controller {
    public $data;
    var $module = 'penjualan';
    var $title = 'Pengiriman';
    var $file_name = 'pengiriman';
    var $table_name = '';
    function __construct()
    {
        parent::__construct();
        permission();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index()
    {
        $data = array(
            'get_customer' => $this->main->get_customer(),
            'get_gudang' => $this->main->get_gudang(),
            'get_dokumen' => $this->main->get_dokumen(),
            'get_barang' => $this->main->get_barang(),
            'get_currency' => $this->main->get_currency(),
        );
        $data['title'] = $this->title;
        $this->_render_page($this->file_name.'/index', $data);
    }

    public function ajax_list()
    {
        $list = $this->main->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $r) {
            $row = array();
            $row[] = $r->tgl_keluar;
            $row[] = $r->no_do;
            $row[] = $r->customer;
            $row[] = $r->no_invoice;
            $row[] = $r->no_aju;
            $row[] = $r->no_dokumen;
            $row[] = $r->no_packinglist;
            $row[] = $r->tgl_dokumen;
            $row[] = '-';
 
            //add html for action
             // $row[] = '<!--<a class="btn btn-sm btn-primary btn-xs" href="javascript:void(0)" title="Edit" onclick="edit('."'".$r->id."'".')"><i class="fa fa-pencil"></i> Edit</a>-->
             //      <button type="button" class="btn btn-sm btn-danger btn-xs" '.$disabled.' href="javascript:void(0)" title="Hapus" onclick="hapus('."'".$r->id."'".')"><i class="fa fa-trash"></i> Delete</button>';
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->main->count_all(),
                        "recordsFiltered" => $this->main->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }

    public function ajax_edit($id)
    {
        $data = $this->main->get_by_id($id);
        echo json_encode($data);
    }

    public function ajax_add()
    {
        $data = array(
                'tgl_keluar' => $this->input->post('tgl_keluar'),
                'no_do' => $this->input->post('no_do'),
                'customer' => $this->input->post('customer'),
                'no_invoice' => $this->input->post('no_invoice'),
                'tgl_invoice' => $this->input->post('tgl_invoice'),
                'no_aju' => $this->input->post('no_aju'),
                'jenis_dokumen' => $this->input->post('jenis_dokumen'),
                'no_dokumen' => $this->input->post('no_dokumen'),
                'tgl_dokumen' => $this->input->post('tgl_dokumen'),
                'created_at' => dateNow(),
            );

        $this->db->insert('trans_keluar_barang_header', $data);
        $id_header = $this->db->insert_id();
        $kode_barang_detail = $_POST['kode_barang_detail'];
        for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
            $data2 = array(
                        'id_header' => $id_header, 
                        'no_wo' => $_POST['no_wo_detail'][$i], 
                        'customer_po' => $_POST['customer_po_detail'][$i], 
                        'nama_barang' => $_POST['nama_barang_detail'][$i], 
                        'satuan_barang' => $_POST['satuan_detail'][$i], 
                        'qty' => $_POST['qty_detail'][$i], 
                        'harga_barang' => $_POST['harga_detail'][$i], 
                        'currency' => $_POST['currency'], 
                        'gudang' => $_POST['gudang'], 
                    );
            $this->db->insert('trans_keluar_barang_detail', $data2);
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
         $data = array(
                'nama_Pengiriman' => $this->input->POST('nama_Pengiriman'),
                'nilai_kurs_idr' => $this->input->POST('nilai_kurs_idr'),
                'update_terakhir' => dateNow()
            );
        $this->main->update(array('id' => $this->input->POST('id')), $data);
        echo json_encode(array("status" => TRUE));
    }
 
    public function ajax_delete($id)
    {
        $this->main->delete_by_id($id);
        echo json_encode(array("status" => TRUE));
    }

    function _render_page($view, $data=null, $render=false)
    {
        $data = (empty($data)) ? $this->data : $data;
        if ( ! $render)
        {
            $this->load->library('template');

                if(in_array($view, array($this->file_name.'/index')))
                {
                    $this->template->set_layout('default'); 
                    $this->template->add_plugin_css('jquery-datatable\media\css\dataTables.bootstrap.min.css');
                    $this->template->add_plugin_js('jquery-datatable\media\js\jquery.dataTables.min.js'); 
                    $this->template->add_plugin_js('jquery-datatable\media\js\dataTables.bootstrap.js'); 
                    $this->template->add_js($this->module.'/'.$this->file_name.'.js'); 
                }

            if ( ! empty($data['title']))
            {
                $this->template->set_title($data['title']);
            }

            $this->template->load_view($view, $data);
        }
        else
        {
            return $this->load->view($view, $data, TRUE);
        }
    }

    function get_info_barang(){
        $customer_id = $this->input->post('customer_id');
        $data = $this->db->query("
            select d.id, d.nama_barang, d.no_wo, h.customer_po 
            from trans_wo_detail d, trans_wo_header h
            where d.id_header = h.id
            and customer = '$customer_id'
        ")->result();
        echo json_encode($data);
    }

    function get_info_wo_detail(){
        $id = $this->input->post('id');
        $res = $this->db->query("
            select d.id, d.nama_barang,d.kode_barang, d.no_wo, h.customer_po  , qty, satuan, harga_barang, currency
            from trans_wo_detail d, trans_wo_header h
            where d.id_header = h.id
            and d.id = '$id'
        ");
        if ($res->num_rows() > 0) {
            $data['result'] = 'done';
            $data['id'] = $res->row()->id;;
            $data['nama_barang'] = $res->row()->nama_barang;;
            $data['kode_barang'] = $res->row()->kode_barang;
            $data['no_wo'] = $res->row()->no_wo;;
            $data['customer_po'] = $res->row()->customer_po;
            $data['qty'] = $res->row()->qty;
            $data['satuan'] = $res->row()->satuan;
            $data['harga_barang'] = $res->row()->harga_barang;
            $data['currency'] = $res->row()->currency;
        } else {
            $data['result'] = '';
            $data['id'] = '';
            $data['nama_barang'] = '';
            $data['kode_barang'] = '';
            $data['no_wo'] = '';
            $data['customer_po'] = '';
            $data['qty'] = '';
            $data['satuan'] = '';
            $data['harga_barang'] = '';
            $data['currency'] ='';
        }
        echo json_encode($data);
    }
}
