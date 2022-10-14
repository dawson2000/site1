<?php
/**
 * header.php
 * Poll Manager - poll overview page header
 * Version 1.2
 * 
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009-2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */

// Get the file with the user defined HTML 
$define_page = zen_get_file_directory(DIR_WS_LANGUAGES . $_SESSION['language'] . '/html_includes/', PM_FILENAME_DEFINE_POLL_RESULT_PAGE, 'false');
 
require(DIR_WS_MODULES . zen_get_module_directory('require_languages.php'));

	// Start building the info with detail poll info
	$poll = $db->Execute("SELECT p_id, p_question, p_type, o_text, count(r_option) as count, o_inpf FROM " . PM_TABLE_POLLS . " LEFT JOIN " . PM_TABLE_POLL_OPTIONS . " ON p_id=o_poll_id LEFT JOIN " . PM_TABLE_POLL_RESULTS . " ON (o_poll_id=r_poll_id AND o_option=r_option) WHERE p_show_cust='Y' GROUP BY o_poll_id, o_option order by p_id, o_option");
	$vtotal = 0;
	$ppoll = array();
	$last_id = 0;
	while(!$poll->EOF) {
		if ($poll->fields['p_id'] > $last_id) $last_id = $poll->fields['p_id'];
		$ppoll[$poll->fields['p_id']]['question'] = $poll->fields['p_question'];
		$ppoll[$poll->fields['p_id']]['type'] = $poll->fields['p_type'];
		$ppoll[$poll->fields['p_id']]['option'][] = array('text' => ($poll->fields['o_inpf'] == 1 ? PM_USER_INPUT_VOTES : $poll->fields['o_text']), 'count' => $poll->fields['count']);
		if ($poll->fields['p_type'] == 0) $ppoll[$poll->fields['p_id']]['voters'] += $poll->fields['count'];
		
		// If the poll type is radio, we caclulate the percentage
		// If the poll type is checkbox, we calculate as % of the highest value
		if ($poll->fields['p_type'] == '0') $ppoll[$poll->fields['p_id']]['vtotal'] += $poll->fields['count'];
		else if ($ppoll[$poll->fields['p_id']]['vtotal'] < $poll->fields['count']) $ppoll[$poll->fields['p_id']]['vtotal'] = $poll->fields['count'];
		$poll->MoveNext();
	}
	// Add first/last date/time info
	$stamps = $db->Execute("SELECT DISTINCT(r_poll_id), DATE_FORMAT(MIN(r_timestamp),'" . PM_VOTE_DATE_FORMAT . "') as first, DATE_FORMAT(MAX(r_timestamp),'" . PM_VOTE_DATE_FORMAT . "') as last FROM " . PM_TABLE_POLL_RESULTS . " WHERE 1 GROUP BY r_poll_id");
	while (!$stamps->EOF) {
		if (isset($ppoll[$stamps->fields['r_poll_id']])) {
			$ppoll[$stamps->fields['r_poll_id']]['first'] = $stamps->fields['first'];
			$ppoll[$stamps->fields['r_poll_id']]['last'] = $stamps->fields['last'];
		}
		$stamps->MoveNext();
	}
	// For multiple choice polls, add the number of unique IP's as number of voters
	foreach ($ppoll as $poll_id => $poll) {
		if ($poll['type'] == 1) {
			$rvoters = $db->Execute("SELECT count(ip) i_count FROM (SELECT DISTINCT(r_ip) as ip FROM " . PM_TABLE_POLL_RESULTS . " WHERE r_poll_id='" .$poll_id . "' GROUP BY r_ip) as t");
			while(!$rvoters->EOF) {
				$ppoll[$poll_id]['voters'] = $rvoters->fields['i_count'];
				$rvoters->MoveNext();
			}
		}
	}
			
	krsort($ppoll);

$breadcrumb->add(NAVBAR_TITLE);
?>
