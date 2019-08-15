<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends MX_Controller {
    public $data;
    var $module = 'Auth';
    var $title = 'Auth';
    var $file_name = 'Auth';
    var $table_name = '';
    function __construct()
    {
        parent::__construct();
        // $this->load->database();
        $this->load->library('session');
        $this->load->helper('url');
    }

    public function index()
    {
        $this->_render_page('Auth/index', $this->data);
    }

    public function do_login(){
        // 
        $num = getAll('users', array('username'=>'where/'.$_POST['username'], 'password'=>'where/'.$_POST['password'], 'status'=>'where/1'))->num_rows();
        if($num > 0){
            $this->session->set_userdata('user_login', $_POST['username']);
            redirect(base_url('Admin'));
        }else{
            echo "Username atau Password Salah...!!!";
        }
    }

    function logout(){
        $this->session->sess_destroy();
        redirect(base_url('Admin'));
    }

    function _render_page($view, $data=null, $render=false)
    {
        $data = (empty($data)) ? $this->data : $data;
        if ( ! $render)
        {
            $this->load->library('template');

                if(in_array($view, array($this->file_name.'/index')))
                {
                    $this->template->set_layout('single');
                     $this->template->add_css('Auth/login-v2.minfd53.css?v4.0.1'); 
                     
                     // $this->template->add_plugin_css('datatables.net-bs/css/dataTables.bootstrap.min.css'); 
                    
                    // $this->template->add_plugin_js('datatables.net-buttons/js/dataTables.buttons.min.js');
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
