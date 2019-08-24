<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Bill_Of_Material extends MX_Controller {
    public $data;
    var $module = 'Produksi';
    var $title = 'Bill Of Material';
    var $file_name = 'bill_of_material';
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
            'get_barang_jadi' => $this->main->get_barang_jadi(),
            'get_material' => $this->main->get_material(),
            'get_currency' => $this->main->get_currency()
        );
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
            $row[] = $r->kode_barang;
            $row[] = $r->nama_barang;
            $row[] = $r->spesifikasi;
            $row[] = $r->unit;
            $row[] = $r->currency;
 
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
            'spesifikasi' => $this->input->post('spesifikasi_barang'),
            'unit' => $this->input->post('unit_barang'),
            'currency' => $this->input->post('currency_barang'),
            'created_at' => dateNow(),
        );

        $this->db->insert('master_bom_header', $data);
        $bom_hdr_id = $this->db->insert_id();
        if (isset($_POST['kode_material_detail'])) {
            $kode_material_detail = $_POST['kode_material_detail'];
            for ($i=0; $i < sizeof($kode_material_detail); $i++) { 
                $data2 = array(
                    'id_header' => $bom_hdr_id, 
                    'kode_material' => $_POST['kode_material_detail'][$i], 
                    'nama_material' => $_POST['nama_material_detail'][$i], 
                    'hs_material' => $_POST['hs_material_detail'][$i], 
                    'satuan_material' => $_POST['satuan_material_detail'][$i], 
                    'spesifikasi_bom' => $_POST['spesifikasi_bom_detail'][$i], 
                    'jumlah_bom' => $_POST['jumlah_bom_detail'][$i], 
                    'harga_bom' => $_POST['harga_bom_detail'][$i],
                    'currency_bom' => $_POST['currency_bom_detail'][$i],  
                    'created_at' => dateNow(),
                );
                $this->db->insert('master_bom_detail', $data2);
            }
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
        $id_header = $this->input->post('id_hidden');
        $data = array(
            'kode_barang' => $_POST['kode_barang'], 
            'nama_barang' => $_POST['nama_barang'], 
            'spesifikasi' => $_POST['spesifikasi_barang'], 
            'unit' => $_POST['unit_barang'], 
            'currency' => $_POST['currency_barang'], 
        );
        $this->main->update(array('id' => $id_header), $data);

        // Untuk edit, memakai metode Delete Insert detail
        $this->main->delete_detail($id_header); // Delete all detail
        // Insert all detail
        if (isset($_POST['kode_material_detail'])) {
            $kode_material_detail = $_POST['kode_material_detail'];
            for ($i=0; $i < sizeof($kode_material_detail); $i++) { 
                $data2 = array(
                    'id_header' => $id_header, 
                    'kode_material' => $_POST['kode_material_detail'][$i], 
                    'nama_material' => $_POST['nama_material_detail'][$i], 
                    'hs_material' => $_POST['hs_material_detail'][$i], 
                    'satuan_material' => $_POST['satuan_material_detail'][$i], 
                    'spesifikasi_bom' => $_POST['spesifikasi_bom_detail'][$i], 
                    'jumlah_bom' => $_POST['jumlah_bom_detail'][$i], 
                    'harga_bom' => $_POST['harga_bom_detail'][$i],
                    'currency_bom' => $_POST['currency_bom_detail'][$i],  
                    'created_at' => dateNow(),
                );
                $this->db->insert('master_bom_detail', $data2);
            }
        }

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
                    // $this->template->add_css($this->module.'/User.css?v4.0.1');
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

    function get_info_barang_jadi() {
        $kode_barang = $this->input->post('kode_barang');
        $res = $this->db->where('kode_barang', $kode_barang)->get('master_barang');
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_nama_barang'] = $row['nama_barang'];
                $data['res_spesifikasi_barang'] = $row['spesifikasi_barang'];
                $data['res_unit_barang'] = $row['satuan'];
                $data['res_currency_barang'] = $row['currency'];
            }
        } else {
            $data['result'] = '';
            $data['res_nama_barang'] = '';
            $data['res_spesifikasi_barang'] = '';
            $data['res_unit_barang'] = '';
            $data['res_currency_barang'] = '';
        }
        
        echo json_encode($data);
    }

    function get_info_material() {
        $kode_material = $this->input->post('kode_material');
        $res = $this->db->where('kode_barang', $kode_material)->get('master_material');
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_kode_material'] = $row['kode_barang'];
                $data['res_hs_material'] = $row['hs_barang'];
                $data['res_unit_material'] = $row['satuan_besar'];
                $data['res_spesifikasi_bom'] = $row['spesifikasi_barang'];
            }
        } else {
            $data['result'] = '';
            $data['res_kode_material'] = '';
            $data['res_hs_material'] = '';
            $data['res_unit_material'] = '';                
            $data['res_spesifikasi_bom'] = '';
        }
        
        echo json_encode($data);
    }

    function show_detail() {
		$id_header = $this->input->get('id_header');
        $data = $this->main->show_detail($id_header);
        if ($data->num_rows() > 0) {
            $i = 1;
            foreach ($data->result() as $row) {
				echo '<tr>';
                echo    '<td><label>'.$i.'</label><input type="hidden" name="no[]" class="" readonly value="'.$i.'"></td>';
                echo    '<td><label>'.$row->nama_material.'</label><input type="hidden" name="nama_material_detail[]" class="" readonly value="'.$row->nama_material.'"></td>';
                echo    '<td class="text-center"><label>'.$row->kode_material.'</label><input type="hidden" name="kode_material_detail[]" class="" readonly value="'.$row->kode_material.'"></td>';
                echo    '<td class="text-center"><label>'.$row->hs_material.'</label><input type="hidden" name="hs_material_detail[]" class="" readonly value="'.$row->hs_material.'"></td>';
                echo    '<td class="text-center"><label>'.$row->satuan_material.'</label><input type="hidden" name="satuan_material_detail[]" class="" readonly value="'.$row->satuan_material.'"></td>';
                echo    '<td><label>'.$row->spesifikasi_bom.'</label><input type="hidden" name="spesifikasi_bom_detail[]" class="" readonly value="'.$row->spesifikasi_bom.'"></td>';
                echo    '<td class="text-right"><label>'.$row->jumlah_bom.'</label><input type="hidden" name="jumlah_bom_detail[]" class="" readonly value="'.$row->jumlah_bom.'"></td>';
                echo    '<td class="text-right"><label>'.$row->harga_bom.'</label><input type="hidden" name="harga_bom_detail[]" class="" readonly value="'.$row->harga_bom.'"></td>';
                echo    '<td class="text-center"><label>'.$row->currency_bom.'</label><input type="hidden" name="currency_bom_detail[]" class="" readonly value="'.$row->currency_bom.'"></td>';
                echo    '<td><button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>';
				echo '</tr>';
				
				$i++;
            }
        }		
    }
}
