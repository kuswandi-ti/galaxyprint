<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Po extends MX_Controller {
    public $data;
    var $module = 'Pembelian';
    var $title = 'Po';
    var $file_name = 'Po';
    var $table_name = '';
    function __construct()
    {
        parent::__construct();
        permission();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index()
    {
        $data = array(
            'get_supplier' => $this->main->get_supplier(),
            'get_material' => $this->main->get_material(),
            'get_currency' => $this->main->get_currency(),
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
            $row[] = $r->no_po;
            $row[] = $r->tgl_po;
            $row[] = $r->supplier;
            $row[] = $r->total;
            $row[] = $r->currency;
            $row[] = $r->grand_total;
            $row[] = $r->status_po;
            $disabled = ($r->status_po == 'CLOSE') ? 'disabled' : '';
 
            //add html for action
            $row[] = '<!--<a class="btn btn-sm btn-primary btn-xs" href="javascript:void(0)" title="Edit" onclick="edit('."'".$r->id."'".')"><i class="fa fa-pencil"></i> Edit</a>-->
                  <button type="button" class="btn btn-sm btn-danger btn-xs" '.$disabled.' href="javascript:void(0)" title="Hapus" onclick="hapus('."'".$r->id."'".')"><i class="fa fa-trash"></i> Delete</button>';
 
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
                'tgl_po' => $this->input->post('tgl_po'),
                'no_po' => $this->input->post('no_po'),
                'supplier' => $this->input->post('supplier'),
                'supplier' => $this->input->post('supplier'),
                'currency' => $this->input->post('currency'),
                'kurs' => $this->input->post('kurs'),
                'tempo' => $this->input->post('tempo'),
                'total' => $this->input->post('sub_total'),
                'potongan' => $this->input->post('potongan'),
                'ppn' => $this->input->post('ppn'),
                'grand_total' => $this->input->post('grand_total'),
                'created_at' => dateNow(),
            );

        $this->db->insert('trans_po_header', $data);
        $po_id = $this->db->insert_id();
        $kode_barang_detail = $_POST['kode_barang_detail'];
        for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
            $data2 = array(
                        'id_header' => $po_id, 
                        'kode_barang' => $_POST['kode_barang_detail'][$i], 
                        'kode_barang' => $_POST['kode_barang_detail'][$i], 
                        'nama_barang' => $_POST['nama_barang_detail'][$i], 
                        'satuan' => $_POST['satuan_detail'][$i], 
                        'qty' => $_POST['qty_detail'][$i], 
                        'harga' => $_POST['harga_detail'][$i], 
                        'currency' => $_POST['currency'], 
                    );
            $this->db->insert('trans_po_detail', $data2);
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
         $data = array(
                'nama_Po' => $this->input->post('nama_Po'),
                'nilai_kurs_idr' => $this->input->post('nilai_kurs_idr'),
                'update_terakhir' => dateNow()
            );
        $this->main->update(array('id' => $this->input->post('id')), $data);
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

    function get_info_material() {
        $kode_barang = $this->input->post('kode_barang');
        $res = $this->db->where('kode_barang', $kode_barang)->get('master_material');
        if ($res->num_rows() > 0) {
            foreach ($res->result_array() as $row) {
                $data['result'] = 'done';
                $data['res_kode_material'] = $row['kode_barang'];
                $data['res_spesifikasi_material'] = $row['spesifikasi_barang'];
                $data['res_hs_material'] = $row['hs_barang'];                
                $data['res_unit_material'] = $row['satuan_besar'];
                $data['res_hargapersat_material'] = $row['harga_satuan_besar'];
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

    function get_info_supplier() {
        $supplier_id = $this->input->post('supplier');
        $res = $this->db->query("
            select s.currency, nilai_kurs_idr kurs, tempo
            from master_supplier s, master_currency c
            where s.currency = c.nama_currency
            and supplier_id = '$supplier_id'
        ");
        if ($res->num_rows() > 0) {
            $data['result'] = 'done';
            $data['currency'] = $res->row()->currency;
            $data['kurs'] = $res->row()->kurs;
            $data['tempo'] = $res->row()->tempo;
        } else {
            $data['result'] = '';
            $data['currency'] = '';
            $data['kurs'] = '';
            $data['tempo'] = '';
        }
        
        echo json_encode($data);
    }
}
