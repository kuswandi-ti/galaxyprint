<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Penerimaan extends MX_Controller {
    public $data;
    var $module = 'assets';
    var $title = 'Penerimaan';
    var $file_name = 'penerimaan';
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
            'get_aktiva' => $this->main->get_aktiva(),
            'get_dokumen' => $this->main->get_dokumen(),
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
            $row[] = $r->tgl_masuk;
            $row[] = $r->no_po;
            $row[] = $r->pengirim;
            $row[] = $r->no_aju;
            $row[] = $r->no_dokumen;
            $row[] = $r->tgl_dokumen;
 
            //add html for action
            $row[] = '<!--<a class="btn btn-sm btn-primary btn-xs" href="javascript:void(0)" title="Edit" onclick="edit('."'".$r->id."'".')"><i class="fa fa-pencil"></i> Edit</a>-->
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
                'tgl_masuk' => $this->input->post('tgl_masuk'),
                'no_po' => $this->input->post('no_po'),
                'no_invoice' => $this->input->post('no_invoice'),
                'pengirim' => $this->input->post('pengirim'),
                'no_aju' => $this->input->post('no_aju'),
                'jenis_dokumen' => $this->input->post('jenis_dokumen'),
                'no_dokumen' => $this->input->post('no_dokumen'),
                'tgl_dokumen' => $this->input->post('tgl_dokumen'),
                'created_at' => dateNow(),
            );

        $this->db->insert('trans_masuk_mesin_header', $data);
        $id_header = $this->db->insert_id();
        $kode_barang_detail = $_POST['kode_barang_detail'];
        for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
            $data2 = array(
                        'id_header' => $id_header, 
                        'kode_barang' => $_POST['kode_barang_detail'][$i], 
                        'nama_barang' => $_POST['nama_barang_detail'][$i], 
                        'satuan_barang' => $_POST['satuan_detail'][$i], 
                        'qty' => $_POST['qty_detail'][$i], 
                        'harga_barang' => $_POST['harga_detail'][$i], 
                        'currency' => $_POST['currency_detail'][$i], 
                    );
            $this->db->insert('trans_masuk_mesin_detail', $data2);
        }
        echo json_encode(array("status" => TRUE));
    }


    public function ajax_update()
    {
         $data = array(
                'kode_barang' => $this->input->post('kode_barang'),
                'nama_barang' => $this->input->post('nama_barang'),
                'kode_kategori' => $this->input->post('kode_kategori'),
                'hs_barang' => $this->input->post('hs_barang'),
                'spesifikasi_barang' => $this->input->post('spesifikasi_barang'),
                'satuan' => $this->input->post('satuan'),
                'harga_barang' => $this->input->post('harga_barang'),
                'currency' => $this->input->post('currency'),
            );
        $this->main->update(array('id' => $this->input->post('id')), $data);
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
                    $this->template->add_plugin_css('bootstrap-datepicker/css/datepicker3.css');
                    $this->template->add_plugin_js('jquery-datatable\media\js\jquery.dataTables.min.js'); 
                    $this->template->add_plugin_js('jquery-datatable\media\js\dataTables.bootstrap.js'); 
                    $this->template->add_plugin_js('bootstrap-datepicker/js/bootstrap-datepicker.js'); 
                    $this->template->add_plugin_js('moment/moment.min.js'); 
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

    function get_info_aktiva(){
        $kode_barang = $this->input->post('kode_barang');
        $res = $this->db->query("
            select * from acc_aktiva_header
            where kode_barang = '$kode_barang'
        ");
        if ($res->num_rows() > 0) {
            $data['result'] = 'done';
            $data['kode_barang'] = $res->row()->kode_barang;
            $data['satuan'] = $res->row()->satuan;
            $data['harga_barang'] = $res->row()->harga_barang;
            $data['currency'] = $res->row()->currency;
        } else {
            $data['result'] = '';
            $data['kode_barang'] = '';
            $data['satuan'] = '';
            $data['harga_barang'] = '';
            $data['currency'] = '';
        }
        echo json_encode($data);
    }
}
