<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Work_Order extends MX_Controller {
    public $data;
    var $module = 'Produksi';
    var $title = 'Work Order';
    var $file_name = 'work_order';
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
            'get_customer' => $this->main->get_customer(),
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
            $row[] = $r->no_wo;
            $row[] = $r->tgl_wo;
            $row[] = $r->customer_code . ' - ' . $r->customer_name;
            $row[] = $r->customer_po;
 
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
            'no_wo' => $this->input->post('no_wo'),
            'tgl_wo' => $this->input->post('tgl_wo'),
            'customer' => $this->input->post('customer'),
            'customer_po' => $this->input->post('customer_po'),
            'created_at' => dateNow(),
        );

        $this->db->insert('trans_wo_header', $data);
        $hdr_id = $this->db->insert_id();
        $kode_barang_detail = $_POST['kode_barang_detail'];
        for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
            $data2 = array(
                'id_header' => $hdr_id, 
                'no_wo' => $this->input->post('no_wo'), 
                'kode_barang' => $_POST['kode_barang_detail'][$i], 
                'nama_barang' => $_POST['nama_barang_detail'][$i], 
                'spesifikasi_barang' => $_POST['spesifikasi_barang_detail'][$i], 
                'hs_barang' => $_POST['hs_barang_detail'][$i], 
                'qty' => $_POST['qty_detail'][$i], 
                'satuan' => $_POST['satuan_detail'][$i],                 
                'harga_barang' => $_POST['harga_barang_detail'][$i], 
                'currency' => $_POST['currency_detail'][$i],
                'material' => $_POST['material_detail'][$i],
                'tkl' => $_POST['tkl_detail'][$i],
                'bop' => $_POST['bop_detail'][$i],
                'hpp' => $_POST['hpp_detail'][$i], 
            );
            $this->db->insert('trans_wo_detail', $data2);
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
        $id_header = $this->input->post('id_hidden');
        $data = array(
            'no_wo' => $this->input->post('no_wo'),
            'tgl_wo' => $this->input->post('tgl_wo'),
            'customer' => $this->input->post('customer'),
            'customer_po' => $this->input->post('customer_po'),
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
                    'no_wo' => $this->input->post('no_wo'), 
                    'kode_barang' => $_POST['kode_barang_detail'][$i], 
                    'nama_barang' => $_POST['nama_barang_detail'][$i], 
                    'spesifikasi_barang' => $_POST['spesifikasi_barang_detail'][$i], 
                    'hs_barang' => $_POST['hs_barang_detail'][$i], 
                    'qty' => $_POST['qty_detail'][$i], 
                    'satuan' => $_POST['satuan_detail'][$i],                 
                    'harga_barang' => $_POST['harga_barang_detail'][$i], 
                    'currency' => $_POST['currency_detail'][$i],
                    'material' => $_POST['material_detail'][$i],
                    'tkl' => $_POST['tkl_detail'][$i],
                    'bop' => $_POST['bop_detail'][$i],
                    'hpp' => $_POST['hpp_detail'][$i], 
                );
                $this->db->insert('trans_wo_detail', $data2);
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
                echo    '<td class="text-center"><label>'.$row->hs_barang.'</label><input type="hidden" name="hs_barang_detail[]" class="" readonly value="'.$row->hs_barang.'"></td>';
                echo    '<td class="text-right"><label>'.$row->qty.'</label><input type="hidden" name="qty_detail[]" class="" readonly value="'.$row->qty.'"></td>';
                echo    '<td class="text-center"><label>'.$row->satuan.'</label><input type="hidden" name="satuan_detail[]" class="" readonly value="'.$row->satuan.'"></td>';
                echo    '<td class="text-right"><label>'.$row->harga_barang.'</label><input type="hidden" name="harga_barang_detail[]" class="" readonly value="'.$row->harga_barang.'"></td>';
                echo    '<td class="text-center"><label>'.$row->currency.'</label><input type="hidden" name="currency_detail[]" class="" readonly value="'.$row->currency.'"></td>';                
                echo    '<td class="text-right"><label>'.$row->material.'</label><input type="hidden" name="material_detail[]" class="" readonly value="'.$row->material.'"></td>';
                echo    '<td class="text-right"><label>'.$row->tkl.'</label><input type="hidden" name="tkl_detail[]" class="" readonly value="'.$row->tkl.'"></td>';
                echo    '<td class="text-right"><label>'.$row->bop.'</label><input type="hidden" name="bop_detail[]" class="" readonly value="'.$row->bop.'"></td>';
                echo    '<td class="text-right"><label>'.$row->hpp.'</label><input type="hidden" name="hpp_detail[]" class="" readonly value="'.$row->hpp.'"></td>';
                echo    '<td><button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>';
				echo '</tr>';
				
				$i++;
            }
        }		
    }

    function get_info_barang_jadi() {
        $kode_barang = $this->input->post('kode_barang');
        $res = $this->db->where('kode_barang', $kode_barang)->get('master_barang');
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
}
