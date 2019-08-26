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
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index()
    {
        // permission();
        $data['title'] = $this->title;
        $this->_render_page($this->file_name.'/index', $data);
    }
    //No    Tgl. Masuk  No. PO  Pengirim    Nomor Aju   Dokumen Nomor   Tgl Dokumen Jml Detail  
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
                'kode_barang' => $this->input->post('kode_barang'),
                'nama_barang' => $this->input->post('nama_barang'),
                'kode_kategori' => $this->input->post('kode_kategori'),
                'hs_barang' => $this->input->post('hs_barang'),
                'spesifikasi_barang' => $this->input->post('spesifikasi_barang'),
                'satuan' => $this->input->post('satuan'),
                'harga_barang' => $this->input->post('harga_barang'),
                'currency' => $this->input->post('currency'),
            );
        $insert = $this->main->save($data);
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
}
