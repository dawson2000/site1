<?php
/**
 * tpl_poll_box_result.php
 * Poll box result sidebox template file
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009-2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */
 
print  '<div id="PollManagerPollHeading">' . $ppoll['question'] . '</div>';
foreach($ppoll['option'] as $index => $option) {
	print '<div class="PollManagerResult"><div class="PollManagerResultText">' . html_entity_decode($option['text']) . '</div>';
	$perc = round($option['count'] / $vtotal * 100, 0);
	print "<div class=\"PollManagerResultBar\" style=\"width:" . ($perc * 0.75) . "%; background:url(" . $template->get_template_dir(PM_FILENAME_VOTE_BAR, DIR_WS_TEMPLATE, $current_page_base, 'images/') . PM_FILENAME_VOTE_BAR . ");\">&nbsp;";
	print "</div><div class=\"PollManagerResultPerc\">" . ($_GET['poll_type'] == '0' ? $perc . "%" : $option['count']) . "</div></div>";
}
print "<br style=\"clear: both;\"/ ><div class=\"PollManagerResultFooter\">" . PM_VOTE_THNX . "</div>";
//EOF
?>