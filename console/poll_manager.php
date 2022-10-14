<?php
/**
 * poll_manager.php
 * Poll Manager Admin Interface
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009/2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */
 error_reporting(-1);
require('includes/application_top.php');

// Initialise
$action = PMCheckInput("action", "");

$poll_id = PMCheckInput("poll_id", "");

$ip = PMCheckInput("ip", "");

$poll_descr = PMCheckInput("poll_descr", "");

$poll_type = PMCheckInput("poll_type", "R");

$poll_multivote = PMCheckInput("poll_multivote", "N");

$poll_prim = PMCheckInput("poll_prim", "N");

$poll_status = PMCheckInput("poll_status", "I");

$poll_question = PMCheckInput("poll_question", "");

$poll_show_cust = PMCheckInput("poll_show_cust", "N");

$headertext = PM_LIST_HEADER;

$options = array();

/* The following actions are defined:
 * - no action    	 : just display the list page
 * - new_poll    	 : display the empty page to enter a new poll
 * - edit_poll   	 : display the fields for the specified poll on the edit/add page
 * - add_poll    	 : adds the just entered poll to the DB from the incoming variables; returns to the list page
 * - add_option  	 : adds an empty option to the poll that is being edited; returns to the edit/add page
 * - delete_poll 	 : deletes the poll and all related options and votes; returns to the list page
 * - delete_votes	 : deletes all votes for the specified poll; returns to the list page
 * - delete_IP_votes : delete votes for the specified poll, with the IP on which the admin is active now
*/

// Delete the entire poll and go on to the list page
if ($action == "delete_poll") {
	$action = "";
	if (!empty($poll_id)) {
		$result = $db->execute("DELETE FROM " . PM_TABLE_POLLS . " WHERE p_id='" . $poll_id . "'");
		$result = $db->execute("DELETE FROM " . PM_TABLE_POLL_OPTIONS . " WHERE o_poll_id='" . $poll_id . "'");
		$result = $db->execute("DELETE FROM " . PM_TABLE_POLL_RESULTS . " WHERE r_poll_id='" . $poll_id . "'");
	}
}

// Delete a poll's votes and go on to the list page
if ($action == "delete_votes") {
	$action = "";
	if (!empty($poll_id)) {
		$result = $db->execute("DELETE FROM " . PM_TABLE_POLL_RESULTS . " WHERE r_poll_id='" . $poll_id . "'");
	}
}

// Delete a poll's votes and go on to the list page
if ($action == "delete_IP_votes") {
	$action = "";
	if (!empty($poll_id) && !empty($ip)) {
		$result = $db->execute("DELETE FROM " . PM_TABLE_POLL_RESULTS . " WHERE r_poll_id='" . $poll_id . "' AND r_ip='" . $ip . "'");
	}
}

// New polls start with two empty options
if ($action == "new_poll") {
	$headertext = PM_ADD_HEADER;
	for ($i = 1; $i < 3; $i++) {
		$options[$i]["option"] = $i;
		$options[$i]["text"] = "";
		$options[$i]["inpf"] = "";
	}
}

// Either with adding the poll, or with adding an option, we compress the option list
// For add option we add an empty option
if ($action == "add_option" || $action == "add_poll") {
	$i = 1;
	$j = 1;
	$option = "option_id_1";
	
	// Compress the options array and remove any empty options
	while (isset($_GET[$option])) {
		$text = "option_text_" . $i;
		if (isset($_GET[$text]) && !empty($_GET[$text])) {
			$options[$j]["option"] = $j;
			$options[$j]["text"] = $_GET[$text];
			$inpf = "option_inpf_" . $i;
			if (isset($_GET[$inpf])) $options[$j]["inpf"] = $_GET[$inpf];
			else $options[$j]["inpf"] = "";
			$j++;
		}
		$i++;
		$option = "option_id_". $i;
	}
	// At this stage we have a renumbered array with valid options.
	if ($action == "add_option") {
		if (empty($poll_id)) $headertext = PM_ADD_HEADER;
		else $headertext = PM_EDIT_HEADER;
		// Add an empty option
		$options = PMAddEmptyOption($options);
		$j++;
		$action = "new_poll";
	}
	// We cannot have a poll with only 1 answer! So we fill up with empty options and go in edit mode again
	if ($j <= 2) {
		if ($action == "add_poll") $messageStack->add(PM_REQ_2_OPTIONS,'error');
		while ($j <= 2) {
			$options = PMAddEmptyOption($options);
			$j++;
		}
		$action = "new_poll";
	}
}

// We can add the poll to the DB, IF the option fields are ok.
if ($action == "add_poll") {
	// Check input fields
	if (empty($poll_descr) || empty($poll_type) || empty($poll_status) || empty($poll_question) || empty($poll_prim)) {
		$messageStack->add(PM_REQ_FIELDS, 'error');
		$action = "new_poll";
		$options = PMAddEmptyOption($options);
	}
	else {
		// It's a new poll
		if (empty($poll_id)) {
			// Insert the stuff in the DB
			$poll_insert = $db->Execute("INSERT INTO " . PM_TABLE_POLLS . " VALUES('0', '" . $db->prepare_input($poll_descr) . "', '" . $db->prepare_input($poll_question) . "', '" . ($poll_status == "I" ? 0 : 1) . "', '" . ($poll_type == "R" ? 0 : 1) . "', '" . $poll_multivote . "', '" . ($poll_prim == "Y" ? "Y" : "N") . "', '" . ($poll_show_cust == "Y" ? "Y" : "N") . "')");
			$poll_id = $db->insert_ID();
			foreach ($options as $number => $option) {
				$option_insert = $db->Execute("INSERT INTO " . PM_TABLE_POLL_OPTIONS . " VALUES('0', '" . $poll_id . "', '" . $number . "', '" . $db->prepare_input($option["text"]) . "', '" . ($option["inpf"] == "" ? 0 : 1) . "')");
			}
			$action = "";
		}
		else {
			// It's an update for a poll
			$poll_update = $db->Execute("UPDATE " . PM_TABLE_POLLS . " SET p_description='" . $db->prepare_input($poll_descr) . "', p_question='" . $db->prepare_input($poll_question) . "', p_status='" . ($poll_status == "I" ? 0 : 1) . "', p_type='" . ($poll_type == "R" ? 0 : 1). "', p_multivote='" . $poll_multivote . "', p_prim='" . ($poll_prim == "Y" ? "Y" : "N") . "', p_show_cust='" . ($poll_show_cust == "Y" ? "Y" : "N") . "' WHERE p_id='" . $poll_id . "'");
			$poll_delete = $db->Execute("DELETE FROM " . PM_TABLE_POLL_OPTIONS . " WHERE o_poll_id='" . $poll_id . "'");
			foreach ($options as $number => $option) {
				$option_insert = $db->Execute("INSERT INTO " . PM_TABLE_POLL_OPTIONS . " VALUES('0', '" . $poll_id . "', '" . $number . "', '" . $db->prepare_input($option["text"]) . "', '" . ($option["inpf"] == "" ? 0 : 1) . "')");
			}
			$action = "";
			
		}
		// If the primary poll indicator is set to yes, update the indication of all other polls to no.
		if ($poll_prim == "Y") $poll_primary = $db->Execute("UPDATE " . PM_TABLE_POLLS . " SET p_prim='N' WHERE p_id!='" . $poll_id . "'");
	}
}

if ($action == "edit_poll") {
	$headertext = PM_EDIT_HEADER;
	if (!empty($poll_id)) {
		$action = "new_poll";
		// Get the poll info from the DB
		$poll_list = $db->Execute("SELECT * FROM " . PM_TABLE_POLLS . ", " . PM_TABLE_POLL_OPTIONS . " WHERE p_id=o_poll_id AND p_id='" . $poll_id . "' ORDER BY o_option");
		if ($poll_list->RecordCount() > 0) {
			$options = array();
			while(!$poll_list->EOF) {
				$oid = $poll_list->fields['o_option'];
				$poll_id = $poll_list->fields['p_id'];
				$poll_descr = $poll_list->fields['p_description'];
				$poll_question = $poll_list->fields['p_question'];
				$poll_status = ($poll_list->fields['p_status'] == 0 ? "I" : "A");
				$poll_type = ($poll_list->fields['p_type'] == 0 ? "R" : "C");
				$poll_multivote = $poll_list->fields['p_multivote'];
				$poll_prim = ($poll_list->fields['p_prim'] == "Y" ? "Y" : "N");
				$poll_show_cust = ($poll_list->fields['p_show_cust'] == "Y" ? "Y" : "N");
				$options[$oid]["option"] = $poll_list->fields['o_option'];
				$options[$oid]["text"] = $poll_list->fields['o_text'];
				$options[$oid]["inpf"] = $poll_list->fields['o_inpf'];
				$poll_list->MoveNext();
			}
		}
	}
}

// No action, just display the existing polls
if ($action == "") {
	$poll_list = $db->Execute("SELECT * FROM " . PM_TABLE_POLLS . ", " . PM_TABLE_POLL_OPTIONS . " WHERE p_id=o_poll_id ORDER BY p_id, o_option");
	
	$polls = array();
	if ($poll_list->RecordCount() > 0) {
		while(!$poll_list->EOF) {
			$id = $poll_list->fields['p_id'];
			$oid = $poll_list->fields['o_option'];
			$polls[$id]['id'] = $poll_list->fields['p_id'];
			$polls[$id]['descr'] = $poll_list->fields['p_description'];
			$polls[$id]['question'] = $poll_list->fields['p_question'];
			$polls[$id]['status'] = ($poll_list->fields['p_status'] == 0 ? "I" : "A");
			$polls[$id]['type'] = ($poll_list->fields['p_type'] == 0 ? "R" : "C");
			$polls[$id]['multivote'] = $poll_list->fields['p_multivote'];
			$polls[$id]['prim'] = $poll_list->fields['p_prim'];
			$polls[$id]['show_cust'] = $poll_list->fields['p_show_cust'];
			$polls[$id]['votes'] = 0;
			$polls[$id]['options'][$oid]['option'] = $poll_list->fields['o_option'];
			$polls[$id]['options'][$oid]['votes'] = 0;
			$polls[$id]['options'][$oid]['text'] = $poll_list->fields['o_text'];
			$polls[$id]['options'][$oid]['inpf'] = $poll_list->fields['o_inpf'];
			$poll_list->MoveNext();
		}
		// Add the votes
		foreach ($polls as $id => $poll) {
			$tvotes = 0;
			$votes = $db->Execute("SELECT r_option, count(r_option) as r_count FROM " . PM_TABLE_POLL_RESULTS . " WHERE r_poll_id='" . $id . "' GROUP BY r_option");
			while (!$votes->EOF) {
				$polls[$id]['options'][$votes->fields['r_option']]['votes'] = $votes->fields['r_count'];
				$tvotes += $votes->fields['r_count'];
				if ($polls[$id]['options'][$votes->fields['r_option']]['inpf'] == 1) {
					$votetexts = $db->Execute("SELECT r_option_text, count(r_option_text) as r_count FROM " . PM_TABLE_POLL_RESULTS . " WHERE r_poll_id='" . $id . "' AND r_option='" . $votes->fields['r_option'] . "' GROUP BY r_option_text ORDER BY r_count");
					while (!$votetexts->EOF) {
						$polls[$id]['options'][$votes->fields['r_option']]['texts'][] = array('text' => $votetexts->fields['r_option_text'], 'count' =>$votetexts->fields['r_count']);
						$votetexts->MoveNext();
					}
				}
				$votes->MoveNext();
			}
			// Also add the voters if multiple choice
			$polls[$id]['votes'] = $tvotes;
			if ($polls[$id]['type'] == "C") {
				$voters = 0;
				$rvoters = $db->Execute("SELECT count(ip) i_count FROM (SELECT DISTINCT(r_ip) as ip FROM " . PM_TABLE_POLL_RESULTS . " WHERE r_poll_id='" . $id . "' GROUP BY r_ip) as t");
				while(!$rvoters->EOF) {
					$voters = $rvoters->fields['i_count'];
					$rvoters->MoveNext();
				}
				$polls[$id]['voters'] = $voters;
			}
			// Add the timestamps of the first and last vote
			$stamps = $db->Execute("SELECT DISTINCT(r_poll_id), DATE_FORMAT(MIN(r_timestamp),'" . PM_VOTE_DATE_FORMAT . "') as first, DATE_FORMAT(MAX(r_timestamp),'" . PM_VOTE_DATE_FORMAT . "') as last FROM " . PM_TABLE_POLL_RESULTS . " WHERE 1 GROUP BY r_poll_id");
			while (!$stamps->EOF) {
				$polls[$stamps->fields['r_poll_id']]['firstvote'] = $stamps->fields['first'];
				$polls[$stamps->fields['r_poll_id']]['lastvote'] = $stamps->fields['last'];
				$stamps->MoveNext();
			}
		}
	}
}
// Start output 
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php print HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php print CHARSET; ?>">
<title><?php print TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" href="includes/cssjsmenuhover.css" media="all" id="hoverJS">
<script language="javascript" type="text/javascript" src="includes/menu.js"></script>
<script language="javascript" type="text/javascript" src="includes/general.js"></script>

<script type="text/javascript">
  <!--
  
  function counttextinput(count) {
	  
	  cnt=0;
	  for (t = 1; t <= count; t++) {
		  cnt = cnt + document.getElementById('option_inpf_' + t).checked
	  }
	  return cnt;
  }
   
  function init()
  {
    cssjsmenu('navbar');
    if (document.getElementById)
    {
      var kill = document.getElementById('hoverJS');
      kill.disabled = true;
    }
  }

   function popupWindow(url) {
  		window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=600,height=460,screenX=150,screenY=150,top=150,left=150')
	}
  // -->
</script>

</head>
<body onload="init()">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->

	<div style="padding: 8px 5px; width:20%; clear:both;">
		<h1><?php print PM_HEADING_TITLE; ?></h1>
		<?php
		print PM_VERSION_TEXT . ":&nbsp;" . PM_VERSION_NUMBER;
		print "&nbsp;&nbsp;<a href=\"" . HTTP_SERVER . DIR_WS_ADMIN . PM_FILENAME_POLL_MANAGER_HELP . "\" target=\"_blank\" >" . PM_HELP . "</a>";
		?>
	</div>
<div style="width:100%; text-align:center;">
<div align="center" style="width:70%; margin: 0 auto;"><br />
<?php
switch($action) {
	case "new_poll":
		print zen_draw_form("poll_manager", PM_FILENAME_POLL_MANAGER, '', 'get', '');
		print zen_draw_hidden_field('action', 'add_poll', 'id="action"');
		if ($poll_id != "") print zen_draw_hidden_field('poll_id', $poll_id);
		print "<table width=\"100%\">";
		
		// Print heading row
		print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td align=\"center\"><br />". $headertext . "<br /><br /></td></tr>";
		print "</table><br />";
		print "<table width=\"100%\">\n";
		print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td colspan=\"4\" align=\"center\">" . PM_POLL_INFO . "</td></tr>\n";
		
		// Print description field
		print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\"><td class=\"attributeBoxContent\">" . PM_POLL_DESCR . "</td>";
		print "<td colspan=\"3\">" . zen_draw_input_field('poll_descr', $poll_descr, 'size="64" maxlength="64"', true) . "</td></tr>";
		
		// Print question field
		print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\"><td class=\"attributeBoxContent\">" . PM_POLL_QUESTION . "</td>";
		print "<td colspan=\"3\">" . zen_draw_input_field('poll_question', $poll_question, 'size="64" maxlength="64"', true) . "</td></tr>";
		
		// Print type field
		print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
		print "<td class=\"attributeBoxContent\">" . PM_POLL_TYPE . "</td>";
		print "<td>" . zen_draw_radio_field('poll_type', 'R') . PM_POLL_TYPE_SINGLE . "<br />" . zen_draw_radio_field('poll_type', 'C') . PM_POLL_TYPE_MULTIPLE . "</td>";
		print "</tr>";

		// Print active/inactive field
		print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
		print "<td class=\"attributeBoxContent\">" . PM_POLL_STATUS . "</td>";
		print "<td>" . zen_draw_radio_field('poll_status', 'A', ($poll_status == "A" ? true : false)) . PM_POLL_STATUS_ACTIVE . "<br />" . zen_draw_radio_field('poll_status', 'I', ($poll_status == "I" ? true : false)) . PM_POLL_STATUS_INACTIVE . "</td>";
		print "</tr>";
		
		// Print active/inactive field
		print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
		print "<td class=\"attributeBoxContent\">" . PM_ALLOW_MULTIPLE_VOTES . "</td>";
		print "<td>" . zen_draw_radio_field('poll_multivote', 'Y', ($poll_multivote == "Y" ? true : false)) . PM_YES . "<br />" . zen_draw_radio_field('poll_multivote', 'N', ($poll_multivote == "N" ? true : false)) . PM_NO . "</td>";
		print "</tr>";
		
		// Print the primary yes/no field
		print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
		print "<td class=\"attributeBoxContent\">" . PM_POLL_PRIM . "</td>";
		print "<td>" . zen_draw_radio_field('poll_prim', 'Y', ($poll_prim != "N" ? true : false)) . PM_YES . "<br />" . zen_draw_radio_field('poll_prim', 'N', ($poll_prim == "N" ? true : false)) . PM_NO . "</td>";
		print "</tr>";

		// Print the show poll to customers yes/no field
		print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
		print "<td class=\"attributeBoxContent\">" . PM_SHOW_RESULTS_TO_CUST . "</td>";
		print "<td>" . zen_draw_radio_field('poll_show_cust', 'Y', ($poll_show_cust != "N" ? true : false)) . PM_YES . "<br />" . zen_draw_radio_field('poll_show_cust', 'N', ($poll_show_cust == "N" ? true : false)) . PM_NO . "</td>";
		print "</tr>";
		
		print "</table><br />";
		
		// Print the options
		print "<table width=\"100%\">\n";
		print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td colspan=\"3\" align=\"center\">" . PM_POLL_OPTION_INFO . "</td></tr>\n";
		

		foreach($options as $option => $fields) {
			if ($option == 1) {
				// Option header
				print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td width=\"10%\" align=\"center\">" . PM_POLL_OPTION_ID . "</td><td width=\"80%\" align=\"center\">" . PM_POLL_OPTION_TEXT . "</td><td align=\"center\">" . PM_POLL_OPTION_INPUT . "</td></tr>\n";
			}
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td align=\"center\">";
			print zen_draw_hidden_field("option_id_".$option, $fields["option"]);
			print $fields["option"] . "</td>";
			print "<td>" . zen_draw_input_field("option_text_" . $fields["option"], $fields["text"], 'size="64" maxlength="64"', true) . "</td>";
			print "<td align=\"center\">" . zen_draw_checkbox_field("option_inpf_" . $fields["option"], "1", ($fields["inpf"] == 1), "", "id=\"option_inpf_" . $fields["option"] . "\" onclick=\"if(counttextinput(" . count($options) . ") > 1){alert('". PM_USER_INPUT_WARNING . "'); this.checked=0;};\"") . "</td></tr>\n";
		}
		print "</table>";
		print "<table width=\"100%\">\n";
		print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td colspan=\"3\" align=\"center\">";
		
		// Print submit/add option buttons
		// Submit button
		print zen_image_submit(PM_FILENAME_SEND_BUTTON, PM_POLL_ADD);
		
		// Add option button, if less than 6 options present
		if (count($options) < 6) print "&nbsp;&nbsp;<a href=\"javascript:;\" onclick=\"document.poll_manager.action.value='add_option'; document.poll_manager.submit();return false;\">" . zen_image_button(PM_FILENAME_ADD_OPTION_BUTTON, PM_POLL_OPTION_ADD) . "</a>";
		
		// Back button
		print "&nbsp;&nbsp;<a href=\"" . zen_href_link(PM_FILENAME_POLL_MANAGER) . "\">" . zen_image_button(PM_FILENAME_BACK_BUTTON, PM_POLL_BACK) . "</a>";
		print "</td></tr>\n";
		print "</table>";
		print "</form>";
		break;
	default:
		?>
		<script type="text/javascript">
		  <!--
		  plusminus = new Array();
		  plusminus[0] = new Image();
		  plusminus[0].src = "<?php print PM_FILENAME_PLUS; ?>";
		  plusminus[1] = new Image();
		  plusminus[1].src = "<?php print PM_FILENAME_MINUS; ?>";
		  
		  function switchblock(divblock, count) {
			  block = document.getElementById(divblock + count);
			  plusmin = document.getElementById('plusmin' + count);
			  if(block.style.display == 'none') {
				  block.style.display='block';
				  plusmin.src=plusminus[1].src;
			  }
			  else {
				  block.style.display='none';
				  plusmin.src=plusminus[0].src;
			  }
			  return false;
		  }
		  // -->
		</script>
		<?php
	
		// Print heading row
		print "<table width=\"100%\">";
		print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td align=\"center\" style=\"border:2px solid #003D00;\"><br />". $headertext . "<br /><br /></td></tr>";
		print "</table>\n<br />";
		
		foreach ($polls as $poll_key => $poll) {
			print "<div class=\"dataTableHeadingRow\" align=\"left\" style=\"border:1px solid #003D00;\">";
			print "<br />&nbsp;" . zen_image(($poll['status'] == "I"  && $poll_id != $poll_key ? PM_FILENAME_PLUS : PM_FILENAME_MINUS), PM_CLICK_FOR_POLL, 0, 0, "id=\"plusmin" . $poll_key . "\" onclick=\"return switchblock('poll_block_div', '" . $poll_key . "')\"");
			print "&nbsp;&nbsp;<b>" . $poll['descr'] . "</b> (" . ($poll['status'] == "I" ? PM_POLL_STATUS_INACTIVE : PM_POLL_STATUS_ACTIVE) . ($poll['prim'] == "Y" ? ", " . PM_POLL_PRIM_SHORT : "") . ")";
			print "<br /><br /></div>";
			
			print "<div id=\"poll_block_div" . $poll_key . "\" style=\"width:100%;display:" . ($poll['status'] == "I"  && $poll_id != $poll_key ? "none" : "block") . ";\">";

			print "<table width=\"100%\">\n";
			print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td colspan=\"2\" align=\"center\">" . PM_POLL_INFO . "</td></tr>\n";
			
			// Print description field
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\"><td class=\"attributeBoxContent\" width=\"30%\">" . PM_POLL_DESCR . "</td>";
			print "<td>" . $poll['descr'] . "</td></tr>";
			
			// Print question field
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\"><td class=\"attributeBoxContent\">" . PM_POLL_QUESTION . "</td>";
			print "<td>" . $poll['question'] . "</td></tr>";
			
			// Print type field
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td class=\"attributeBoxContent\">" . PM_POLL_TYPE . "</td>";
			print "<td>" . ($poll['type'] == "R" ? PM_POLL_TYPE_SINGLE : PM_POLL_TYPE_MULTIPLE) . "</td></tr>";

			// Print active/inactive field
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td class=\"attributeBoxContent\">" . PM_POLL_STATUS . "</td>";
			print "<td>" . ($poll['status'] == "I" ? PM_POLL_STATUS_INACTIVE : PM_POLL_STATUS_ACTIVE) . "</td></tr>";
			
			// Print multivote field
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td class=\"attributeBoxContent\">" . PM_ALLOW_MULTIPLE_VOTES . "</td>";
			print "<td>" . ($poll['multivote'] == "Y" ? PM_YES : PM_NO) . "</td></tr>";

			// Print primary / not primary field
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td class=\"attributeBoxContent\">" . PM_POLL_PRIM . "</td>";
			print "<td>" . ($poll['prim'] == "Y" ? PM_YES : PM_NO) . "</td></tr>";
						
			// Print show to customers / not field
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td class=\"attributeBoxContent\">" . PM_SHOW_RESULTS_TO_CUST . "</td>";
			print "<td>" . ($poll['show_cust'] == "Y" ? PM_YES : PM_NO) . "</td></tr>";
			
			// Print number of votes field
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td class=\"attributeBoxContent\">" . PM_POLL_VOTES . "</td>";
			print "<td>" . $poll['votes'] . "</td></tr>";
			
			// For multiple choice, also display the number of voters
			if (isset($poll['voters'])) {
				print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
				print "<td class=\"attributeBoxContent\">" . PM_POLL_VOTERS . "</td>";
				print "<td>" . $poll['voters'] . "</td></tr>";
			}
			// Print date/time of first and last vote
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td class=\"attributeBoxContent\">" . PM_FIRST_VOTE . "</td>";
			print "<td>" . (isset($poll['firstvote']) ? $poll['firstvote'] : '&nbsp;') . "</td></tr>";
			print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">";
			print "<td class=\"attributeBoxContent\">" . PM_LAST_VOTE . "</td>";
			print "<td>" . (isset($poll['lastvote']) ? $poll['lastvote'] : '&nbsp;') . "</td></tr>";
			
			print "</table>\n";
			
			// Print the options
			print "<table width=\"100%\">\n";
			print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td colspan=\"5\" align=\"center\">" . PM_POLL_OPTION_INFO . "</td></tr>\n";
	
			foreach($poll['options'] as $option_id => $option) {
				if ($option_id == 1) {
					// Option header
					print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\"><td width=\"10%\" align=\"center\">" . PM_POLL_OPTION_ID . "</td><td  width=\"10%\" align=\"center\">" . PM_POLL_OPTION_INPUT . "</td><td width=\"70%\" align=\"center\">" . PM_POLL_OPTION_TEXT . "</td><td align=\"center\" colspan=\"2\">" . PM_OPTION_VOTES . "</td></tr>\n";
				}
				print "<tr class=\"dataTableContent dataTableRow\" style=\"vertical-align: top;\">\n";
				print "<td align=\"center\">" . $option_id . "</td>\n";
				print "<td align=\"center\">" . ($option['inpf'] == 1 ? PM_YES : PM_NO) . "</td>\n";
				print "<td>";
				if (isset($option['texts'])) {
					print "<a href=\"javascript: " . PM_CLICK_FOR_TEXTS . "\" onclick=\"return switchblock('poll_text_div', '" . $poll_key . "');\">" . $option['text'] . "</a>";
					print "<div id=\"poll_text_div" . $poll_key . "\" style=\"width:100%;display:none;\">";
						print "<ul>";
						foreach($option['texts'] as $key => $textarray) {
							print '<li>' . $textarray['text'] . ' (' . $textarray['count'] . ')</li>';
						}
						print "</ul>\n";
					print "</div>\n";
				}
				else print $option['text'];
				print  "</td>\n";
//				print "<td align=\"center\">" . $option['votes'] . (($poll['votes'] == 0 || $poll['type'] == "C") ? "" : "&nbsp;(" . round($option['votes'] / $poll['votes'] * 100, 0) . "%)");
				print "<td align=\"right\" style=\"padding: 0 1em 0 1em;\">" . $option['votes'] . "</td><td align=\"right\" style=\"padding: 0 1em 0 1em;\">" .(($poll['votes'] == 0) ? "" : "&nbsp;(" . round($option['votes'] / ($poll['type'] == "C" ? $poll['voters'] : $poll['votes']) * 100, 0) . "%)");
				print "</td></tr>\n";
			}
			print "<tr class=\"dataTableHeadingContent dataTableHeadingRow\" align=\"center\"><td colspan=\"5\">";
			
			// Print the edit button
			print "<a href=\"" . zen_href_link(PM_FILENAME_POLL_MANAGER, "action=edit_poll&amp;poll_id=" . $poll_key) . "\">" . zen_image_button(PM_FILENAME_EDIT_BUTTON, PM_POLL_EDIT) . "</a>&nbsp;&nbsp;";
			
			// Print the delete button
			print "<a href=\"" . zen_href_link(PM_FILENAME_POLL_MANAGER, "action=delete_poll&amp;poll_id=" . $poll_key) . "\" onclick=\"return confirm('" . PM_DELETE_CONFIRM . "');\">" . zen_image_button(PM_FILENAME_DELETE_BUTTON, PM_POLL_DELETE) . "</a>&nbsp;&nbsp;";
			
			// Print the delete votes button, if # votes > 0
			if ($poll['votes'] > 0) {
				print "<a href=\"" . zen_href_link(PM_FILENAME_POLL_MANAGER, "action=delete_votes&amp;poll_id=" . $poll_key) . "\" onclick=\"return confirm('" . PM_DELETE_VOTES_CONFIRM . "');\">" . zen_image_button(PM_FILENAME_REMOVE_VOTE_BUTTON, PM_POLL_DELETE_VOTES) . "</a>";
			}
			
			// Check if we can delete votes of this IP, if so print the appropriate button
			$ip = zen_get_ip_address();
			$poll_ip = $db->Execute("SELECT r_ip FROM " . PM_TABLE_POLL_RESULTS . " WHERE r_poll_id='" . $poll_key . "' AND r_ip='" . $ip . "'");
			if ($poll_ip->RecordCount() > 0) {
				print "&nbsp;&nbsp;<a href=\"" . zen_href_link(PM_FILENAME_POLL_MANAGER, "action=delete_IP_votes&amp;poll_id=" . $poll_key . "&amp;ip=" . $ip) . "\">" . zen_image_button(PM_FILENAME_REMOVE_IP_VOTES_BUTTON, PM_DEL_ADMIN_VOTES) . "</a>";
			}
			print "</td></tr>\n";
			print "</table></div><br />";
		}
		print "<a href=\"".zen_href_link(PM_FILENAME_POLL_MANAGER, 'action=new_poll')."\" >" . PM_ADDLINK . "</a>";
		break;
}
?>
</div></div>		
<br class="clearBoth" /><br /><br />
<!-- body_eof //-->
<!-- footer //-->
<?php
	require(DIR_WS_INCLUDES . 'footer.php');
?>
<!-- footer_eof //-->
</body>
</html>
<?php
	require(DIR_WS_INCLUDES . 'application_bottom.php');
?>