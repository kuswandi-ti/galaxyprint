<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Keuangan extends MX_Controller {
    public $data;
    var $module = 'laporan';
    var $title = 'Laporan Keuangan';
    var $file_name = 'keuangan';
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
        $data['title'] = $this->title;
        $this->_render_page($this->file_name.'/index', $data);
    }

    function get_result(){
        $id = $this->input->post('id');
        if($id == 'b'){
            $data['kode_akun'] = $this->db->order_by('kode_akun')->get('acc_master_akun')->result();
            $data['ci'] = $this;

            $this->load->view('keuangan/buku_besar', $data);
        }elseif($id == 'n'){
            $data['ci'] = $this;

            $this->load->view('keuangan/neraca', $data);
        }elseif($id == 'l'){
            $data['ci'] = $this;

            $this->load->view('keuangan/laba', $data);
        }
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
