<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Hasil_Produksi extends MX_Controller {

    public $data;

    var $module                 = 'produksi';
    var $title                  = 'Daftar Hasil Produksi';
    var $file_name              = 'hasil_produksi';
    var $table_header           = 'trans_masuk_barang_header';
    var $table_detail           = 'trans_masuk_barang_detail';
    var $query_header           = 'qtrans_masuk_barang_detail';
    var $table_barang           = 'master_barang';

    function __construct() {
        parent::__construct();
        permission();
        $this->load->library('session');
        $this->load->model('Hasil_Produksi_model', 'main');
    }

    public function index() {
        $data = array(
            'get_wo'            => $this->main->get_wo(),
            'get_barang'        => $this->main->get_barang(),
            'get_gudang'        => $this->main->get_gudang(),
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
            $row[] = $r->tgl_masuk;
            $row[] = $r->kode_produksi;
            $row[] = $r->no_wo;
            $row[] = $r->jml_item;
 
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
            'tgl_masuk'             => $this->input->post('tgl_masuk'),
            'no_wo'                 => $this->input->post('no_wo'),
            'kode_produksi'         => $this->input->post('kode_produksi'),
            'gudang'                => $this->input->post('gudang'),
            'created_at'            => dateNow(),
        );
        $this->db->insert($this->table_header, $data);

        $hdr_id = $this->db->insert_id();
        if (isset($_POST['kode_barang_detail'])) {
            $kode_barang_detail = $_POST['kode_barang_detail'];
            for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
                $data2 = array(
                    'id_header'                 => $hdr_id,
                    'kode_barang'               => $_POST['kode_barang_detail'][$i], 
                    'nama_barang'               => $_POST['nama_barang_detail'][$i], 
                    'spesifikasi_barang'        => $_POST['spesifikasi_barang_detail'][$i], 
                    'hs_barang'                 => $_POST['hs_barang_detail'][$i], 
                    'satuan_barang'             => $_POST['satuan_barang_detail'][$i], 
                    'qty'                       => $_POST['qty_detail'][$i],
                    'harga_barang'              => $_POST['harga_barang_detail'][$i],
                    'currency'                  => $_POST['currency_detail'][$i],
                );
                $this->db->insert($this->table_detail, $data2);
            }
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update() {
        $id_header = $this->input->post('id_hidden');
        $data = array(
            'tgl_masuk'             => $this->input->post('tgl_masuk'),
            'no_wo'                 => $this->input->post('no_wo'),
            'kode_produksi'         => $this->input->post('kode_produksi'),
            'gudang'                => $this->input->post('gudang'),
        );
        $this->main->update(array('id' => $id_header), $data);

        // Untuk edit, memakai metode Delete Insert detail
        $this->main->delete_detail($id_header); // Delete all detail
        // Insert all detail
        if (isset($_POST['kode_barang_detail'])) {
            $kode_barang_detail = $_POST['kode_barang_detail'];
            for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
                $data2 = array(
                    'id_header'                 => $id_header,
                    'kode_barang'               => $_POST['kode_barang_detail'][$i], 
                    'nama_barang'               => $_POST['nama_barang_detail'][$i], 
                    'spesifikasi_barang'        => $_POST['spesifikasi_barang_detail'][$i], 
                    'hs_barang'                 => $_POST['hs_barang_detail'][$i], 
                    'satuan_barang'             => $_POST['satuan_barang_detail'][$i], 
                    'qty'                       => $_POST['qty_detail'][$i],
                    'harga_barang'              => $_POST['harga_barang_detail'][$i],
                    'currency'                  => $_POST['currency_detail'][$i],
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
                echo    '<td><label>'.$row->nama_barang.'</label><input type="hidden" name="nama_barang_detail[]" class="" readonly value="'.$row->nama_barang.'"></td>';
                echo    '<td class="text-center"><label>'.$row->kode_barang.'</label><input type="hidden" name="kode_barang_detail[]" class="" readonly value="'.$row->kode_barang.'">';
                echo        '<input type="hidden" name="spesifikasi_barang_detail[]" class="" readonly value="'.$row->spesifikasi_barang.'">';
                echo        '<input type="hidden" name="hs_barang_detail[]" class="" readonly value="'.$row->hs_barang.'">';                
                echo    '</td>';
                echo    '<td class="text-right"><label>'.$row->qty.'</label><input type="hidden" name="qty_detail[]" class="" readonly value="'.$row->qty.'"></td>';                
                echo    '<td class="text-center"><label>'.$row->satuan_barang.'</label><input type="hidden" name="satuan_barang_detail[]" class="" readonly value="'.$row->satuan_barang.'"></td>';                
                echo    '<td class="text-right"><label>'.$row->harga_barang.'</label><input type="hidden" name="harga_barang_detail[]" class="" readonly value="'.$row->harga_barang.'"></td>';
                echo    '<td class="text-right"><label>'.$row->total.'</label><input type="hidden" name="total_detail[]" class="" readonly value="'.$row->total.'"></td>';
                echo    '<td class="text-center"><label>'.$row->currency.'</label><input type="hidden" name="currency_detail[]" class="" readonly value="'.$row->currency.'"></td>';
                echo    '<td><button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>';
				echo '</tr>';				
				$i++;
            }
        }		
    }

    function get_info_barang() {
        $kode_barang = $this->input->post('kode_barang');
        $res = $this->db->where('kode_barang', $kode_barang)->get($this->table_barang);
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_kode_barang'] = $row['kode_barang'];
                $data['res_spesifikasi_barang'] = $row['spesifikasi_barang'];
                $data['res_hs_barang'] = $row['hs_barang'];
                $data['res_satuan'] = $row['satuan'];
                $data['res_harga_barang'] = $row['harga_barang'];
                $data['res_currency'] = $row['currency'];
            }
        } else {
            $data['result'] = '';
            $data['res_kode_barang'] = '';
            $data['res_spesifikasi_barang'] = '';
            $data['res_hs_barang'] = '';
            $data['res_satuan'] = '';
            $data['res_harga_barang'] = '0';
            $data['res_currency'] = '';
        }
        
        echo json_encode($data);
    }

    function get_info_from_wo() {
        $no_wo = $this->input->post('no_wo', TRUE);
        $data1 = $this->db->query("SELECT
                            SUM(qty * harga_barang) AS grand_total
                        FROM
                            trans_wo_detail
                        WHERE
                            no_wo = '$no_wo'")->result();

        $data2 = $this->db->query("SELECT
                *
            FROM
                trans_wo_detail
            WHERE
                no_wo = '$no_wo'")->result();
        echo json_encode(array('header' => $data1,'detail' => $data2));
    }
}
