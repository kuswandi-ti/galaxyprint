<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Akun_Default extends MX_Controller {
    public $data;
    var $module = 'master';
    var $title = 'Akun Default';
    var $file_name = 'Akun_default';
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
            'get_akun' => $this->main->get_akun(),
            'get_akun_default' => $this->main->get_data()
        );
        $this->_render_page($this->file_name.'/index', $data);
    }
    
    public function get_data()
    {
        $data = $this->main->get_data();
        echo json_encode($data);
    }

    public function save()
    {
        $data = array(
            'hutang' => $this->input->post('hutang'),
            'penerimaan_barang' => $this->input->post('penerimaan_barang'),
            'potongan_pembelian' => $this->input->post('potongan_pembelian'),
            'ppn_masukan' => $this->input->post('ppn_masukan'),
            'bahan_baku' => $this->input->post('bahan_baku'),
            'bahan_penolong' => $this->input->post('bahan_penolong'),
            'bahan_sparepart' => $this->input->post('bahan_sparepart'),
            'barang_wip' => $this->input->post('barang_wip'),
            'barang_jadi' => $this->input->post('barang_jadi'),
            'penjualan_produk' => $this->input->post('penjualan_produk'),
            'piutang' => $this->input->post('piutang'),
            'pengiriman_barang' => $this->input->post('pengiriman_barang'),
            'potongan_penjualan' => $this->input->post('potongan_penjualan'),
            'ppn_keluaran' => $this->input->post('ppn_keluaran'),
            'biaya_bahan_baku' => $this->input->post('biaya_bahan_baku'),
            'biaya_tkl' => $this->input->post('biaya_tkl'),
            'biaya_overhead' => $this->input->post('biaya_overhead')
        );
        $this->main->save($data);
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
}
