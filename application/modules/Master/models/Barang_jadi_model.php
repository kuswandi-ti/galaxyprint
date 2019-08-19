<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Barang_Jadi_model extends CI_Model {
 
    var $table = 'master_barang';
    var $column_order = array('id','kode_barang','nama_barang','kode_kategori','satuan','currency','aktif', null);
    var $column_search = array('id','kode_barang','nama_barang','kode_kategori','satuan','currency','aktif');
    var $order = array('id' => 'asc'); // default order 
 
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
 
    private function _get_datatables_query()
    {
        /*
        $this->db->select('a.id as id,a.kode_barang as kode_barang,a.nama_barang as nama_barang,
                           a.kode_kategori as kode_kategori,b.nama_kategori as nama_kategori,
                           a.spesifikasi_barang as spesifikasi_barang,a.hs_barang as hs_barang,
                           a.satuan as satuan,a.hpp as hpp,a.harga_barang as harga_barang,
                           a.currency as currency,a.aktif as aktif');
        //$this->db->from('master_barang a');
        //$this->db->join('master_kategori b','a.kode_kategori = b.kode_kategori', 'inner');
        */
        $this->db->from($this->table);
 
        $i = 0;
     
        foreach ($this->column_search as $item) // loop column 
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                 
                if($i===0) // first loop
                {
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
 
                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }
         
        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
 
    function get_datatables()
    {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }
 
    function count_filtered()
    {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }
 
    public function count_all()
    {
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }
 
    public function get_by_id($id)
    {
        $this->db->from($this->table);
        $this->db->where('id',$id);
        $query = $this->db->get();
 
        return $query->row();
    }
 
    public function save($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }
 
    public function update($where, $data)
    {
        $this->db->update($this->table, $data, $where);
        return $this->db->affected_rows();
    }
 
    public function delete_by_id($id)
    {
        $this->db->where('id', $id);
        $this->db->delete($this->table);
    }
 
    /* Combo (select2) */
    function get_kategori_barang()
    {
        $this->db->select('*');
        $query = $this->db->get('master_kategori');
        return $query->result();
    }

    function get_currency()
    {
        $this->db->select('*');
        $query = $this->db->get('master_currency');
        return $query->result();
    }

    function get_satuan()
    {
        $this->db->select('*');
        $query = $this->db->get('master_satuan');
        return $query->result();
    }
}