<?php
/**
 * poll_manager_filenames.php
 * Poll Manager filenames include file
 * Version 1.2
 *
 * @author  Boudewijn Sjouke <boudewijnsjouke@hotmail.com>
 * @copyright Copyright 2009/2011
 * @license http://www.gnu.org/licenses/gpl.txt GNU General Public License V2.0
 */
if (!defined('IS_ADMIN_FLAG')) {
  die('Illegal Access');
}
  define('PM_FILENAME_POLL_MANAGER', 'poll_manager');
  define('PM_FILENAME_POLL_MANAGER_HELP', 'poll_manager.txt');
  define('PM_TABLE_POLLS', DB_PREFIX . 'poll');
  define('PM_TABLE_POLL_OPTIONS', DB_PREFIX . 'poll_options');
  define('PM_TABLE_POLL_RESULTS', DB_PREFIX . 'poll_results');
  define('PM_FILENAME_SEND_BUTTON', 'button_send.gif');
  define('PM_FILENAME_ADD_OPTION_BUTTON', 'button_add_option.gif');
  define('PM_FILENAME_BACK_BUTTON', 'button_back.gif');
  define('PM_FILENAME_EDIT_BUTTON', 'button_edit.gif');
  define('PM_FILENAME_DELETE_BUTTON', 'button_remove.gif');
  define('PM_FILENAME_REMOVE_VOTE_BUTTON', 'button_remove_votes.gif');
  define('PM_FILENAME_REMOVE_IP_VOTES_BUTTON', 'button_del_IP_votes.gif');
  define('PM_FILENAME_PLUS', 'images/icons/plus.gif');
  define('PM_FILENAME_MINUS', 'images/icons/minus.gif');
?>
