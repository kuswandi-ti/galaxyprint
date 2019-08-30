<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Akun_model extends CI_Model {
 
    var $table = 'acc_akun_master';
 
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function get_data()
    {
        $this->db->select('*');
        $this->db->from($this->table);
        $query = $this->db->get();
        return $query->row();
    }

    public function count_all()
    {
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    public function save($data)
    {
        if ($this->count_all() == 0) {
            $this->db->insert($this->table, $data);
            return $this->db->insert_id();
        } else {
            $this->db->update($this->table, $data);
            return $this->db->affected_rows();
        }
        
    }
 
    /* Combo (select2) */
    function get_akun()
    {
        $this->db->select('*');
        $this->db->order_by('kode_akun');
        $query = $this->db->get('acc_master_akun');
        return $query->result();
    }
}