<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Penerimaan_Model extends CI_Model {

    var $table_header = 'acc_penerimaan_header';
    var $table_detail = 'acc_penerimaan_detail';
    var $table_customer = 'master_customer';
    var $table_akun = 'acc_master_akun';
    var $table_currency = 'master_currency';
    var $table_name_piutang_header = 'acc_piutang_header';
    var $query_header = 'qacc_penerimaan_header';

    var $column_order = array('tgl_penerimaan','kode_customer','customer_name','kode_akun_debet',
                              'nama_akun_debet','kode_akun_kredit','nama_akun_kredit','currency','no_cek',null);
    var $column_search = array('tgl_penerimaan','kode_customer','customer_name','kode_akun_debet',
                               'nama_akun_debet','kode_akun_kredit','nama_akun_kredit','currency','no_cek');
    var $order = array('id' => 'desc'); // default order 
 
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
 
    private function _get_datatables_query() {         
        $this->db->from($this->query_header);
 
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
    function get_customer() {
        $this->db->select('customer_id AS kode_customer, customer_name');
        $query = $this->db->get($this->table_customer);
        return $query->result();
    }

    function get_akun_debet() {
        $this->db->select('kode_akun AS kode_akun_debet, nama_akun AS nama_akun_debet');
        $query = $this->db->get($this->table_akun);
        return $query->result();
    }

    function get_akun_kredit() {
        $this->db->select('kode_akun AS kode_akun_kredit, nama_akun AS nama_akun_kredit');
        $query = $this->db->get($this->table_akun);
        return $query->result();
    }

    function get_currency() {
        $this->db->select('nama_currency AS currency');
        $query = $this->db->get($this->table_currency);
        return $query->result();
    }

    function get_invoice() {
        $this->db->select('*');
        $query = $this->db->get($this->table_name_piutang_header);
        return $query->result();
    }
}