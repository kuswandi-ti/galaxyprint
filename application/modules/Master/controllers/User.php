<?php defined('BASEPATH') OR exit('No direct script access allowed');

class User extends MX_Controller {
    public $data;
    var $module = 'User';
    var $title = 'User';
    var $file_name = 'User';
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
        $data['users']=$this->main->index();
        $this->_render_page($this->file_name.'/index', $data);
    }

    public function add(){
    	$data = array(
    				'username' => $_POST['username'], 
    				'email' => $_POST['email'], 
    				'fullname' => $_POST['fullname'], 
    				'role_id' => $_POST['role_id'], 
    				'password' => $_POST['password'], 
    			);
    	$this->db->insert('user', $data);
    	echo 'Berhasil';
    }

    function reload_table(){
    	$data['users']=$this->main->index();
        echo json_encode($data['users']);
        // $this->_render_page($this->file_name.'/table', $data);
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
                    $this->template->add_plugin_css('data-table/css/jquery.dataTables.css');
                    $this->template->add_plugin_css('data-table/css/dataTables.bootstrap4.min.css');
                    $this->template->add_plugin_css('data-table/css/responsive.bootstrap.min.css');
                    $this->template->add_plugin_css('data-table/css/responsive.jqueryui.min.css');
                    $this->template->add_plugin_js('data-table/js/jquery.dataTables.js'); 
                    $this->template->add_plugin_js('data-table/js/jquery.dataTables.min.js'); 
                    $this->template->add_plugin_js('data-table/js/dataTables.bootstrap4.min.js'); 
                    $this->template->add_plugin_js('data-table/js/dataTables.responsive.min.js'); 
                    $this->template->add_plugin_js('data-table/js/responsive.bootstrap.min.js'); 
                    $this->template->add_js('init/data-table.js'); 
                    $this->template->add_js('master/user/index.js'); 
                }

                if(in_array($view, array($this->file_name.'/table')))
                {
                    $this->template->set_layout('default'); 
                    // $this->template->add_css($this->module.'/User.css?v4.0.1');
                    $this->template->add_plugin_css('data-table/css/jquery.dataTables.css');
                    $this->template->add_plugin_css('data-table/css/dataTables.bootstrap4.min.css');
                    $this->template->add_plugin_css('data-table/css/responsive.bootstrap.min.css');
                    $this->template->add_plugin_css('data-table/css/responsive.jqueryui.min.css');
                    $this->template->add_plugin_js('data-table/js/jquery.dataTables.js'); 
                    $this->template->add_plugin_js('data-table/js/jquery.dataTables.min.js'); 
                    $this->template->add_plugin_js('data-table/js/dataTables.bootstrap4.min.js'); 
                    $this->template->add_plugin_js('data-table/js/dataTables.responsive.min.js'); 
                    $this->template->add_plugin_js('data-table/js/responsive.bootstrap.min.js'); 
                    $this->template->add_js('init/data-table.js'); 
                    $this->template->add_js('master/user/index.js'); 
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
