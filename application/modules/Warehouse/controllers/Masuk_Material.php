<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Masuk_Material extends MX_Controller {

    public $data;

    var $module                 = 'warehouse';
    var $title                  = 'Barang Masuk (Material)';
    var $file_name              = 'masuk_material';
    var $table_header           = 'trans_masuk_material_header';
    var $table_detail           = 'trans_masuk_material_detail';
    var $table_material         = 'master_material';

    function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index() {
        // permission();
        $data = array(
            'get_po'            => $this->main->get_po(),
            'get_supplier'      => $this->main->get_supplier(),
            'get_jenis_dokumen' => $this->main->get_jenis_dokumen(),
            'get_material'      => $this->main->get_material(),
            'get_warehouse'     => $this->main->get_warehouse(),
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
            $row[] = $r->no_aju;
            $row[] = $r->jenis_dokumen;
            $row[] = $r->no_dokumen;
            $row[] = $r->tgl_dokumen;
            $row[] = $r->supplier_name;
            $row[] = $r->no_invoice;
 
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
            'tgl_masuk'         => $this->input->post('tgl_masuk'),
            'supplier'          => $this->input->post('supplier_id'),
            'no_po'             => $this->input->post('no_po'),
            'no_invoice'        => $this->input->post('no_invoice'),
            'no_packinglist'    => $this->input->post('no_packinglist'),
            'jenis_dokumen'     => $this->input->post('jenis_dokumen'),
            'no_aju'            => $this->input->post('no_aju'),
            'no_dokumen'        => $this->input->post('no_dokumen'),
            'tgl_dokumen'       => $this->input->post('tgl_dokumen'),
            'created_at'        => dateNow(),
        );
        $this->db->insert($this->table_header, $data);

        $hdr_id = $this->db->insert_id();
        $kode_barang_detail = $_POST['kode_barang_detail'];
        for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
            $data2 = array(
                'id_header'             => $hdr_id,
                'kode_barang'           => $_POST['kode_barang_detail'][$i], 
                'nama_barang'           => $_POST['nama_barang_detail'][$i], 
                'spesifikasi_barang'    => $_POST['spesifikasi_barang_detail'][$i], 
                'hs_barang'             => $_POST['hs_barang_detail'][$i], 
                'satuan_besar'          => $_POST['satuan_besar_detail'][$i],
                'harga_besar'           => $_POST['harga_besar_detail'][$i],
                'qty_besar'             => $_POST['qty_besar_detail'][$i],
                'currency'              => $_POST['currency_detail'][$i],
                'gudang'                => $_POST['id_gudang'],
                'id_po_detail'          => $_POST['id_po_detail_detail'][$i],
            );
            $this->db->insert($this->table_detail, $data2);
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update() {
        $id_header = $this->input->post('id_hidden');
        $data = array(
            'tgl_masuk'         => $this->input->post('tgl_masuk'),
            'supplier'          => $this->input->post('supplier_id'),
            'no_po'             => $this->input->post('no_po'),
            'no_invoice'        => $this->input->post('no_invoice'),
            'no_packinglist'    => $this->input->post('no_packinglist'),
            'jenis_dokumen'     => $this->input->post('jenis_dokumen'),
            'no_aju'            => $this->input->post('no_aju'),
            'no_dokumen'        => $this->input->post('no_dokumen'),
            'tgl_dokumen'       => $this->input->post('tgl_dokumen'),
        );
        $this->main->update(array('id' => $id_header), $data);

        // Untuk edit, memakai metode Delete Insert detail
        $this->main->delete_detail($id_header); // Delete all detail
        // Insert all detail
        if (isset($_POST['kode_barang_detail'])) {
            $kode_barang_detail = $_POST['kode_barang_detail'];
            for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
                $data2 = array(
                    'id_header'             => $id_header,
                    'kode_barang'           => $_POST['kode_barang_detail'][$i], 
                    'nama_barang'           => $_POST['nama_barang_detail'][$i], 
                    'spesifikasi_barang'    => $_POST['spesifikasi_barang_detail'][$i], 
                    'hs_barang'             => $_POST['hs_barang_detail'][$i], 
                    'satuan_besar'          => $_POST['satuan_besar_detail'][$i],
                    'harga_besar'           => $_POST['harga_besar_detail'][$i],
                    'qty_besar'             => $_POST['qty_besar_detail'][$i],
                    'currency'              => $_POST['currency_detail'][$i],
                    'gudang'                => $_POST['id_gudang'],
                    'id_po_detail'          => $_POST['id_po_detail_detail'][$i],
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
                echo        '<input type="hidden" name="id_po_detail_detail[]" class="" readonly value="'.$row->id_po_detail.'">';                
                echo    '</td>';
                echo    '<td class="text-right"><label>'.$row->qty_besar.'</label><input type="hidden" name="qty_besar_detail[]" class="" readonly value="'.$row->qty_besar.'"></td>';
                echo    '<td class="text-center"><label>'.$row->satuan_besar.'</label><input type="hidden" name="satuan_besar_detail[]" class="" readonly value="'.$row->satuan_besar.'"></td>';
                echo    '<td class="text-right"><label>'.$row->harga_besar.'</label><input type="hidden" name="harga_besar_detail[]" class="" readonly value="'.$row->harga_besar.'"></td>';
                echo    '<td class="text-right"><label>'.$row->total_besar.'</label><input type="hidden" name="total_besar_detail[]" class="" readonly value="'.$row->total_besar.'"></td>';
                echo    '<td class="text-center"><label>'.$row->currency.'</label><input type="hidden" name="currency_detail[]" class="" readonly value="'.$row->currency.'"></td>';
                echo    '<td><button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>';
				echo '</tr>';				
				$i++;
            }
        }		
    }

    function get_info_material() {
        $kode_barang = $this->input->post('kode_barang');
        $res = $this->db->where('kode_barang', $kode_barang)->get($this->table_material);
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_kode_barang'] = $row['kode_barang'];
                $data['res_spesifikasi_barang'] = $row['spesifikasi_barang'];
                $data['res_hs_barang'] = $row['hs_barang'];
                $data['res_satuan_besar'] = $row['satuan_besar'];
                $data['res_harga_satuan_besar'] = $row['harga_satuan_besar'];
            }
        } else {
            $data['result'] = '';
            $data['res_kode_barang'] = '';
            $data['res_spesifikasi_barang'] = '';
            $data['res_hs_barang'] = '';
            $data['res_satuan_besar'] = '';
            $data['res_harga_satuan_besar'] = '0';
        }        
        echo json_encode($data);
    }

    function get_info_from_po() {
        $no_po = $this->input->post('no_po', TRUE);
        $data = $this->db->query("SELECT
                a.no_po,
                a.supplier AS supplier_id,
                b.supplier_name
            FROM
                trans_po_header a
                LEFT JOIN master_supplier b ON a.supplier = b.supplier_id
            WHERE
                a.no_po = '$no_po'")->row();

        $data2 = $this->db->query("SELECT
                a.id,
                a.no_po,
                b.kode_barang,
                b.nama_barang,
                b.spesifikasi_barang,
                b.satuan,
                b.qty,
                b.harga,
                b.qty * b.harga AS total,
                b.currency
            FROM
                trans_po_header a
                LEFT JOIN trans_po_detail b ON a.id = b.id_header
            WHERE
                a.no_po = '$no_po'")->result();
        echo json_encode(array('header'=>$data, 'detail'=>$data2));
    }
}
