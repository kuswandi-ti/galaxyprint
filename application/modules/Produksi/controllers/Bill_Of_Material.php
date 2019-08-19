<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Bill_of_material extends MX_Controller {
    public $data;
    var $module = 'produksi';
    var $title = 'Bill of Material';
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
            'get_currency' => $this->main->get_currency(),
        );
        $this->_render_page($this->file_name.'/index', $data);
    }

    /*public function ajax_list()
    {
        $list = $this->main->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $r) {
            $row = array();
            $row[] = $r->kode_barang;
            $row[] = $r->nama_barang;
            $row[] = $r->spesifikasi_barang;
            $row[] = $r->satuan;
            $row[] = $r->aktif;
 
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
                'kode_kategori' => $this->input->post('kode_kategori'),
                'spesifikasi_barang' => $this->input->post('spesifikasi_barang'),
                'hs_barang' => $this->input->post('hs_barang'),
                'satuan' => $this->input->post('satuan'),
                'hpp' => $this->input->post('hpp'),
                'harga_barang' => $this->input->post('harga_barang'),
                'currency' => $this->input->post('currency'),
                'aktif' => $this->input->post('aktif'),
                'created_at' => dateNow()
            );
        $insert = $this->main->save($data);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
        $data = array(
            'kode_barang' => $this->input->post('kode_barang'),
            'nama_barang' => $this->input->post('nama_barang'),
            'kode_kategori' => $this->input->post('kode_kategori'),
            'spesifikasi_barang' => $this->input->post('spesifikasi_barang'),
            'hs_barang' => $this->input->post('hs_barang'),
            'satuan' => $this->input->post('satuan'),
            'hpp' => $this->input->post('hpp'),
            'harga_barang' => $this->input->post('harga_barang'),
            'currency' => $this->input->post('currency'),
            'aktif' => $this->input->post('aktif')
        );
        $this->main->update(array('id' => $this->input->post('id')), $data);
        echo json_encode(array("status" => TRUE));
    }
 
    public function ajax_delete($id)
    {
        $this->main->delete_by_id($id);
        echo json_encode(array("status" => TRUE));
    }*/

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
                    $this->template->add_plugin_js('jquery-datatable\media\js\jquery.dataTables.min.js'); 
                    $this->template->add_plugin_js('jquery-datatable\media\js\dataTables.bootstrap.js'); 
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
		$res = $this->main->get_info_barang_jadi($kode_barang);
		if ($res->num_rows() > 0) {
			foreach ($res->result_array() as $row) {
				$data['result'] = 'done';
                $data['res_nama_barang'] = $row['nama_barang'];
                $data['res_hs_barang'] = $row['hs_barang'];
                $data['res_spesifikasi'] = $row['spesifikasi_barang'];                
                $data['res_satuan'] = $row['satuan'];
			}
		} else {
			$data['result'] = '';
            $data['res_nama_barang'] = '';
            $data['res_hs_barang'] = '';
            $data['res_spesifikasi'] = '';                
            $data['res_satuan'] = '';
		}
		
		echo json_encode($data);
    }

    function get_info_material() {
		$kode_barang = $this->input->post('kode_barang');
		$res = $this->main->get_info_material($kode_barang);
		if ($res->num_rows() > 0) {
			foreach ($res->result_array() as $row) {
				$data['result'] = 'done';
                $data['res_kode_material'] = $row['kode_barang'];
                $data['res_spesifikasi_material'] = $row['spesifikasi_barang'];
                $data['res_hs_material'] = $row['hs_barang'];                
                $data['res_unit_material'] = $row['satuan_kecil'];
                $data['res_hargapersat_material'] = $row['harga_satuan_kecil'];
			}
		} else {
			$data['result'] = '';
            $data['res_kode_material'] = '';
            $data['res_spesifikasi_material'] = '';
            $data['res_hs_material'] = '';                
            $data['res_unit_material'] = '';
            $data['res_hargapersat_material'] = '0';
		}
		
		echo json_encode($data);
    }
}
