<?php
/**
 * zcrpc.php
 * AJAX call response for Poll Box 
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009/2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */
 
error_reporting(-1);
require('includes/application_top.php');

$action = $_GET['action'];
switch ($action) {
	case 'process_poll':
		$poll_id = $_GET['poll_id'];
		$vote_n = 1;
		$vote = 'vote1';
		$vote_text = 'vote_text1';
		$vote_ok = false;
		while (isset($_GET[$vote])) {
			if ($_GET[$vote] == 'true') {
				if (!isset($_GET[$vote_text]) || (isset($_GET[$vote_text]) && $_GET[$vote_text] != '')) {
					$result = $db->Execute("INSERT INTO " . PM_TABLE_POLL_RESULTS . " SET r_ip='" . $_SERVER['REMOTE_ADDR'] . "', r_poll_id='" . $_GET['poll_id'] . "', r_option='" . $vote_n . "'" . (isset($_GET[$vote_text]) ? ", r_option_text='" . $_GET[$vote_text] . "'" : ""));
					$vote_ok = true;
				}
			}
			$vote_n++;
			$vote = 'vote' . $vote_n;
			$vote_text = 'vote_text' . $vote_n;
		}
		if ($vote_ok) {
			
			$poll = $db->Execute("SELECT p_question, o_text, count(r_option) as count, o_inpf FROM " . PM_TABLE_POLLS . " LEFT JOIN " . PM_TABLE_POLL_OPTIONS . " ON p_id=o_poll_id LEFT JOIN " . PM_TABLE_POLL_RESULTS . " ON (o_poll_id=r_poll_id AND o_option=r_option) WHERE p_id='" . $_GET['poll_id'] . "' GROUP BY o_option");
			$vtotal = 0;
			while(!$poll->EOF) {
				$ppoll['question'] = $poll->fields['p_question'];
				$ppoll['option'][] = array('text' => ($poll->fields['o_inpf'] == 1 ? PM_USER_INPUT_VOTES : $poll->fields['o_text']), 'count' => $poll->fields['count']);
				// If the poll type is radio, we caclulate the percentage
				// If the poll type is checkbox, we calculate as % of the highest value
				if ($_GET['poll_type'] == '0') $vtotal += $poll->fields['count'];
				else if ($vtotal < $poll->fields['count']) $vtotal = $poll->fields['count'];
				$poll->MoveNext();
			}
			// Call the template to print the results
			require($template->get_template_dir(PM_FILENAME_TEMPLATE, DIR_WS_TEMPLATE, $current_page_base,'sideboxes'). '/tpl_poll_box_result.php');
		}
		break;
	default:
		break;
}
exit;
?>