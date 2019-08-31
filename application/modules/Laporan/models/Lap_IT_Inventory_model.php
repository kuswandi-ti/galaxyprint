<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Lap_IT_Inventory_model extends CI_Model {

    var $data_laporan_1     = 'Laporan IT Inventory';

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    function get_dokumen() {
        $this->db->select('*');
        $query = $this->db->get('master_dokumen');
        return $query->result();
    }
}