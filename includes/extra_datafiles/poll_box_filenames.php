<?php
/**
 * poll_box_filenames.php
 * Poll Box filenames include file
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009-2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */
if (!defined('IS_ADMIN_FLAG')) {
  die('Illegal Access');
}
  define('PM_FILENAME_TEMPLATE', 'tpl_poll_box.php');
  define('PM_FILENAME_VOTE_BAR', 'vote_bar.gif');
  define('PM_FILENAME_LOADING', 'images/icons/indicator.gif');
  define('PM_FILENAME_VOTE_BUTTON', 'vote.gif');
  define('PM_FILENAME_BUTTON_RESULTS', 'vote_results.gif');
  define('PM_FILENAME_POLL_OVERVIEW', 'poll_overview');
  define('PM_TABLE_POLLS', DB_PREFIX . 'poll');
  define('PM_TABLE_POLL_OPTIONS', DB_PREFIX . 'poll_options');
  define('PM_TABLE_POLL_RESULTS', DB_PREFIX . 'poll_results');
  define('PM_FILENAME_DEFINE_POLL_RESULT_PAGE', 'define_poll_result_page');
?>
