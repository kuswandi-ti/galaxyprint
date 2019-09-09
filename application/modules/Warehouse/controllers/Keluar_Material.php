<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Keluar_material extends MX_Controller {

    public $data;

    var $module = 'warehouse';
    var $title = 'Barang Keluar (Material)';
    var $file_name = 'keluar_material';
    var $table_name_header = 'trans_keluar_material_header';
    var $table_name_detail = 'trans_keluar_material_detail';
    var $table_name_material = 'master_material';
    var $table_jenis_keluar = 'master_jenis_keluar';

    function __construct() {
        parent::__construct();
        permission();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index() {
        $data = array(
            'get_work_order' => $this->main->get_work_order(),
            'get_jenis_dokumen' => $this->main->get_jenis_dokumen(),
            'get_material' => $this->main->get_material(),
            'get_jenis_keluar' => $this->main->get_jenis_keluar(),
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
            $row[] = $r->tgl_keluar;
            $row[] = $r->tujuan;
            $row[] = 'Produksi';
            $row[] = $r->no_wo;
            $row[] = $r->no_aju;
            $row[] = $r->jenis_dokumen;
            $row[] = $r->no_dokumen;
            $row[] = $r->tgl_dokumen;
 
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
            'tgl_keluar' => $this->input->post('tgl_keluar'),
            'tujuan' => $this->input->post('jenis_keluar'),
            'no_wo' => $this->input->post('no_wo'),
            'bagian' => $this->input->post('bagian'),
            'no_aju' => $this->input->post('no_aju'),
            'jenis_dokumen' => $this->input->post('jenis_dokumen'),
            'no_dokumen' => $this->input->post('no_dokumen'),
            'tgl_dokumen' => $this->input->post('tgl_dokumen'),
            'created_at' => dateNow(),
        );
        $this->db->insert($this->table_name_header, $data);

        $hdr_id = $this->db->insert_id();
        if (isset($_POST['kode_barang_detail'])) {
            $kode_barang_detail = $_POST['kode_barang_detail'];
            for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
                $data2 = array(
                    'id_header' => $hdr_id,
                    'kode_barang' => $_POST['kode_barang_detail'][$i], 
                    'nama_barang' => $_POST['nama_barang_detail'][$i], 
                    'spesifikasi_barang' => $_POST['spesifikasi_barang_detail'][$i], 
                    'hs_barang' => $_POST['hs_barang_detail'][$i], 
                    'satuan_barang' => $_POST['satuan_barang_detail'][$i],
                    'qty' => $_POST['qty_detail'][$i],
                );
                $this->db->insert($this->table_name_detail, $data2);
            }            
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update() {
        $id_header = $this->input->post('id_hidden');
        $data = array(
            'tgl_keluar' => $this->input->post('tgl_keluar'),
            'tujuan' => $this->input->post('jenis_keluar'),
            'no_wo' => $this->input->post('no_wo'),
            'bagian' => $this->input->post('bagian'),
            'no_aju' => $this->input->post('no_aju'),
            'jenis_dokumen' => $this->input->post('jenis_dokumen'),
            'no_dokumen' => $this->input->post('no_dokumen'),
            'tgl_dokumen' => $this->input->post('tgl_dokumen'),
        );
        $this->main->update(array('id' => $id_header), $data);

        // Untuk edit, memakai metode Delete Insert detail
        $this->main->delete_detail($id_header); // Delete all detail
        // Insert all detail
        if (isset($_POST['kode_barang_detail'])) {
            $kode_barang_detail = $_POST['kode_barang_detail'];
            for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
                $data2 = array(
                    'id_header' => $id_header,
                    'kode_barang' => $_POST['kode_barang_detail'][$i], 
                    'nama_barang' => $_POST['nama_barang_detail'][$i], 
                    'spesifikasi_barang' => $_POST['spesifikasi_barang_detail'][$i], 
                    'hs_barang' => $_POST['hs_barang_detail'][$i], 
                    'satuan_barang' => $_POST['satuan_barang_detail'][$i],
                    'qty' => $_POST['qty_detail'][$i], 
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
                echo    '<td><label>'.$row->nama_barang.'</label><input type="hidden" name="nama_barang_detail[]" class="" readonly value="'.$row->nama_barang.'"></td>';
                echo    '<td class="text-center"><label>'.$row->kode_barang.'</label><input type="hidden" name="kode_barang_detail[]" class="" readonly value="'.$row->kode_barang.'"></td>';
                echo    '<td><label>'.$row->spesifikasi_barang.'</label><input type="hidden" name="spesifikasi_barang_detail[]" class="" readonly value="'.$row->spesifikasi_barang.'"></td>';
                echo    '<td class="text-center" style="visibility:hidden;"><label>'.$row->hs_barang.'</label><input type="hidden" name="hs_barang_detail[]" class="" readonly value="'.$row->hs_barang.'"></td>';
                echo    '<td class="text-right"><label>'.$row->qty.'</label><input type="hidden" name="qty_detail[]" class="" readonly value="'.$row->qty.'"></td>';
                echo    '<td class="text-center"><label>'.$row->satuan_barang.'</label><input type="hidden" name="satuan_barang_detail[]" class="" readonly value="'.$row->satuan_barang.'"></td>';
                echo    '<td><button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>';
				echo '</tr>';				
				$i++;
            }
        }		
    }

    function get_info_material() {
        $kode_barang = $this->input->post('kode_barang');
        $res = $this->db->where('kode_barang', $kode_barang)->get($this->table_name_material);
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_kode_barang'] = $row['kode_barang'];
                $data['res_hs_barang'] = $row['hs_barang'];
                $data['res_satuan_barang'] = $row['satuan_kecil'];
                $data['res_spesifikasi_barang'] = $row['spesifikasi_barang'];
            }
        } else {
            $data['result'] = '';
            $data['res_kode_barang'] = '';
            $data['res_hs_barang'] = '';
            $data['res_satuan_barang'] = '';                
            $data['res_spesifikasi_barang'] = '';
        }        
        echo json_encode($data);
    }
}
