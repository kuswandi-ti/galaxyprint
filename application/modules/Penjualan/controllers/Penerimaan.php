<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Penerimaan extends MX_Controller {

    public $data;

    var $module = 'penjualan';
    var $title = 'Penerimaan Penjualan';
    var $file_name = 'penerimaan';
    var $table_name_header = 'acc_penerimaan_header';
    var $table_name_detail = 'acc_penerimaan_detail';
    var $table_name_piutang_header = 'acc_piutang_header';

    function __construct() {
        parent::__construct();
        permission();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index() {
        $data = array(
            'get_customer' => $this->main->get_customer(),
            'get_akun_debet' => $this->main->get_akun_debet(),
            'get_akun_kredit' => $this->main->get_akun_kredit(),
            'get_currency' => $this->main->get_currency(),
            'get_invoice' => $this->main->get_invoice(),
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
            $row[] = $r->tgl_penerimaan;
            $row[] = $r->kode_customer . ' - ' . $r->customer_name;
            $row[] = $r->kode_akun_debet . ' - ' . $r->nama_akun_debet;
            $row[] = $r->kode_akun_kredit . ' - ' . $r->nama_akun_kredit;
            $row[] = $r->total_penerimaan;
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
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->main->count_all(),
            "recordsFiltered" => $this->main->count_filtered(),
            "data" => $data,
        );
        echo json_encode($output);
    }

    public function ajax_edit($id) {
        $data = $this->main->get_by_id($id);
        echo json_encode($data);
    }

    public function ajax_add() {
        $data = array(
            'tgl_penerimaan' => $this->input->post('tgl_penerimaan'),
            'kode_customer' => $this->input->post('kode_customer'),
            'kode_akun_debet' => $this->input->post('kode_akun_debet'),
            'kode_akun_kredit' => $this->input->post('kode_akun_kredit'),
            'total_penerimaan' => $this->input->post('total_penerimaan'),
            'currency' => $this->input->post('currency'),
            'kurs' => $this->input->post('kurs'),
            'no_cek' => $this->input->post('no_cek'),
            'tgl_cek' => $this->input->post('tgl_cek'),
            'keterangan' => $this->input->post('keterangan'),
            'created_at' => dateNow(),
        );
        $this->db->insert($this->table_name_header, $data);

        $hdr_id = $this->db->insert_id();
        if (isset($_POST['no_invoice_detail'])) {
            $no_invoice_detail = $_POST['no_invoice_detail'];
            for ($i=0; $i < sizeof($no_invoice_detail); $i++) { 
                $data2 = array(
                    'id_header' => $hdr_id,
                    'id_invoice' => $_POST['id_invoice_detail'][$i], 
                    'no_invoice' => $_POST['no_invoice_detail'][$i], 
                    'tgl_invoice' => $_POST['tgl_invoice_detail'][$i], 
                    'jatuh_tempo' => $_POST['jatuh_tempo_detail'][$i], 
                    'total_invoice' => $_POST['total_invoice_detail'][$i],
                    'currency' => $_POST['currency_detail'][$i],
                    'keterangan' => $_POST['keterangan_detail'][$i],
                );
                $this->db->insert($this->table_name_detail, $data2);
            }
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update() {
        $id_header = $this->input->post('id_hidden');
        $data = array(
            'tgl_penerimaan' => $this->input->post('tgl_penerimaan'),
            'kode_customer' => $this->input->post('kode_customer'),
            'kode_akun_debet' => $this->input->post('kode_akun_debet'),
            'kode_akun_kredit' => $this->input->post('kode_akun_kredit'),
            'total_penerimaan' => $this->input->post('total_penerimaan'),
            'currency' => $this->input->post('currency'),
            'kurs' => $this->input->post('kurs'),
            'no_cek' => $this->input->post('no_cek'),
            'tgl_cek' => $this->input->post('tgl_cek'),
            'keterangan' => $this->input->post('keterangan'),
        );
        $this->main->update(array('id' => $id_header), $data);

        // Untuk edit, memakai metode Delete Insert detail
        $this->main->delete_detail($id_header); // Delete all detail
        // Insert all detail
        if (isset($_POST['no_invoice_detail'])) {
            $no_invoice_detail = $_POST['no_invoice_detail'];
            for ($i=0; $i < sizeof($no_invoice_detail); $i++) { 
                $data2 = array(
                    'id_header' => $id_header,
                    'id_invoice' => $_POST['id_invoice_detail'][$i], 
                    'no_invoice' => $_POST['no_invoice_detail'][$i], 
                    'tgl_invoice' => $_POST['tgl_invoice_detail'][$i], 
                    'jatuh_tempo' => $_POST['jatuh_tempo_detail'][$i], 
                    'total_invoice' => $_POST['total_invoice_detail'][$i],
                    'currency' => $_POST['currency_detail'][$i],
                    'keterangan' => $_POST['keterangan_detail'][$i],
                );
                $this->db->insert($this->table_name_detail, $data2);
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
        }
        else {
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
                echo    '<td><label>'.$row->no_invoice.'</label><input type="hidden" name="no_invoice_detail[]" class="" readonly value="'.$row->no_invoice.'"><input type="hidden" name="id_invoice_detail[]" class="" readonly value="'.$row->id_invoice.'"></td>';
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

    function get_info_invoice() {
        $no_invoice = $this->input->post('no_invoice');
        $res = $this->db->where('no_invoice', $no_invoice)->get($this->table_name_piutang_header);
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_id_invoice'] = $row['id'];
                $data['res_tgl_invoice'] = $row['tgl_invoice'];
                $data['res_jatuh_tempo'] = $row['jatuh_tempo'];
                $data['res_total_invoice'] = $row['total_invoice'];
                $data['res_currency'] = $row['currency'];
            }
        } else {
            $data['res_no_invoice'] = '';
            $data['res_tgl_invoice'] = '';
            $data['res_jatuh_tempo'] = '';
            $data['res_total_invoice'] = 0;
            $data['res_currency'] = '';
        }        
        echo json_encode($data);
    }
}
