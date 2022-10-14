<?php
/**
 * poll_box.php
 * Poll box sidebox file
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009-2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */

// First check if this user has anything to display

// If the session ID is empty, it's a bot. We don't display the poll box then.
$session = zen_session_id();
if (!empty($session)) {
	
	// It's a real user. Now check if he/she has polls left to answer.
	$poll_query = $db->Execute("SELECT * FROM " . PM_TABLE_POLLS . " LEFT JOIN " . PM_TABLE_POLL_OPTIONS . " ON p_id=o_poll_id LEFT JOIN " . PM_TABLE_POLL_RESULTS . " ON (o_poll_id=r_poll_id AND r_ip='" . $_SERVER['REMOTE_ADDR'] . "') WHERE (r_ip IS NULL OR p_multivote='Y') AND p_status=1 ORDER BY p_id, o_id");
	
	// If any polls are found that the user has not responded to, continue.
	// Other wise, don't display the poll box
	if ($poll_query->RecordCount()>0) {
		$polls = array();
		$prim_poll = 0;
		while (!$poll_query->EOF) {
			$id = $poll_query->fields['p_id'];
			if ($poll_query->fields['p_prim'] == 'Y' && !isset($_SESSION['PM_LAST_POLL_ID'])) {
				$prim_poll = $id;
			}
			$oid = $poll_query->fields['o_option'];
			$polls[$id]['id'] = $poll_query->fields['p_id'];
			$polls[$id]['question'] = $poll_query->fields['p_question'];
			$polls[$id]['type'] = $poll_query->fields['p_type'];
			$polls[$id]['options'][$oid]['id'] = $poll_query->fields['o_option'];
			$polls[$id]['options'][$oid]['text'] = $poll_query->fields['o_text'];
			$polls[$id]['options'][$oid]['inpf'] = $poll_query->fields['o_inpf'];
			$poll_query->MoveNext();
		}
		// If more than 2 polls are active, we don't want the same poll to be displayed consecutively
		if (count($polls) > 1) {
			$poll_id = 0;
			if (!isset($_SESSION['PM_LAST_POLL_ID'])) {
				if ($prim_poll != 0) {
					$_SESSION['PM_LAST_POLL_ID'] = $prim_poll;
					$poll_id = $prim_poll;
				}
				else $_SESSION['PM_LAST_POLL_ID'] = 0;
			}
			if ($poll_id == 0) {
				while ($poll_id = array_rand($polls)) {
					if ($poll_id != $_SESSION['PM_LAST_POLL_ID']) {
						$_SESSION['PM_LAST_POLL_ID'] = $poll_id;
						break;
					}
				}
			}
		}
		else $poll_id = array_rand($polls);
		$poll = $polls[$poll_id];
		$title = PM_BOX_HEADING;
		$box_id = 'PollManager';
		$left_corner = false;
		$right_corner = false;
		$right_arrow = false;
		$title_link = false;
		
		// Check if there are any polls that can be shown on the overview page
		$poll_query = $db->Execute("SELECT count(p_show_cust) as count FROM " . PM_TABLE_POLLS . " WHERE p_show_cust='Y'");
		$pm_show_link = ($poll_query->fields['count'] > 0 ? true : false);
		  
		require($template->get_template_dir(PM_FILENAME_TEMPLATE, DIR_WS_TEMPLATE, $current_page_base,'sideboxes'). '/tpl_poll_box.php');
		
		require($template->get_template_dir($column_box_default, DIR_WS_TEMPLATE, $current_page_base,'common') . '/' . $column_box_default);
	}
}
?>