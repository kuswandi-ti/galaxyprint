<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Pengiriman_model extends CI_Model {
 
    var $table = 'trans_keluar_barang_header';
    var $column_order = array('tgl_keluar', null);
    var $column_search = array('tgl_keluar');
    var $order = array('id' => 'desc'); // default order 
 
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
 
    private function _get_datatables_query()
    {
         
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
    function get_customer()
    {
        return $this->db->query("
            Select c.customer_id, w.customer, c.customer_name
            from trans_wo_header w, master_customer c
            where w.customer = c.customer_id
            and wo_status <> 'CLOSE'
            ");
    }

    function get_gudang()
    {
        $this->db->select('*');
        $query = $this->db->where('aktif', 'Y')->where('jenis', 'FG')->get('master_gudang');
        return $query->result();
    }
    
    function get_dokumen()
    {
        $this->db->select('*');
        $query = $this->db->get('master_dokumen');
        return $query->result();
    }

    function get_barang()
    {
        $this->db->select('*');
        $query = $this->db->get('master_barang');
        return $query->result();
    }

    function get_currency()
    {
        $this->db->select('*');
        $query = $this->db->get('master_currency');
        return $query->result();
    }
 
}