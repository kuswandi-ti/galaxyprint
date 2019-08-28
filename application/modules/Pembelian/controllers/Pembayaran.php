<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Pembayaran extends MX_Controller {

    public $data;

    var $module                 = 'pembelian';
    var $title                  = 'Daftar Pembayaran (Pembelian)';
    var $file_name              = 'pembayaran';
    var $table_header           = 'acc_pembayaran_header';
    var $table_detail           = 'acc_pembayaran_detail';
    var $query_header           = 'qacc_pembayaran_header';
    var $table_hutang           = 'acc_hutang';

    function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index() {
        // permission();
        $data = array(
            'get_inv'           => $this->main->get_inv(),
            'get_supplier'      => $this->main->get_supplier(),
            'get_akun'          => $this->main->get_akun(),
            'get_currency'      => $this->main->get_currency(),
        );
        $this->_render_page($this->file_name.'/index', $data);
    }

    public function ajax_list() {
        $list = $this->main->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $r) {
            $row = array();
            $row[] = $r->id;
            $row[] = $r->tgl_transaksi;
            $row[] = $r->supplier_name;
            $row[] = $r->nama_akun;
            $row[] = $r->total_pembayaran;
            $row[] = $r->currency;
            $row[] = $r->no_cek;
            $row[] = $r->tgl_cek;
            $row[] = $r->keterangan;
 
            //add html for action
            $row[] = '<a class="btn btn-sm btn-primary btn-xs" href="javascript:void(0)" title="Edit" onclick="edit('."'".$r->id."'".')"><i class="fa fa-pencil"></i> Edit</a>
                      <button type="button" class="btn btn-sm btn-danger btn-xs" href="javascript:void(0)" title="Hapus" onclick="hapus('."'".$r->id."'".')"><i class="fa fa-trash"></i> Delete</button>';
 
            $data[] = $row;
        }
 
        $output = array(
            "draw"              => $_POST['draw'],
            "recordsTotal"      => $this->main->count_all(),
            "recordsFiltered"   => $this->main->count_filtered(),
            "data"              => $data,
        );
        echo json_encode($output);
    }

    public function ajax_edit($id) {
        $data = $this->main->get_by_id($id);
        echo json_encode($data);
    }

    public function ajax_add() {
        $data = array(
            'tgl_transaksi'         => $this->input->post('tgl_transaksi'),
            'kode_penerima'         => $this->input->post('kode_penerima'),
            'kode_akun'             => $this->input->post('kode_akun'),
            'kode_akun_terbayar'    => $this->input->post('kode_akun_terbayar'),
            'total_pembayaran'      => $this->input->post('total_pembayaran'),
            'currency'              => $this->input->post('currency_header'),
            'no_cek'                => $this->input->post('no_cek'),
            'tgl_cek'               => $this->input->post('tgl_cek'),
            'keterangan'            => $this->input->post('keterangan_header'),
            'created_at'            => dateNow(),
        );
        $this->db->insert($this->table_header, $data);

        $hdr_id = $this->db->insert_id();
        if (isset($_POST['no_invoice_detail'])) {
            $no_invoice_detail = $_POST['no_invoice_detail'];
            for ($i=0; $i < sizeof($no_invoice_detail); $i++) { 
                $data2 = array(
                    'id_header'             => $hdr_id,
                    'id_hutang'             => $_POST['id_hutang_detail'][$i], 
                    'no_invoice'            => $_POST['no_invoice_detail'][$i], 
                    'tgl_invoice'           => $_POST['tgl_invoice_detail'][$i], 
                    'jatuh_tempo'           => $_POST['jatuh_tempo_detail'][$i], 
                    'total_invoice'         => $_POST['total_invoice_detail'][$i], 
                    'currency'              => $_POST['currency_detail'][$i],
                    'keterangan'            => $_POST['keterangan_detail'][$i],
                );
                $this->db->insert($this->table_detail, $data2);
            }
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update() {
        $id_header = $this->input->post('id_hidden');
        $data = array(
            'tgl_transaksi'         => $this->input->post('tgl_transaksi'),
            'kode_penerima'         => $this->input->post('kode_penerima'),
            'kode_akun'             => $this->input->post('kode_akun'),
            'kode_akun_terbayar'    => $this->input->post('kode_akun_terbayar'),
            'total_pembayaran'      => $this->input->post('total_pembayaran'),
            'currency'              => $this->input->post('currency_header'),
            'no_cek'                => $this->input->post('no_cek'),
            'tgl_cek'               => $this->input->post('tgl_cek'),
            'keterangan'            => $this->input->post('keterangan_header'),
        );
        $this->main->update(array('id' => $id_header), $data);

        // Untuk edit, memakai metode Delete Insert detail
        $this->main->delete_detail($id_header); // Delete all detail
        // Insert all detail
        if (isset($_POST['no_invoice_detail'])) {
            $no_invoice_detail = $_POST['no_invoice_detail'];
            for ($i=0; $i < sizeof($no_invoice_detail); $i++) { 
                $data2 = array(
                    'id_header'             => $id_header,
                    'id_hutang'             => $_POST['id_hutang_detail'][$i], 
                    'no_invoice'            => $_POST['no_invoice_detail'][$i], 
                    'tgl_invoice'           => $_POST['tgl_invoice_detail'][$i], 
                    'jatuh_tempo'           => $_POST['jatuh_tempo_detail'][$i], 
                    'total_invoice'         => $_POST['total_invoice_detail'][$i], 
                    'currency'              => $_POST['currency_detail'][$i],
                    'keterangan'           => $_POST['keterangan_detail'][$i],
                );
                $this->db->insert($this->table_detail, $data2);
            }
        }
        echo json_encode(array("status" => TRUE));
    }
 
    public function ajax_delete($id) {
        $this->main->delete_by_id($id);
        echo json_encode(array("status" => TRUE));
    }

    function _render_page($view, $data=null, $render=false) {
        $data = (empty($data)) ? $this->data : $data;
        if ( ! $render) {
            $this->load->library('template');
            if (in_array($view, array($this->file_name.'/index'))) {
                $this->template->set_layout('default'); 
                // $this->template->add_css($this->module.'/User.css?v4.0.1');
                $this->template->add_plugin_css('jquery-datatable\media\css\dataTables.bootstrap.min.css');
                $this->template->add_plugin_css('bootstrap-datepicker/css/datepicker3.css');
                $this->template->add_plugin_js('jquery-datatable\media\js\jquery.dataTables.min.js'); 
                $this->template->add_plugin_js('jquery-datatable\media\js\dataTables.bootstrap.js'); 
                $this->template->add_plugin_js('bootstrap-datepicker/js/bootstrap-datepicker.js'); 
                $this->template->add_plugin_js('moment/moment.min.js'); 
                $this->template->add_js($this->module.'/'.$this->file_name.'.js'); 
            }

            if ( ! empty($data['title'])) {
                $this->template->set_title($data['title']);
            }

            $this->template->load_view($view, $data);
        } else {
            return $this->load->view($view, $data, TRUE);
        }
    }

    function show_detail() {
		$id_header = $this->input->get('id_header');
        $data = $this->main->show_detail($id_header);
        if ($data->num_rows() > 0) {
            $i = 1;
            foreach ($data->result() as $row) {
				echo '<tr>';
                echo    '<td><label>'.$i.'</label><input type="hidden" name="no[]" class="" readonly value="'.$i.'"></td>';  
                echo    '<td class="text-center"><label>'.$row->no_invoice.'</label><input type="hidden" name="no_invoice_detail[]" class="" readonly value="'.$row->no_invoice.'">';
                echo        '<input type="hidden" name="id_hutang_detail[]" class="" readonly value="'.$row->id_hutang.'">';
                echo    '</td>';                
                echo    '<td class="text-right"><label>'.$row->tgl_invoice.'</label><input type="hidden" name="tgl_invoice_detail[]" class="" readonly value="'.$row->tgl_invoice.'"></td>';
                echo    '<td class="text-right"><label>'.$row->jatuh_tempo.'</label><input type="hidden" name="jatuh_tempo_detail[]" class="" readonly value="'.$row->jatuh_tempo.'"></td>';
                echo    '<td class="text-right"><label>'.$row->total_invoice.'</label><input type="hidden" name="total_invoice_detail[]" class="" readonly value="'.$row->total_invoice.'"></td>';
                echo    '<td class="text-center"><label>'.$row->currency.'</label><input type="hidden" name="currency_detail[]" class="" readonly value="'.$row->currency.'"></td>';
                echo    '<td><label>'.$row->keterangan.'</label><input type="hidden" name="keterangan_detail[]" class="" readonly value="'.$row->keterangan.'"></td>';
                echo    '<td><button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>';
				echo '</tr>';				
				$i++;
            }
        }		
    }

    function get_info_inv() {
        $no_invoice = $this->input->post('no_invoice');
        $res = $this->db->where('no_invoice', $no_invoice)->get($this->table_hutang);
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_no_invoice'] = $row['no_invoice'];
                $data['res_id'] = $row['id'];
                $data['res_tgl_hutang'] = $row['tgl_hutang'];
                $data['res_jatuh_tempo'] = $row['jatuh_tempo'];
                $data['res_grand_total'] = $row['grand_total'];
                $data['res_currency'] = $row['currency'];
            }
        } else {
            $data['result'] = '';
            $data['res_no_invoice'] = '';
            $data['res_id'] = '0';
            $data['res_tgl_hutang'] = '';
            $data['res_jatuh_tempo'] = '';
            $data['res_grand_total'] = '0';
            $data['res_currency'] = '';
        }
        
        echo json_encode($data);
    }
}
