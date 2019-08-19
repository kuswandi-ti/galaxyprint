<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Subcon extends MX_Controller {
    public $data;
    var $module = 'master';
    var $title = 'Subcon';
    var $file_name = 'subcon';
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
            'get_negara' => $this->main->get_negara(),
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
            $row[] = $r->subcon_id;
            $row[] = $r->subcon_name;
            $row[] = $r->subcon_contact;
            $row[] = $r->active;
 
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
                'subcon_id' => $this->input->post('subcon_id'),
                'subcon_name' => $this->input->post('subcon_name'),
                'subcon_address' => $this->input->post('subcon_address'),
                'subcon_country' => $this->input->post('subcon_country'),
                'subcon_contact' => $this->input->post('subcon_contact'),
                'subcon_phone' => $this->input->post('subcon_phone'),
                'currency' => $this->input->post('currency'),
                'tempo' => $this->input->post('tempo'),
                'active' => $this->input->post('active'),
                'created_at' => dateNow()
            );
        $insert = $this->main->save($data);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
        $data = array(
            'subcon_id' => $this->input->post('subcon_id'),
            'subcon_name' => $this->input->post('subcon_name'),
            'subcon_address' => $this->input->post('subcon_address'),
            'subcon_country' => $this->input->post('subcon_country'),
            'subcon_contact' => $this->input->post('subcon_contact'),
            'subcon_phone' => $this->input->post('subcon_phone'),
            'currency' => $this->input->post('currency'),
            'tempo' => $this->input->post('tempo'),
            'active' => $this->input->post('active')
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
