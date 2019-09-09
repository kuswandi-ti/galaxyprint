<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Jurnal extends MX_Controller {
    public $data;
    var $module = 'buku_besar';
    var $title = 'Jurnal Umum';
    var $file_name = 'jurnal';
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
           'get_kode_akun' => $this->main->get_kode_akun(),
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
            $row[] = $r->id;
            $row[] = $r->tgl_transaksi;
            $row[] = $r->jumlah;
            $row[] = $r->keterangan;
 
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
                'tgl_transaksi' => $this->input->post('tgl_transaksi'),
                'keterangan' => $this->input->post('keterangan'),
                'created_at' => dateNow(),
            );

        $this->db->insert('acc_bukti_transaksi', $data);
        $id_header = $this->db->insert_id();
        $kode_akun_detail = $_POST['kode_akun_detail'];
        for ($i=0; $i < sizeof($kode_akun_detail); $i++) { 
            $data2 = array(
                        'id_header' => $id_header, 
                        'kode_akun' => $_POST['kode_akun_detail'][$i], 
                        'nama_akun' => $_POST['nama_akun_detail'][$i], 
                        'debet' => $_POST['debet_detail'][$i], 
                        'kredit' => $_POST['kredit_detail'][$i], 
                        'catatan' => $_POST['catatan_detail'][$i]
                    );
            $this->db->insert('acc_jurnal_umum', $data2);
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

    function get_info_akun(){
        $kode_akun = $this->input->post('kode_akun');
        $res = $this->db->query("
            select * from acc_master_akun
            where kode_akun = '$kode_akun'
        ");
        if ($res->num_rows() > 0) {
            $data['result'] = 'done';
            $data['kode_akun'] = $res->row()->kode_akun;
        } else {
            $data['result'] = '';
            $data['kode_akun'] = '';
        }
        echo json_encode($data);
    }
}
