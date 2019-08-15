<?php 
    class User_model extends CI_Model {
	
	function __construct() 
	{
		parent::__construct();
	}

	function index(){
		return $this->db->get('user')->result();
	}
}