<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Acc_Bank_Penerimaan extends MX_Controller {

    public $data;

    var $module                 = 'kas_bank';
    var $title                  = 'Daftar Penerimaan (Kas & Bank)';
    var $file_name              = 'acc_bank_penerimaan';
    var $table_header           = 'acc_bank_penerimaan_header';
    var $table_detail           = 'acc_bank_penerimaan_detail';
    var $table_akun             = 'acc_master_akun';
    var $query_detail           = "qacc_bank_penerimaan_detail";

    function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index() {
        // permission();
        $data = array(
            'get_akun'          => $this->main->get_akun(),
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
            $row[] = $r->total_penerimaan;
            $row[] = $r->pengirim;
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
            'tgl_penerimaan'        => $this->input->post('tgl_penerimaan'),
            'kode_akun'             => $this->input->post('kode_akun_header'),
            'pengirim'              => $this->input->post('pengirim'),
            'total_penerimaan'      => $this->input->post('total_penerimaan'),
            'keterangan'            => $this->input->post('keterangan'),
            'created_at'            => dateNow(),
        );
        $this->db->insert($this->table_header, $data);

        $hdr_id = $this->db->insert_id();
        if (isset($_POST['kode_akun_detail'])) {
            $kode_akun_detail = $_POST['kode_akun_detail'];
            for ($i=0; $i < sizeof($kode_akun_detail); $i++) { 
                $data2 = array(
                    'id_header'             => $hdr_id,
                    'kode_akun'             => $_POST['kode_akun_detail'][$i], 
                    'jumlah'                => $_POST['jumlah_detail'][$i], 
                    'catatan'               => $_POST['catatan_detail'][$i], 
                );
                $this->db->insert($this->table_detail, $data2);
            }
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update() {
        $id_header = $this->input->post('id_hidden');
        $data = array(
            'tgl_penerimaan'        => $this->input->post('tgl_penerimaan'),
            'kode_akun'             => $this->input->post('kode_akun_header'),
            'pengirim'              => $this->input->post('pengirim'),
            'total_penerimaan'      => $this->input->post('total_penerimaan'),
            'keterangan'            => $this->input->post('keterangan'),
        );
        $this->main->update(array('id' => $id_header), $data);

        // Untuk edit, memakai metode Delete Insert detail
        $this->main->delete_detail($id_header); // Delete all detail
        // Insert all detail
        if (isset($_POST['kode_akun_detail'])) {
            $kode_akun_detail = $_POST['kode_akun_detail'];
            for ($i=0; $i < sizeof($kode_akun_detail); $i++) { 
                $data2 = array(
                    'id_header'             => $id_header,
                    'kode_akun'             => $_POST['kode_akun_detail'][$i], 
                    'jumlah'                => $_POST['jumlah_detail'][$i], 
                    'catatan'               => $_POST['catatan_detail'][$i],
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
                echo    '<td><label>'.$row->nama_akun.'</label><input type="hidden" name="nama_akun_detail[]" class="" readonly value="'.$row->nama_akun.'"></td>';                
                echo    '<td class="text-center"><label>'.$row->kode_akun.'</label><input type="hidden" name="kode_akun_detail[]" class="" readonly value="'.$row->kode_akun.'"></td>';
                echo    '<td class="text-right"><label>'.$row->jumlah.'</label><input type="hidden" name="jumlah_detail[]" class="" readonly value="'.$row->jumlah.'"></td>';
                echo    '<td><label>'.$row->catatan.'</label><input type="hidden" name="catatan_detail[]" class="" readonly value="'.$row->catatan.'"></td>';
                echo    '<td><button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>';
				echo '</tr>';				
				$i++;
            }
        }		
    }

    function get_info_akun() {
        $kode_akun = $this->input->post('kode_akun');
        $res = $this->db->where('kode_akun', $kode_akun)->get($this->table_akun);
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_kode_akun'] = $row['kode_akun'];
            }
        } else {
            $data['result'] = '';
            $data['res_kode_akun'] = '';
        }
        
        echo json_encode($data);
    }
}