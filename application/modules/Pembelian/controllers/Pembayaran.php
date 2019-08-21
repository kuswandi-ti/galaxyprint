<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Pembayaran extends MX_Controller {
    public $data;
    var $module = 'Pembelian';
    var $title = 'Pembayaran';
    var $file_name = 'Pembayaran';
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
            'get_supplier' => $this->main->get_supplier(),
            'get_kode_akun' => $this->main->get_kode_akun(),
            'get_kode_akun_terbayar' => $this->main->get_kode_akun_terbayar(),
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
            $row[] = $r->tgl_transaksi;
            $row[] = $r->id;
            $row[] = $r->kode_penerima;
            $row[] = $r->kode_akun;
            $row[] = $r->total_pembayaran;
            $row[] = $r->currency;
            $row[] = $r->no_cek;
            $row[] = $r->tgl_cek;
            $row[] = $r->keterangan;
 
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
                'tgl_transaksi' => $this->input->post('tgl_po'),
                'kode_penerima' => $this->input->post('supplier'),
                'kode_akun' => $this->input->post('kode_akun'),
                'kode_akun_terbayar' => $this->input->post('kode_akun_terbayar'),
                'currency' => $this->input->post('currency'),
                'no_cek' => $this->input->post('no_cek'),
                'tgl_cek' => $this->input->post('tgl_cek'),
                'keterangan' => $this->input->post('keterangan'),
                'total_pembayaran' => $this->input->post('total_pembayaran'),
                'created_at' => dateNow(),
            );

        $this->db->insert('acc_pembayaran_header', $data);
        $id_header = $this->db->insert_id();
        $kode_barang_detail = $_POST['no_invoice_detail'];
        for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
            $data2 = array(
                        'id_header' => $id_header, 
                        'no_invoice' => $_POST['no_invoice_detail'][$i], 
                        'tgl_invoice' => $_POST['tgl_invoice_detail'][$i], 
                        'jatuh_tempo' => $_POST['jatuh_tempo_detail'][$i], 
                        'total_invoice' => $_POST['total_detail'][$i], 
                        'keterangan' => $_POST['keterangan_detail'][$i],
                        'currency' => $_POST['currency_detail'][$i], 
                    );
            $this->db->insert('acc_pembayaran_detail', $data2);
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
         $data = array(
                'nama_Pembayaran' => $this->input->POST('nama_Pembayaran'),
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

    function get_info_inv(){
        $supplier_id = $this->input->post('supplier_id',TRUE);
        $data = $this->db->query("
            SELECT * FROM ACC_HUTANG
            WHERE STATUS_HUTANG <> 'PAID'
            and supplier = '$supplier_id'
        ")->result();
        echo json_encode($data);
    }

    function get_info_from_inv(){
        $no_invoice = $this->input->post('no_invoice',TRUE);
        $data = $this->db->query("
            SELECT tgl_hutang, jatuh_tempo, total_hutang, kurs FROM ACC_HUTANG
            WHERE no_invoice  = '$no_invoice'
        ")->row();
        echo json_encode($data);
    }
}
