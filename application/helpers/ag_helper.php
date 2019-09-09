<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

	if(!function_exists('dateNow')){
		function dateNow()
		{
			return date('Y-m-d H:i:s');
		}
	}

	function permission(){
		$CI =& get_instance();
		if (!$CI->ion_auth->logged_in())
		{
			redirect('Auth/login', 'refresh');
		}else{
			return true;
		}
	}

	if (!function_exists('getValue')){
		function getValue($field,$table,$filter=array(),$order=NULL)
		{
			$CI =& get_instance();
			$CI->db->select($field);
			foreach($filter as $key=> $value)
			{
				$exp = explode("/",$value);
				if(isset($exp[1]))
				{
					if($exp[0] == "where") $CI->db->where($key, $exp[1]);
					else if($exp[0] == "like") $CI->db->like($key, $exp[1]);
					else if($exp[0] == "order") $CI->db->order_by($key, $exp[1]);
					else if($key == "limit") $CI->db->limit($exp[1], $exp[0]);
				}
				
				if($exp[0] == "group") $CI->db->group_by($key);
			}
			
			if($order) $CI->db->order_by($order);
			$q = $CI->db->get($table);
			foreach($q->result_array() as $r)
			{
				return $r[$field];
			}
			return 0;
		}
	}