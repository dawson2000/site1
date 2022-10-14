<?php
/**
 * tpl_poll_overview_default.php
 * Poll Manager - Poll overview page template
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009-2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */
?>
<a name="top"></a>
<div class="centerColumn" id="Poll_overview">
<h1 id="Poll_overviewHeading"><?php echo HEADING_TITLE; ?></h1><br />

<?php
	// Only display anything if at least one poll can be displayed
	if (count($ppoll) > 0) {
		
		// Determine which poll to display
		// $last_id is set to the highest id from the DB
		// But is one is in the URL, that has preference
		$inp_poll = (isset($_GET['poll_id']) ? $_GET['poll_id'] : $last_id);
		
		// But only if it really can be displayed
		$inp_poll = (array_key_exists($inp_poll, $ppoll) ? $inp_poll : $last_id);
		
		// Only show the dropdown on 2 or more polls
		if (count($ppoll) > 1) {
			?>
			<script type="text/javascript">
			<!--
			var poll_open = <?php print $inp_poll; ?>;
			function PMactivatePoll(id) {
				document.getElementById('pollresults'+poll_open).style.display='none';
				document.getElementById('pollresults'+id).style.display='block';
				poll_open=id;
			}
			//-->
			</script>
			<?php
			// Prepare and print the dropdown menu
			$drops = array();
			foreach($ppoll as $poll_id => $poll) {
				$drops[] = array('id' => $poll_id, 'text' => $poll['question']);
			}
			print zen_draw_form('poll_overview_page', zen_href_link(PM_FILENAME_POLL_OVERVIEW), 'get');
			print zen_draw_hidden_field('main_page', PM_FILENAME_POLL_OVERVIEW);
			print PM_SELECT_POLL . '&nbsp;&nbsp;';
      		print zen_draw_pull_down_menu('poll_id_select', $drops, $inp_poll, 'onchange="PMactivatePoll(this.value);"');
      		print '</form><br /><br /><br />' . "\n\n";
		}
		// Print the poll results, but only open the div for the one selected
		foreach($ppoll as $poll_id => $poll) {
			print '<div id="pollresults' . $poll_id . '" class="pollResults" style="display:' . ($poll_id == $inp_poll ? 'block' : 'none') . ';">' . "\n\t";
			print  '<div class="pollTitle"><b>' . $poll['question'] . '</b></div><br />' . "\n\t";
			foreach($poll['option'] as $index => $option) {
				print '<div class="pollResultsOption">' . html_entity_decode($option['text']) . '<br />' . "\n\t\t";
				$perc = round($option['count'] / $poll['vtotal'] * 100, 0);
				print '<div style="height:1.6em;">';
				print '<div style="float:left; width:' . ($perc * 0.9) . '%; background-image: url(' . HTTP_SERVER . DIR_WS_CATALOG . $template->get_template_dir(PM_FILENAME_VOTE_BAR, DIR_WS_TEMPLATE, $current_page_base, "images/") . PM_FILENAME_VOTE_BAR . '); background-size:100%;">&nbsp;';
				print "</div>&nbsp;" . ($poll['type'] == '0' ? $perc . "%" : $option['count']) . "</div>" . "\n\t\t";
				print "</div><br class=\"clearBoth zeroHeight\" />" . "\n\t";
			}
			print '<table>' . "\n\t";
			print '<tr><td>' . PM_FIRST_VOTE . '</td><td>' . $poll['first'] . '</td></tr>' . "\n\t";
			print '<tr><td>' . PM_LAST_VOTE . '</td><td>' . $poll['last'] . '</td></tr>' . "\n\t";
			print '<tr><td>' . PM_NBR_VOTERS . '</td><td>' . $poll['voters'] . '</td></tr>' . "\n\t";
			print '</table>' . "\n";
			print '</div>' . "\n\n";
		}
	}
	else {
		print PM_NO_POLLS;
	}
	require($define_page);
?>
</div>