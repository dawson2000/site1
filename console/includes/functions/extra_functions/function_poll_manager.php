<?php
/**
 * functions_poll_manager.php
 * Poll Manager extra functions
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009/2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */
 
if (!defined(zen_get_ip_address)) {
  function zen_get_ip_address() {
    if (isset($_SERVER)) {
      if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
      } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
      } else {
        $ip = $_SERVER['REMOTE_ADDR'];
      }
    } else {
      if (getenv('HTTP_X_FORWARDED_FOR')) {
        $ip = getenv('HTTP_X_FORWARDED_FOR');
      } elseif (getenv('HTTP_CLIENT_IP')) {
        $ip = getenv('HTTP_CLIENT_IP');
      } else {
        $ip = getenv('REMOTE_ADDR');
      }
    }

    return $ip;
  }
	
}

function PMAddEmptyOption($optarray) {
	
	$j = count($optarray) + 1;
	$optarray[$j]["option"] = $j;
	$optarray[$j]["text"] = "";
	$optarray[$j]["inpf"] = "";
	
	return $optarray;
}

function PMCheckInput($variable, $default) {
	
	if (isset($_GET[$variable])) return $_GET[$variable];
	else return $default;
}
?>