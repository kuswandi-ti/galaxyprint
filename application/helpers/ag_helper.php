<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

	if(!function_exists('dateNow')){
		function dateNow()
		{
			return date('Y-m-d H:i:s');
		}
	}