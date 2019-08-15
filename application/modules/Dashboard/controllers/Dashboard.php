<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MX_Controller {
    public $data;
    var $module = 'Dashboard';
    var $title = 'Dashboard';
    var $file_name = 'Dashboard';
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
        // $this->data['menu']=$this->main->index();
        $this->_render_page($this->file_name.'/index', $this->data);
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
                    // $this->template->add_css($this->module.'/dashboard.css?v4.0.1');
                    // $this->template->add_plugin_js('datatables.net/js/dataTables.js'); 
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
