<?php
/**
 * Common Template - tpl_header.php
 *
 * this file can be copied to /templates/your_template_dir/pagename<br />
 * example: to override the privacy page<br />
 * make a directory /templates/my_template/privacy<br />
 * copy /templates/templates_defaults/common/tpl_footer.php to /templates/my_template/privacy/tpl_header.php<br />
 * to override the global settings and turn off the footer un-comment the following line:<br />
 * <br />
 * $flag_disable_header = true;<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_header.php 4813 2006-10-23 02:13:53Z drbyte $
 */
?>
<?php

	
  // Display all header alerts via messageStack:
  if ($messageStack->size('header') > 0) {
    echo $messageStack->output('header');
  }
  if (isset($_GET['error_message']) && zen_not_null($_GET['error_message'])) {
  echo htmlspecialchars(urldecode($_GET['error_message']));
  }
  if (isset($_GET['info_message']) && zen_not_null($_GET['info_message'])) {
   echo htmlspecialchars($_GET['info_message']);
} else {

}
?>


<?php
if (!isset($flag_disable_header) || !$flag_disable_header) {
?>

    <div id="header">
		<div class="wrapper top1">
			<div class="menu">
				<!-- ========== MENU ========== -->
					<?php if (EZPAGES_STATUS_HEADER == '1' or (EZPAGES_STATUS_HEADER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
						<?php require($template->get_template_dir('tpl_ezpages_bar_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_header.php'); ?>
					<?php } ?>
				<!-- ========================== -->
			</div>
			<div class="search">
				<!-- ========== SEARCH ========== -->
					<?php echo zen_draw_form('quick_find_header', zen_href_link(FILENAME_ADVANCED_SEARCH_RESULT, '', 'NONSSL', false), 'get');?>
						<div>
					<?php 
						echo zen_draw_hidden_field('main_page',FILENAME_ADVANCED_SEARCH_RESULT);
						echo zen_draw_hidden_field('search_in_description', '1') . zen_hide_session_id();
					?>
					<?php echo zen_draw_input_field('keyword', '', 'class="input1"');?>
					<?php echo zen_image_submit ('search.gif', HEADER_SEARCH_BUTTON, 'class="input2" ');?>
						</div>
					</form>
				<!-- ============================ -->
			</div>
		</div>
		<div class="wrapper top2">
			<div class="logo">
				<!-- ========== LOGO ========== -->
					<a href="<?php echo zen_href_link(FILENAME_DEFAULT);?>"><?php echo zen_image(DIR_WS_TEMPLATE.'images/logo.jpg'); ?></a>
				<!-- ========================== -->
			</div>
			<div class="right-head">
				<div class="cart">
					<!-- ========== SHOPPING CART ========== -->
						<?php 
							if ($_SESSION['cart']->count_contents() == 1){
								$cart_text = '<span class="one"> <span class="st3">Now in your cart</span>  <a href="' . zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL') . '"><span class="st2">' . $_SESSION['cart']->count_contents() . ' item</span></a></span>';
							} else {
								$cart_text = '<span class="one"> <span class="st3">Now in your cart</span>  <a href="' . zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL') . '"><span class="st2">' . $_SESSION['cart']->count_contents() . ' items</span></a></span>';
							}
						?>
						<a class="st1" href="<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL'); ?>"><span><?php echo BOX_HEADING_SHOPPING_CART;?>:</span></a><?php echo $cart_text ?> 
					<!-- =================================== -->
				</div>
				<div class="clear"></div>
				<div class="navigation">
					<!-- ========== NAVIGATION LINKS ========== -->							
						<?php if ($_SESSION['customer_id']) { ?>
							<a href="<?php echo zen_href_link(FILENAME_LOGOFF, '', 'SSL'); ?>"><?php echo HEADER_TITLE_LOGOFF; ?></a>
							<a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo HEADER_TITLE_MY_ACCOUNT; ?></a> 
						<?php
							  } else {
								if (STORE_STATUS == '0') {
						?>
							<a href="<?php echo zen_href_link(FILENAME_LOGIN, '', 'SSL'); ?>"><?php echo HEADER_TITLE_LOGIN; ?></a>  
						<?php } } ?>  
						
						<?php if ($_SESSION['cart']->count_contents() != 0) { ?>
							<a href="<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL'); ?>"><?php echo HEADER_TITLE_CART_CONTENTS; ?></a>
							<a href="<?php echo zen_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'); ?>"><?php echo HEADER_TITLE_CHECKOUT; ?></a>
						<?php } ?>
					<!-- ====================================== -->
				</div>
			</div>
		</div>
		<div class="horizontal-cat">
			<!--bof-drop down menu display-->
				<?php require($template->get_template_dir('tpl_drop_menu.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_drop_menu.php');?>
			<!--eof-drop down menu display-->
		</div>
		<div class="lang">
			<!-- ========== LANGUAGES ========== -->		
				<?php 
					if (!isset($lng) || (isset($lng) && !is_object($lng))) {
						$lng = new language;
					}
				
					reset($lng->catalog_languages);
				
					while (list($key, $value) = each($lng->catalog_languages)) {
						echo '<a href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('language', 'currency')) . 'language=' . $key, $request_type) . '">' . zen_image(DIR_WS_LANGUAGES.$value['directory'].'/images/'.$value['image'], $value['name'], '', '', ' style="vertical-align:middle;"') . '</a>';
					}
				?>
			<!-- =============================== -->
		</div>
		<div class="currencies">
			<!-- ========== CURRENCIES ========= -->
				<?php echo zen_draw_form('currencies', zen_href_link(basename(ereg_replace('.php','', $PHP_SELF)), '', $request_type, false), 'get'); ?>
					<div>
						<span class="label"><?php echo BOX_HEADING_CURRENCIES;?>: &nbsp;</span>
				
						<?php
							if (isset($currencies) && is_object($currencies)) {
						
							  reset($currencies->currencies);
							  $currencies_array = array();
							  while (list($key, $value) = each($currencies->currencies)) {
								$currencies_array[] = array('id' => $key, 'text' => $value['title']);
							  }
						
							  $hidden_get_variables = '';
							  reset($_GET);
							  while (list($key, $value) = each($_GET)) {
								if ( ($key != 'currency') && ($key != zen_session_name()) && ($key != 'x') && ($key != 'y') ) {
								  $hidden_get_variables .= zen_draw_hidden_field($key, $value);
								}
							  }
							}
						?>
						<?php echo zen_draw_pull_down_menu('currency', $currencies_array, $_SESSION['currency'], 'class="select" onchange="this.form.submit();"') . $hidden_get_variables . zen_hide_session_id()?>
					</div>
				</form>
			<!-- ====================================== -->
		</div>
	</div>

     
    
       


	<?php 
		if (HEADER_SALES_TEXT != '' || (SHOW_BANNERS_GROUP_SET2 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET2))) {
			if (HEADER_SALES_TEXT != '') {
	?>
        		<div id="tagline"><?php echo HEADER_SALES_TEXT;?></div>
	<?php
    		}
		}
	?>
   




	<!-- ========== CATEGORIES TABS ========= -->
		<?php require($template->get_template_dir('tpl_modules_categories_tabs.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_categories_tabs.php'); ?>
	<!-- ==================================== -->
                
    
<?php } ?>