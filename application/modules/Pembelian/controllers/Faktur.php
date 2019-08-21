<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Faktur extends MX_Controller {
    public $data;
    var $module = 'Pembelian';
    var $title = 'Faktur';
    var $file_name = 'Faktur';
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
            'get_supplier' => $this->main->get_supplier()
        );
        $data['title'] = $this->title;
        $this->_render_page($this->file_name.'/index', $data);
    }

    public function ajax_list()
    {
        $list = $this->main->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $r) {
            $row = array();
            $row[] = $r->tgl_hutang;
            $row[] = $r->no_referensi;
            $row[] = $r->no_invoice;
            $row[] = $r->supplier;
            $row[] = $r->total_hutang;
            $row[] = $r->currency;
            $row[] = $r->keterangan;
            $row[] = $r->jatuh_tempo;
            $row[] = $r->status_hutang;
 
            //add html for action
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
                'tgl_hutang' => $this->input->post('tgl_hutang'),
                'supplier' => $this->input->post('supplier'),
                'no_referensi' => $this->input->post('no_po'),
                'no_invoice' => $this->input->post('no_invoice'),
                'keterangan' => $this->input->post('keterangan'),
                'kurs' => $this->input->post('kurs'),
                'currency' => $this->input->post('currency'),
                // 'jatuh_tempo' => $this->input->post('tempo'),
                'total_hutang' => $this->input->post('total'),
                'potongan' => $this->input->post('potongan'),
                'ppn' => $this->input->post('ppn'),
                'grand_total' => $this->input->post('grand_total'),
                'created_at' => dateNow(),
            );

        $this->db->insert('acc_hutang', $data);
        $id_header = $this->db->insert_id();
        $kode_barang_detail = $_POST['kode_barang_detail'];
        for ($i=0; $i < sizeof($kode_barang_detail); $i++) { 
            $data2 = array(
                        'id_header' => $id_header, 
                        'kode_barang' => $_POST['kode_barang_detail'][$i], 
                        'nama_barang' => $_POST['nama_barang_detail'][$i], 
                        'satuan' => $_POST['satuan_detail'][$i], 
                        'qty' => $_POST['qty_detail'][$i], 
                        'harga' => $_POST['harga_detail'][$i], 
                        'currency' => $_POST['currency'], 
                        'kurs' => $_POST['kurs'], 
                    );
            $this->db->insert('acc_hutang_detail', $data2);
        }
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
         $data = array(
                'nama_Faktur' => $this->input->POST('nama_Faktur'),
                'nilai_kurs_idr' => $this->input->POST('nilai_kurs_idr'),
                'update_terakhir' => dateNow()
            );
        $this->main->update(array('id' => $this->input->POST('id')), $data);
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

    function get_info_po(){
        $supplier_id = $this->input->post('supplier_id',TRUE);
        $data = $this->db->query("
            SELECT * FROM TRANS_PO_HEADER
            WHERE STATUS_PO <> 'Close'
            and supplier = '$supplier_id'
        ")->result();
        echo json_encode($data);
    }

    function get_info_from_po(){
        $no_po = $this->input->post('no_po',TRUE);
        $data = $this->db->query("
            SELECT currency, kurs, tempo FROM TRANS_PO_HEADER
            WHERE no_po  = '$no_po'
        ")->row();

        $data2 = $this->db->query("
            SELECT nama_barang, kode_barang, qty, satuan, harga, qty*harga total
            FROM trans_po_header h, trans_po_detail d
            WHERE h.id = d.id_header
            and h.no_po = '$no_po'
            ")->result();
        echo json_encode(array('header'=>$data, 'detail'=>$data2));
    }
}
