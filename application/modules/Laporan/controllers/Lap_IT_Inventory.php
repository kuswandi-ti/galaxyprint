<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Lap_IT_Inventory extends MX_Controller {
    public $data;

    var $module         = 'laporan';
    var $title          = 'Laporan IT Inventory';
    var $file_name      = 'lap_it_inventory';
    var $table_name     = '';

    function __construct() {
        parent::__construct();
        permission();
        $this->load->library('session');
        $this->load->model($this->file_name.'_model', 'main');
    }

    public function index() {
        $data = array(
            'get_dokumen'   => $this->main->get_dokumen(),
        );
        $this->_render_page($this->file_name.'/index', $data);
    }

    function _render_page($view, $data=null, $render=false) {
        $data = (empty($data)) ? $this->data : $data;
        if ( ! $render) {
            $this->load->library('template');
            if(in_array($view, array($this->file_name.'/index'))) {
                $this->template->set_layout('default'); 
                $this->template->add_plugin_css('bootstrap-datepicker/css/datepicker3.css');
                $this->template->add_plugin_js('bootstrap-datepicker/js/bootstrap-datepicker.js'); 
                $this->template->add_plugin_js('moment/moment.min.js'); 
                $this->template->add_js($this->module.'/'.$this->file_name.'.js'); 
            }
            if ( ! empty($data['title'])) {
                $this->template->set_title($data['title']);
            }
            $this->template->load_view($view, $data);
        } else {
            return $this->load->view($view, $data, TRUE);
        }
    }

    function laporan_1() {
        $dokumen        = $this->input->get('dokumen');
        $periode_awal   = $this->input->get('periode_awal');
        $periode_akhir  = $this->input->get('periode_akhir');

        $data = array(
            'dokumen'       => $dokumen,
            'periode_awal'  => $periode_awal,
            'periode_akhir' => $periode_akhir,
        );

        return $this->load->view($this->file_name.'/laporan_1', $data);
    }

    function laporan_2() {
        $dokumen        = $this->input->get('dokumen');
        $periode_awal   = $this->input->get('periode_awal');
        $periode_akhir  = $this->input->get('periode_akhir');

        $data = array(
            'dokumen'       => $dokumen,
            'periode_awal'  => $periode_awal,
            'periode_akhir' => $periode_akhir,
        );

        return $this->load->view($this->file_name.'/laporan_2', $data);
    }

    function laporan_3() {
        $dokumen        = $this->input->get('dokumen');
        $periode_awal   = $this->input->get('periode_awal');
        $periode_akhir  = $this->input->get('periode_akhir');

        $data = array(
            'dokumen'       => $dokumen,
            'periode_awal'  => $periode_awal,
            'periode_akhir' => $periode_akhir,
        );

        return $this->load->view($this->file_name.'/laporan_3', $data);
    }

    function laporan_4() {
        $dokumen        = $this->input->get('dokumen');
        $periode_awal   = $this->input->get('periode_awal');
        $periode_akhir  = $this->input->get('periode_akhir');

        $data = array(
            'dokumen'       => $dokumen,
            'periode_awal'  => $periode_awal,
            'periode_akhir' => $periode_akhir,
        );

        return $this->load->view($this->file_name.'/laporan_4', $data);
    }

    function laporan_5() {
        $dokumen        = $this->input->get('dokumen');
        $periode_awal   = $this->input->get('periode_awal');
        $periode_akhir  = $this->input->get('periode_akhir');

        $data = array(
            'dokumen'       => $dokumen,
            'periode_awal'  => $periode_awal,
            'periode_akhir' => $periode_akhir,
        );

        return $this->load->view($this->file_name.'/laporan_5', $data);
    }

    function laporan_6() {
        $dokumen        = $this->input->get('dokumen');
        $periode_awal   = $this->input->get('periode_awal');
        $periode_akhir  = $this->input->get('periode_akhir');

        $data = array(
            'dokumen'       => $dokumen,
            'periode_awal'  => $periode_awal,
            'periode_akhir' => $periode_akhir,
        );

        return $this->load->view($this->file_name.'/laporan_6', $data);
    }

    function laporan_7() {
        $dokumen        = $this->input->get('dokumen');
        $periode_awal   = $this->input->get('periode_awal');
        $periode_akhir  = $this->input->get('periode_akhir');

        $data = array(
            'dokumen'       => $dokumen,
            'periode_awal'  => $periode_awal,
            'periode_akhir' => $periode_akhir,
        );

        return $this->load->view($this->file_name.'/laporan_7', $data);
    }
}
