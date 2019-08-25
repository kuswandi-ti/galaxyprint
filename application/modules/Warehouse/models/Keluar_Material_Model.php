<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Keluar_material_Model extends CI_Model {
 
    var $table_header = 'trans_keluar_material_header';
    var $table_detail = 'trans_keluar_material_detail';
    var $table_work_order = 'trans_wo_header';
    var $table_jenis_dokumen = 'master_dokumen';
    var $table_material = 'master_material';
    var $table_jenis_keluar = 'master_jenis_keluar';

    var $column_order = array('tgl_keluar','tujuan','no_bukti','no_aju','jenis_dokumen','no_dokumen','tgl_dokumen',null);
    var $column_search = array('tgl_keluar','tujuan','no_bukti','no_aju','jenis_dokumen','no_dokumen','tgl_dokumen');
    var $order = array('id' => 'desc'); // default order 
 
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
 
    private function _get_datatables_query() {         
        $this->db->from($this->table_header);
 
        $i = 0;
     
        foreach ($this->column_search as $item) { // loop column 
            if ($_POST['search']['value']) { // if datatable send POST for search
                if ($i===0) { // first loop
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                } else {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
 
                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }
         
        if (isset($_POST['order'])) { // here order processing
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } else if(isset($this->order)) {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
 
    function get_datatables() {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }
 
    function count_filtered() {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }
 
    public function count_all() {
        $this->db->from($this->table_header);
        return $this->db->count_all_results();
    }
 
    public function get_by_id($id) {
        $this->db->from($this->table_header);
        $this->db->where('id',$id);
        $query = $this->db->get();
 
        return $query->row();
    }
 
    public function save($data) {
        $this->db->insert($this->table_header, $data);
        return $this->db->insert_id();
    }
 
    public function update($where, $data) {
        $this->db->update($this->table_header, $data, $where);
        return $this->db->affected_rows();
    }
 
    public function delete_by_id($id) {
        // Header
        $this->db->where('id', $id);
        $this->db->delete($this->table_header);

        // Detail
        $this->db->where('id_header', $id);
        $this->db->delete($this->table_detail);
    }

    public function delete_detail($id) {
        // Detail
        $this->db->where('id_header', $id);
        $this->db->delete($this->table_detail);
    }

    function show_detail($id_header) {
		return $this->db->query("SELECT * FROM ".$this->table_detail." WHERE id_header = '".$id_header."' ORDER BY id");
    }

    /* Combo (select2) */
    function get_work_order() {
        $this->db->select('*');
        $query = $this->db->get($this->table_work_order);
        return $query->result();
    }

    function get_jenis_dokumen() {
        $this->db->select('*');
        $query = $this->db->get($this->table_jenis_dokumen);
        return $query->result();
    }

    function get_material() {
        $this->db->select('*');
        $query = $this->db->get($this->table_material);
        return $query->result();
    }

    function get_jenis_keluar() {
        $this->db->select('*');
        $query = $this->db->get($this->table_jenis_keluar);
        return $query->result();
    }
}