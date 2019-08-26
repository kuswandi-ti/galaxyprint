<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Faktur extends MX_Controller {
    public $data;
    var $module = 'penjualan';
    var $title = 'Faktur';
    var $file_name = 'faktur';
    var $table_name = '';
    function __construct()
    {
        parent::__construct();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index()
    {
        // permission();
        $data = array(
            'get_customer' => $this->main->get_customer(),
            'get_kode_akun' => $this->main->get_kode_akun(),
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
            $row[] = $r->tgl_invoice;
            $row[] = $r->no_invoice;
            $row[] = $r->kode_customer;
            $row[] = $r->total_invoice;
            $row[] = $r->currency;
            $row[] = $r->jatuh_tempo;
            $row[] = $r->status_input;
 
            //add html for action
            $row[] = '<a class="btn btn-sm btn-primary btn-xs" href="javascript:void(0)" title="Edit" onclick="edit('."'".$r->id."'".')"><i class="fa fa-pencil"></i> Edit</a>
                  <a class="btn btn-sm btn-danger btn-xs" href="javascript:void(0)" title="Hapus" onclick="hapus('."'".$r->id."'".')"><i class="fa fa-trash"></i> Delete</a>';
 
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
                'tgl_invoice' => $this->input->post('tgl_invoice'),
                'no_invoice' => $this->input->post('no_invoice'),
                'kode_customer' => $this->input->post('customer'),
                'no_po' => $this->input->post('no_po'),
                'jatuh_tempo' => $this->input->post('jatuh_tempo'),
                'total_invoice' => $this->input->post('sub_total'),
                'pajak' => $this->input->post('ppn'),
                'grand_total' => $this->input->post('grand_total'),
                'currency' => $this->input->post('currency'),
                'kurs' => $this->input->post('kurs'),
                'keterangan' => $this->input->post('keterangan'),
                'kode_akun' => $this->input->post('kode_akun'),
                'created_at' => dateNow(),
            );

        $this->db->insert('acc_piutang_header', $data);
        $id_header = $this->db->insert_id();
        $kode_barang_detail = $_POST['kode_barang_detail'];
        for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
            $data2 = array(
                        'id_header' => $id_header, 
                        'id_delivery_header' => $_POST['id_delivery_header_detail'][$i],
                        'id_delivery_detail' => $_POST['id_delivery_detail_detail'][$i],
                        'no_delivery' => $_POST['no_do_detail'][$i], 
                        'kode_barang' => $_POST['kode_barang_detail'][$i], 
                        'nama_barang' => $_POST['nama_barang_detail'][$i], 
                        'satuan_barang' => $_POST['satuan_detail'][$i], 
                        'qty' => $_POST['qty_detail'][$i], 
                        'harga_barang' => $_POST['harga_detail'][$i], 
                        'currency' => $_POST['currency'], 
                        'kurs' => $_POST['kurs']
                    );
            $this->db->insert('acc_piutang_detail', $data2);
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
         $data = array(
                'nama_Faktur' => $this->input->POST('nama_Faktur'),
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
                    // $this->template->add_css($this->module.'/User.css?v4.0.1');
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
            select d.id, d.nama_barang, no_do
            from trans_keluar_barang_detail d, trans_keluar_barang_header h
            where d.id_header = h.id
            and customer = '$customer_id'
        ")->result();
        echo json_encode($data);
    }

    function get_info_do_detail(){
        $id = $this->input->post('id');
        $res = $this->db->query("
            select d.id id_delivery_detail, h.id id_delivery_header, d.nama_barang,d.kode_barang, no_do, qty, satuan_barang satuan, harga_barang, currency
            from trans_keluar_barang_detail d, trans_keluar_barang_header h
            where d.id_header = h.id
            and d.id = '$id'
        ");
        if ($res->num_rows() > 0) {
            $data['result'] = 'done';
            $data['id_delivery_detail'] = $res->row()->id_delivery_detail;;
            $data['id_delivery_header'] = $res->row()->id_delivery_header;;
            $data['nama_barang'] = $res->row()->nama_barang;;
            $data['kode_barang'] = $res->row()->kode_barang;
            $data['no_do'] = $res->row()->no_do;
            $data['qty'] = $res->row()->qty;
            $data['satuan'] = $res->row()->satuan;
            $data['harga_barang'] = $res->row()->harga_barang;
            $data['currency'] = $res->row()->currency;
        } else {
            $data['result'] = '';
            $data['id'] = '';
            $data['nama_barang'] = '';
            $data['kode_barang'] = '';
            $data['no_do'] = '';
            $data['qty'] = '';
            $data['satuan'] = '';
            $data['harga_barang'] = '';
            $data['currency'] ='';
        }
        echo json_encode($data);
    }
}
