<?php
/**
 * tpl_poll_box.php
 * Poll box sidebox template file
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009-2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */
 
// Inputs for the AJAX script:
// element     = element ID of the element where the output will be written
// action      = action to perform (generally process the poll results)
// val1/param1 = poll ID
// val2/param2 = poll type
// valx/paramx = for each option one pair. If one option is text input, one less. So we can have 6 options.
?>
<script type="text/javascript">
<!--

image = new Image();
image.src = "<?php print PM_FILENAME_LOADING;?>";

function createRequestObject() {
    var ro;
    var browser = navigator.appName;
    if(browser == "Microsoft Internet Explorer"){
        ro = new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        ro = new XMLHttpRequest();
    }
    return ro;
}

var http = createRequestObject();
var element_id;
var zenid=<?php print "'".$session."'"; ?>

function sndReq(element, action, param1, val1, param2, val2, param3, val3, param4, val4, param5, val5, param6, val6, param7, val7, param8, val8, param9, val9) {
	param1 = typeof(param1) != 'undefined' ? param1 : "dummy1";
	param2 = typeof(param2) != 'undefined' ? param2 : "dummy2";
	param3 = typeof(param3) != 'undefined' ? param3 : "dummy3";
	param4 = typeof(param4) != 'undefined' ? param4 : "dummy4";
	param5 = typeof(param5) != 'undefined' ? param5 : "dummy5";
	param6 = typeof(param6) != 'undefined' ? param6 : "dummy6";
	param7 = typeof(param7) != 'undefined' ? param7 : "dummy7";
	param8 = typeof(param8) != 'undefined' ? param8 : "dummy8";
	param9 = typeof(param9) != 'undefined' ? param9 : "dummy9";
	val1 = typeof(val1) != 'undefined' ? val1 : "";
	val2 = typeof(val2) != 'undefined' ? val2 : "";
	val3 = typeof(val3) != 'undefined' ? val3 : "";
	val4 = typeof(val4) != 'undefined' ? val4 : "";
	val5 = typeof(val5) != 'undefined' ? val5 : "";
	val6 = typeof(val6) != 'undefined' ? val6 : "";
	val7 = typeof(val7) != 'undefined' ? val7 : "";
	val8 = typeof(val8) != 'undefined' ? val8 : "";
	val9 = typeof(val9) != 'undefined' ? val9 : "";
	var randomnumber = Math.floor(Math.random()*1000001)
	element_id = element;
    http.open('GET', 'zcrpc.php?action='+action+'&'+param1+'='+val1+'&'+param2+'='+val2+'&'+param3+'='+val3+'&'+param4+'='+val4+'&'+param5+'='+val5+'&'+param6+'='+val6+'&'+param7+'='+val7+'&'+param8+'='+val8+'&'+param9+'='+val9+'&zenid='+zenid+'&wqp='+randomnumber, true);
    http.send(null);
    http.onreadystatechange = handleResponse;

}

function handleResponse() {
    if(http.readyState == 4) {
        document.getElementById(element_id).innerHTML = http.responseText;
        document.getElementById(element_id).style.display="none";
        document.getElementById(element_id).style.display="block";
    }
   	else document.getElementById(element_id).innerHTML = '<img src="<?php print PM_FILENAME_LOADING;?>" />';
}

function CheckForm(form) {
    var cbResults = 0;
    var radioResults = 0;
    <?php 
    foreach($poll['options'] as $oid => $option) {
	    if($option['inpf'] == 1) {
		    print "if(document.poll_box.poll_vote" . $oid . ".checked==1 && document.poll_box.vote_text".$oid.".value=='') {\n";
		    print "document.poll_box.poll_vote" . $oid . ".checked=0;\n";
		    print "}\n";
	    }
    }
    ?>
    for (var i = 0; i < form.elements.length; i++ ) {
        if (form.elements[i].type == 'checkbox') {
            if (form.elements[i].checked == true) {
                cbResults += 1;
            }
        }
        if (form.elements[i].type == 'radio') {
            if (form.elements[i].checked == true) {
                radioResults += 1;
            }
        }
    }
    total = cbResults + radioResults;
    return total;
}

//-->
</script>
<?php

$content = '';
$content .= zen_draw_form('poll_box', 'index.php', 'get', 'id="PollManagerInputForm" onsubmit="return false;"', false);
$boxname = str_replace('_', '-', $box_id . 'Content');
$content .= '<div id="' . $boxname . '" class="sideBoxContent" style="padding-top:0;">';

// Draw the form

// Question	
$content .= '<div id="PollManagerPollHeading">' . $poll['question'] . '</div>' . "\n";

// Options: type is 0: radiobutton, type=1: checkbox
foreach($poll['options'] as $oid => $option) {
	$content .= '<div class="PollManagerOption">';
	
	$content .= '<div class="PollManagerOptionInput">' . "\n";
	$content .= ($poll['type'] == "0" ? zen_draw_radio_field('poll_vote', $oid, false, "class='PollManagerOptionInputField' id='poll_vote" . $oid . "'") : zen_draw_checkbox_field("poll_vote" . $oid, $oid , false, "id='poll_vote" . $oid . "'")) . "\n";
	$content .= '</div><div class="PollManagerOptionText">' . $option['text'];
	if ($option['inpf'] == 1) $content .= '<br />' . zen_draw_input_field('vote_text' . $oid,  '', "class=\"PollManagerOptionUserInput\" onkeyup=\"document.getElementById('poll_vote".$oid."').checked=1;\"", 'text', false) . '<br /></div>';
	else $content .= '</div>';
	$content .= '</div>' . "\n";
}

// Vote button with call to AJAX
$content .= "<div id=\"PollManagerButtons\"><a href=\"javascript:\" onclick=\"if (CheckForm(document.poll_box) == 0) return false; sndReq('" . $boxname . "', 'process_poll', 'poll_id', '" . $poll['id'] . "', 'poll_type', '" . $poll['type'] . "'";

if ($poll['type'] == "0") {
	foreach($poll['options'] as $oid => $option) {
		$content .= ", 'vote" . $oid . "', document.poll_box.poll_vote[" . ($oid - 1) . "].checked";
		if ($option['inpf'] == 1) $content .= ", 'vote_text" . $oid . "', document.poll_box.vote_text" . $oid . ".value";
	}
}
else {
	foreach($poll['options'] as $oid => $option) {
		$content .= ", 'vote" . $oid . "', document.getElementById('poll_vote" . $oid . "').checked";
		if ($option['inpf'] == 1) $content .= ", 'vote_text" . $oid . "', document.poll_box.vote_text" . $oid . ".value";
	}
}
$content .= "); return false;\">" . zen_image_button(PM_FILENAME_VOTE_BUTTON, PM_VOTE) . "</a>";

if ($pm_show_link) $content .= '&nbsp;&nbsp;<a href="' . zen_href_link(PM_FILENAME_POLL_OVERVIEW, 'poll_id=' . $poll['id']) . '">' . zen_image_button(PM_FILENAME_BUTTON_RESULTS, PM_GOTO_RESULT) . '</a>';

$content .= "</div>" . "\n";
	
$content .= '</div>' . "\n";

$content .= "</form>";

//EOF
?>