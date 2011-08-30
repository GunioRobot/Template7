# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.0.91-log)
# Database: template7
# Generation Time: 2011-01-23 16:13:47 -0600
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table exp_accessories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_accessories`;

CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL auto_increment,
  `class` varchar(75) NOT NULL default '',
  `member_groups` varchar(50) NOT NULL default 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY  (`accessory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;
INSERT INTO `exp_accessories` (`accessory_id`,`class`,`member_groups`,`controllers`,`accessory_version`)
VALUES
	(1,'Expressionengine_info_acc','1|5','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','1.0');

/*!40000 ALTER TABLE `exp_accessories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_actions`;

CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL auto_increment,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY  (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;
INSERT INTO `exp_actions` (`action_id`,`class`,`method`)
VALUES
	(1,'Mailinglist','insert_new_email'),
	(2,'Mailinglist','authorize_email'),
	(3,'Mailinglist','unsubscribe'),
	(4,'Channel','insert_new_entry'),
	(5,'Channel','filemanager_endpoint'),
	(6,'Channel','smiley_pop'),
	(7,'Member','registration_form'),
	(8,'Member','register_member'),
	(9,'Member','activate_member'),
	(10,'Member','member_login'),
	(11,'Member','member_logout'),
	(12,'Member','retrieve_password'),
	(13,'Member','reset_password'),
	(14,'Member','send_member_email'),
	(15,'Member','update_un_pw'),
	(16,'Member','member_search'),
	(17,'Member','member_delete'),
	(18,'Email','send_email'),
	(19,'Comment','insert_new_comment'),
	(20,'Comment_mcp','delete_comment_notification'),
	(21,'Comment','comment_subscribe'),
	(22,'Comment','edit_comment'),
	(23,'Search','do_search'),
	(24,'Freeform','insert_new_entry'),
	(25,'Freeform','retrieve_entries'),
	(26,'Freeform','delete_freeform_notification');

/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_captcha
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_captcha`;

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL auto_increment,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY  (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_categories`;

CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) default NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;
INSERT INTO `exp_categories` (`cat_id`,`site_id`,`group_id`,`parent_id`,`cat_name`,`cat_url_title`,`cat_description`,`cat_image`,`cat_order`)
VALUES
	(1,1,1,0,'News','news','','',1),
	(2,1,1,0,'Tutorials','tutorials','','',2);

/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_field_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_field_data`;

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;
INSERT INTO `exp_category_field_data` (`cat_id`,`site_id`,`group_id`)
VALUES
	(1,1,1),
	(2,1,1);

/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_fields`;

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL default '',
  `field_label` varchar(50) NOT NULL default '',
  `field_type` varchar(12) NOT NULL default 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL default '128',
  `field_ta_rows` tinyint(2) NOT NULL default '8',
  `field_default_fmt` varchar(40) NOT NULL default 'none',
  `field_show_fmt` char(1) NOT NULL default 'y',
  `field_text_direction` char(3) NOT NULL default 'ltr',
  `field_required` char(1) NOT NULL default 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_groups`;

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL default 'a',
  `field_html_formatting` char(4) NOT NULL default 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;
INSERT INTO `exp_category_groups` (`group_id`,`site_id`,`group_name`,`sort_order`,`field_html_formatting`,`can_edit_categories`,`can_delete_categories`)
VALUES
	(1,1,'blog','a','all','','');

/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_posts`;

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_category_posts` WRITE;
/*!40000 ALTER TABLE `exp_category_posts` DISABLE KEYS */;
INSERT INTO `exp_category_posts` (`entry_id`,`cat_id`)
VALUES
	(3,1),
	(4,2),
	(5,1),
	(6,1);

/*!40000 ALTER TABLE `exp_category_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data`;

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;
INSERT INTO `exp_channel_data` (`entry_id`,`site_id`,`channel_id`,`field_id_1`,`field_ft_1`,`field_id_2`,`field_ft_2`,`field_id_3`,`field_ft_3`)
VALUES
	(1,1,1,'','xhtml','<img src=\"{filedir_1}default.png\" style=\"border: 0;\" alt=\"Lame Image Substituting for a Rocking Image of you\" class=\"imgleft\" width=\"120\" > This is an About Page Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.  \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ','xhtml','','xhtml'),
	(2,1,1,'','xhtml','This is some sample text for a Contact Page. This does not have to be included but if you wanted to say something nice to encourage people to send you an email via the form below then this is the place to do that.','xhtml','','xhtml'),
	(3,1,1,'','xhtml','<p>Blog-ee is a blogging template for ExpressionEngine </p>\n<h1>Heading One</h1>\n<h2>Heading Two</h2>\n<h3>Heading Three</h3>\n<h4>Heading Four</h4>\n<p>This is paragraph text. The rest of the <strong>text is merely</strong> a placeholder to let you see what paragraph text will look like. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh <i>euismod tincidunt ut laoreet</i> dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>\n<blockquote>This is a blockquote text. The rest of the text is merely a placeholder to let you see what this blockquote will look like.</blockquote>\n<a href=\"http://eetemplates.com\">This is a link</a>\n<ul><li>Unordered List Item One<ul><li>Unordered List Sub Item One</li><li>Unordered List Sub Item Two</li><li>Unordered List Sub Item Three</li></ul></li><li>Unordered List Item Two</li><li>Unordered List Item Three</li><li>Unordered List Item Four</li></ul>\n\n<ol><li>Ordered List Item One<ol>	<li>Ordered List Sub Item One</li><li>Ordered List Sub Item Two</li><li>Ordered List Sub Item Three</li></ol></li><li>Ordered List Item Two</li><li>Ordered List Item Three</li><li>Ordered List Item Four</li></ol>\n		\n<ul class=\"checklist\"><li>Checklist Item One</li><li>Checklist Item Two</li><li>Checklist Item Three</li><li>Checklist Item Four</li></ul>\n		\n<h4>Code</h4>\n[code]\n<p>By {name} on {comment_date format=\"%Y %m %d\"}</p>\n<ul class=\"checklist\"><li>Checklist Item One</li><li>Checklist Item Two</li><li>Checklist Item Three</li><li>Checklist Item Four</li></ul>\n[/code]','xhtml','','xhtml'),
	(4,1,1,'','xhtml','<h3>In the package</h3>\nIn this template package you will receive a zip file that contains 3 folders:\n<ul>\n<li>A Themes folder with the template in it</li>\n<li>A CSS folder which should be uploaded to the root of your site</li>\n<li>An image folder that should be added to the image folder you uploaded for ExpressionEngine</li>\n</ul>\n\nThe installation of Template7 is easy... Upload EE. Upload the CSS folder. Upload the contents of the images folder we provide into the images folder for EE. Upload the template from themes/site_themes into the corresponding folder on your server. Upload the files for <a href=\"http://expressionengine.com/downloads/details/word_limiter/\">Word_Limit</a> and <a href=\"http://www.solspace.com/software/detail/freeform/\">FreeForm</a>. Walk through the install process and select Template7 when you get to the configuration screen.\n\nAfter you have installed Template7 I suggest that you download <a href=\"http://www.hopstudios.com/software/deeploy_helper/\">Deeploy Helper from Hop Studios</a> and make sure to change all of the paths and specific data from the site. It may cause confusion in the future. Make sure to tip those guys too. Their software is great and they deserve it.','xhtml','','xhtml'),
	(5,1,1,'','xhtml','<h3>Export HTML using a WYSIWYG? No Way!</h3>\nAgain, we hand code all of our templates. We are big fans of the <a href=\"http://960.gs\" title=\"960 Grid System\">960 Grid System</a> (see next point). Template7 validates <a href=\"\" title=\"HTML 4.01 Strict\">HTML 4.01 Strict</a> and <a href=\"\" title=\"valid CSS 3\">valid CSS 3</a>. We used semantic HTML for the template so the Business Name in the header is an H1. The tagline is an H2. The navigation is a unstructured list and so on. All of the Titles of the Articles are links to the articles and they are also H2s. It should be a great template for a site that values SEO. \n\n<h3>We see grids everywhere!</h3>\nWe use the <b><a href=\"http://960.gs\" title=\"960 Grid\">960 Grid</a></b> for just about everything now. It is a lightweight CSS framework that was written by <a href=\"http://sonspring.com/\" title=\"Nathan Smith\">Nathan Smith</a>. The 960 grid system is extremely helpful as it helps with cross browser support. Meaning this site should look the same whether you are using Opera, Safari, Firefox 3, or Internet Explorer 7. Technically speaking we don\'t support IE6 anymore but the code should still work. Also, if you need to make changes then that should be a breeze as the 960 grid system is quite easy to learn.\n\n<h3>ExpressionEngine</h3>\nBy using ExpressionEngine to build this template we are able to make it easy for fairly non technical people to update everything on the site from the Name and Tagline in the header to the content in the footer and contact page. We use a new feature of EE2 called Snippets for displaying the following:\n<ul class=\"checklist\">\n<li>Company Name - updates the name in the header and anywhere else the {companyname} variable is used</li>\n<li>Tagline - updates the tagline underneath the company name in the header and anywhere else the {tagline} variable is used</li>\n<li>Email Address - updates the email address in the footer and on the contact page and anywhere else the {emailaddress} variable is used</li>\n<li>Phone Number - updates the phone number in the footer and on the contact page and anywhere else the {phone} variable is used</li>\n<li>Fax Number - updates the fax number on the contact page and anywhere else the {fax} variable is used</li>\n<li>Street Address - updates the street address on the contact page and anywhere else the {streetaddress} variable is used</li>\n<li>City - updates the city on the contact page and anywhere else the {city} variable is used</li>\n<li>State - updates the state on the contact page and anywhere else the {state} variable is used</li>\n<li>Zip Code - updates the zip code on the contact page and anywhere else the {zip} variable is used</li>\n<li>Social Media Links - Twitter, Myspace, Vimeo, Youtube, Facebook and LinkedIn are all configurable from the path.php file</li>\n<li>Side Bar Ads - If you want to display Ads in the side bar you can either use EE to manage those or just drop your code into the .ads template and your ads will appear below the navigation. But a simple yes or no enables this feature in the path.php file</li>\n<li>Side Bar Functionality - Same goes for About the Author, the links for the Membership portions of EE, the Calendar, Syndication Links and the Mailing list. Don\'t want a Calendar? Just type no in the field in the path.php file and it goes away. Want your RSS feed to show up? Type a yes in the field next to that variable and it will appear.</li>\n<li>Titles - We all know that Titles and Content are the Holy Grail for SEO. So we made the Titles of the Blog Entries the Titles to the page. So when someone clicks on the comments for a particular article then the Title tag will grab and display the title of the article they are viewing. This goes for Robot for Search Engines too. But, the titles for the more static pages we made configurable so we have spaces in the path.php file where you fill in the title tag information for the About, Contact, Category List and Archive List pages.</li>\n</ul>\nHaving these variables defined helps in maintenance of the site. To update any of these variables across the site all you have to so is change the value in snippets for the phone number (for instance) it updates both the contact page and the footer on all pages. So you don\'t have to hunt through the HTML in the Templates to make that change. \n\n<h3>Freeform</h3>\nWe think <a href=\"http://www.solspace.com/software/detail/freeform/\" title=\"freeform\">freeform</a> rocks. So much so that it was our <a href=\"http://eetemplates.com/index.php/blog/comments/plug-in_review_freeform/\" title=\"first Module Review\">first Module Review</a>. While we don\'t create the fields for you in Freeform we do provide the front end form and style it. Freeform is arguable the best form module available for ExpressionEngine. And it is free. \n\n<h3>Searching... Searching... Searching....</h3>\nWe went ahead and styled the search results page for you. ;-) Your welcome!\n\n<h3>The includes from PHP are Embed...</h3>\nEmbeds make maintaining a website a whole lot easier. We use embeds to isolate everything from the head, css files, script files, analytics and navigation (and more) so that if you need to make a change you can do so quickly and know that the change will populate across the site. \n\n<h3>I like pretty pictures</h3>\nThe images that you embed into the Blog will be styled if you just add a class name to them. So if you add the class name imgright (class=\"imgright\") the image will float to the right and have the appropriate amount of margin on the top, left and bottom sides. If you use imgleft (class=\"imgleft\") then the image is styled by floating it to the left and given the appropriate amount of margin on the top, right and bottom sides. And if you use imgcenter (class=\"imgcenter\") the image will center in the container and have margin on the top and bottom.\n\n<h3>Plugins that we\'ve plugged in</h3>\nYou will need to download <a href=\"http://www.solspace.com/software/detail/freeform/\" title=\"Freeform\">Freeform from Solspace</a> for use with this template. They are all free. We just did not want to step on any toes by passing on versions of each of these cool add-ons for ExpressionEngine. Once you have installed them the Freeform module will need a firstname, lastname, email, and message field. \n\n<h3>RSS what? and Emily Lewis</h3>\nEmily Lewis recently wrote an article on getting the formatting up to par in the <a href=\"{path=\'blog/rss2\'}\" title=\"RSS2 template\">RSS2 template</a> for ExpressionEngine. She took the <a href=\"http://ablognotlimited.com/articles/customizing-expressionengine-rss-template\" title=\"time to outline various changes\">time to outline various changes</a> that she made to her RSS feed and why. We found those changes to be pretty kick butt so we incorporated them into the <a href=\"{path=\'blog/rss2\'}\" title=\"RSS template for Template7\">RSS template for Blog-ee</a>.\n\n<h3>Related to whom?</h3>\nI love having <a href=\"{path=\'blog/comments/welcome_to_blog-ee/\'}\" title=\"related posts on my blog\">related posts on my blog</a> so I went ahead and made that a feature on Template7. This will make it much easier for your readers to find other articles that are similar and ultimately keep them on your site.\n\n<h3>Lists Lists everywhere</h3>\nWant your visitors to be able to see what you have been writing? Well we make it easy for them to view your articles by <a href=\"{path=\'blog/categories\'}\">Category</a> or by <a href=\"{path=\'blog/archives\'}\">Date</a>. Handy!\n\n<h3>A chance we\'ll have to take</h3>\nWe don\'t support IE6. Nuff said....\n','xhtml','','xhtml'),
	(6,1,1,'','xhtml','Welcome to Template7 a blog template for ExpressionEngine. If you are in need of a Search Engine Optimized blog for your website then look no further. We have taken every consideration into account from the Semantic HTML to the Order of Content to the Title Tags. Just look at <a href=\"{path=\'blog/indexnocss\'}\">this unstyled page</a> to get a glimpse of what Search Engines will see when they come to a site built using this template. \n\nThere are many other features that we outline below. But more importantly if I were wanting to learn how to use EE this is the site I would do it with. Every custom site I build has some aspect of a blog or news releases portion on it. The code we used for this template could be used as part of a larger site and would save hours of time coding a scouring the forums for that little nugget of code. \n\nAnyway, continue reading for more details...','xhtml','','xhtml');

/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_entries_autosave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL default '0',
  `pentry_id` int(10) NOT NULL default '0',
  `forum_topic_id` int(10) unsigned default NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL default 'n',
  `view_count_one` int(10) unsigned NOT NULL default '0',
  `view_count_two` int(10) unsigned NOT NULL default '0',
  `view_count_three` int(10) unsigned NOT NULL default '0',
  `view_count_four` int(10) unsigned NOT NULL default '0',
  `allow_comments` varchar(1) NOT NULL default 'y',
  `sticky` varchar(1) NOT NULL default 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL default 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL default '0',
  `comment_expiration_date` int(10) NOT NULL default '0',
  `edit_date` bigint(14) default NULL,
  `recent_comment_date` int(10) default NULL,
  `comment_total` int(4) unsigned NOT NULL default '0',
  `entry_data` text,
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_fields`;

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL default 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL default 'n',
  `field_pre_channel_id` int(6) unsigned default NULL,
  `field_pre_field_id` int(6) unsigned default NULL,
  `field_related_to` varchar(12) NOT NULL default 'channel',
  `field_related_id` int(6) unsigned NOT NULL default '0',
  `field_related_orderby` varchar(12) NOT NULL default 'date',
  `field_related_sort` varchar(4) NOT NULL default 'desc',
  `field_related_max` smallint(4) NOT NULL default '0',
  `field_ta_rows` tinyint(2) default '8',
  `field_maxl` smallint(3) default NULL,
  `field_required` char(1) NOT NULL default 'n',
  `field_text_direction` char(3) NOT NULL default 'ltr',
  `field_search` char(1) NOT NULL default 'n',
  `field_is_hidden` char(1) NOT NULL default 'n',
  `field_fmt` varchar(40) NOT NULL default 'xhtml',
  `field_show_fmt` char(1) NOT NULL default 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL default 'any',
  `field_settings` text,
  PRIMARY KEY  (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` (`field_id`,`site_id`,`group_id`,`field_name`,`field_label`,`field_instructions`,`field_type`,`field_list_items`,`field_pre_populate`,`field_pre_channel_id`,`field_pre_field_id`,`field_related_to`,`field_related_id`,`field_related_orderby`,`field_related_sort`,`field_related_max`,`field_ta_rows`,`field_maxl`,`field_required`,`field_text_direction`,`field_search`,`field_is_hidden`,`field_fmt`,`field_show_fmt`,`field_order`,`field_content_type`,`field_settings`)
VALUES
	(1,1,1,'summary','Summary','','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','y','n','xhtml','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(2,1,1,'body','Body','','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'y','ltr','y','n','xhtml','n',2,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(3,1,1,'extended','Extended','','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','y','n','xhtml','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');

/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_member_groups`;

CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_channel_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_titles`;

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL default '0',
  `pentry_id` int(10) NOT NULL default '0',
  `forum_topic_id` int(10) unsigned default NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL default 'n',
  `view_count_one` int(10) unsigned NOT NULL default '0',
  `view_count_two` int(10) unsigned NOT NULL default '0',
  `view_count_three` int(10) unsigned NOT NULL default '0',
  `view_count_four` int(10) unsigned NOT NULL default '0',
  `allow_comments` varchar(1) NOT NULL default 'y',
  `sticky` varchar(1) NOT NULL default 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL default 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL default '0',
  `comment_expiration_date` int(10) NOT NULL default '0',
  `edit_date` bigint(14) default NULL,
  `recent_comment_date` int(10) default NULL,
  `comment_total` int(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` (`entry_id`,`site_id`,`channel_id`,`author_id`,`pentry_id`,`forum_topic_id`,`ip_address`,`title`,`url_title`,`status`,`versioning_enabled`,`view_count_one`,`view_count_two`,`view_count_three`,`view_count_four`,`allow_comments`,`sticky`,`entry_date`,`dst_enabled`,`year`,`month`,`day`,`expiration_date`,`comment_expiration_date`,`edit_date`,`recent_comment_date`,`comment_total`)
VALUES
	(1,1,1,1,0,0,'68.209.188.139','About','about','open','y',0,0,0,0,'y','n',1266793171,'n','2010','02','21',0,0,20100221173234,0,0),
	(2,1,1,1,0,0,'68.209.188.139','Contact','contact','open','y',0,0,0,0,'y','n',1266795179,'n','2010','02','21',0,0,20100221173401,0,0),
	(3,1,1,1,0,0,'68.220.174.118','Typography','typography','open','y',0,0,0,0,'y','n',1266795295,'n','2010','02','21',0,0,20110106161856,0,0),
	(4,1,1,1,0,0,'68.220.174.118','What do you get?','what_do_you_get','open','y',0,0,0,0,'y','n',1266791807,'n','2010','02','21',0,0,20110106163348,0,0),
	(5,1,1,1,0,0,'68.220.174.118','Features','features','open','y',0,0,0,0,'y','n',1282288356,'n','2010','08','20',0,0,20110106161837,0,2),
	(6,1,1,1,0,0,'68.220.174.118','Welcome to Template7','welcome_to_template7','open','y',0,0,0,0,'y','n',1294330886,'n','2011','01','06',0,0,20110106162127,0,0);

/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels`;

CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) default NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL default '0',
  `total_comments` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `cat_group` varchar(255) default NULL,
  `status_group` int(4) unsigned default NULL,
  `deft_status` varchar(50) NOT NULL default 'open',
  `field_group` int(4) unsigned default NULL,
  `search_excerpt` int(4) unsigned default NULL,
  `deft_category` varchar(60) default NULL,
  `deft_comments` char(1) NOT NULL default 'y',
  `channel_require_membership` char(1) NOT NULL default 'y',
  `channel_max_chars` int(5) unsigned default NULL,
  `channel_html_formatting` char(4) NOT NULL default 'all',
  `channel_allow_img_urls` char(1) NOT NULL default 'y',
  `channel_auto_link_urls` char(1) NOT NULL default 'y',
  `channel_notify` char(1) NOT NULL default 'n',
  `channel_notify_emails` varchar(255) default NULL,
  `comment_url` varchar(80) default NULL,
  `comment_system_enabled` char(1) NOT NULL default 'y',
  `comment_require_membership` char(1) NOT NULL default 'n',
  `comment_use_captcha` char(1) NOT NULL default 'n',
  `comment_moderate` char(1) NOT NULL default 'n',
  `comment_max_chars` int(5) unsigned default '5000',
  `comment_timelock` int(5) unsigned NOT NULL default '0',
  `comment_require_email` char(1) NOT NULL default 'y',
  `comment_text_formatting` char(5) NOT NULL default 'xhtml',
  `comment_html_formatting` char(4) NOT NULL default 'safe',
  `comment_allow_img_urls` char(1) NOT NULL default 'n',
  `comment_auto_link_urls` char(1) NOT NULL default 'y',
  `comment_notify` char(1) NOT NULL default 'n',
  `comment_notify_authors` char(1) NOT NULL default 'n',
  `comment_notify_emails` varchar(255) default NULL,
  `comment_expiration` int(4) unsigned NOT NULL default '0',
  `search_results_url` varchar(80) default NULL,
  `ping_return_url` varchar(80) default NULL,
  `show_button_cluster` char(1) NOT NULL default 'y',
  `rss_url` varchar(80) default NULL,
  `enable_versioning` char(1) NOT NULL default 'n',
  `max_revisions` smallint(4) unsigned NOT NULL default '10',
  `default_entry_title` varchar(100) default NULL,
  `url_title_prefix` varchar(80) default NULL,
  `live_look_template` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` (`channel_id`,`site_id`,`channel_name`,`channel_title`,`channel_url`,`channel_description`,`channel_lang`,`total_entries`,`total_comments`,`last_entry_date`,`last_comment_date`,`cat_group`,`status_group`,`deft_status`,`field_group`,`search_excerpt`,`deft_category`,`deft_comments`,`channel_require_membership`,`channel_max_chars`,`channel_html_formatting`,`channel_allow_img_urls`,`channel_auto_link_urls`,`channel_notify`,`channel_notify_emails`,`comment_url`,`comment_system_enabled`,`comment_require_membership`,`comment_use_captcha`,`comment_moderate`,`comment_max_chars`,`comment_timelock`,`comment_require_email`,`comment_text_formatting`,`comment_html_formatting`,`comment_allow_img_urls`,`comment_auto_link_urls`,`comment_notify`,`comment_notify_authors`,`comment_notify_emails`,`comment_expiration`,`search_results_url`,`ping_return_url`,`show_button_cluster`,`rss_url`,`enable_versioning`,`max_revisions`,`default_entry_title`,`url_title_prefix`,`live_look_template`)
VALUES
	(1,1,'blog','Blog','http://sandbox.macminiparking.com/template7/','','en',6,2,0,1282333794,'1',1,'open',1,2,'','y','y',NULL,'all','y','y','n','','http://sandbox.macminiparking.com/template7//index.php/blog/comments','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'http://sandbox.macminiparking.com/template7//index.php/blog/comments','','y','http://demo.eetemplates.com/blogee/index.php/blog/rss2','n',10,'','',0);

/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_comment_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comment_subscriptions`;

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned default NULL,
  `member_id` int(10) default '0',
  `email` varchar(50) default NULL,
  `subscription_date` varchar(10) default NULL,
  `notification_sent` char(1) default 'n',
  `hash` varchar(15) default NULL,
  PRIMARY KEY  (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comments`;

CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) default '1',
  `entry_id` int(10) unsigned default '0',
  `channel_id` int(4) unsigned default '1',
  `author_id` int(10) unsigned default '0',
  `status` char(1) default '0',
  `name` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `url` varchar(75) default NULL,
  `location` varchar(50) default NULL,
  `ip_address` varchar(16) default NULL,
  `comment_date` int(10) default NULL,
  `edit_date` int(10) default NULL,
  `comment` text,
  `notify` char(1) default 'n',
  PRIMARY KEY  (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_comments` WRITE;
/*!40000 ALTER TABLE `exp_comments` DISABLE KEYS */;
INSERT INTO `exp_comments` (`comment_id`,`site_id`,`entry_id`,`channel_id`,`author_id`,`status`,`name`,`email`,`url`,`location`,`ip_address`,`comment_date`,`edit_date`,`comment`,`notify`)
VALUES
	(1,1,5,1,1,'o','admin','info@eetemplates.com','','0','68.220.177.100',1282333786,NULL,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.','y'),
	(2,1,5,1,1,'o','admin','info@eetemplates.com','','0','68.220.177.100',1282333794,NULL,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.','y');

/*!40000 ALTER TABLE `exp_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_log`;

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` (`id`,`site_id`,`member_id`,`username`,`ip_address`,`act_date`,`action`)
VALUES
	(1,1,1,'admin','68.220.174.118',1294352047,'Logged in'),
	(2,1,1,'admin','68.220.161.243',1295820441,'Logged in');

/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_search_index`;

CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL auto_increment,
  `controller` varchar(20) default NULL,
  `method` varchar(50) default NULL,
  `language` varchar(20) default NULL,
  `access` varchar(50) default NULL,
  `keywords` text,
  PRIMARY KEY  (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache`;

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL auto_increment,
  `cache_date` int(10) unsigned NOT NULL default '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL default 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL default 'y',
  `priority` char(1) NOT NULL default '3',
  PRIMARY KEY  (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_cache_mg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_mg`;

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY  (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_cache_ml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_ml`;

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY  (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_console_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_console_cache`;

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL auto_increment,
  `cache_date` int(10) unsigned NOT NULL default '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY  (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_tracker`;

CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL auto_increment,
  `email_date` int(10) unsigned NOT NULL default '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL default '1',
  PRIMARY KEY  (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table exp_entry_ping_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_ping_status`;

CREATE TABLE `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entry_id`,`ping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_entry_versioning
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_versioning`;

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY  (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_extensions`;

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL auto_increment,
  `class` varchar(50) NOT NULL default '',
  `method` varchar(50) NOT NULL default '',
  `hook` varchar(50) NOT NULL default '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL default '10',
  `version` varchar(10) NOT NULL default '',
  `enabled` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_field_formatting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_formatting`;

CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL auto_increment,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY  (`formatting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` (`formatting_id`,`field_id`,`field_fmt`)
VALUES
	(1,1,'none'),
	(2,1,'br'),
	(3,1,'xhtml'),
	(4,2,'none'),
	(5,2,'br'),
	(6,2,'xhtml'),
	(7,3,'none'),
	(8,3,'br'),
	(9,3,'xhtml');

/*!40000 ALTER TABLE `exp_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_groups`;

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` (`group_id`,`site_id`,`group_name`)
VALUES
	(1,1,'Blog');

/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_fieldtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_fieldtypes`;

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) default 'n',
  PRIMARY KEY  (`fieldtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_fieldtypes` (`fieldtype_id`,`name`,`version`,`settings`,`has_global_settings`)
VALUES
	(1,'select','1.0','YTowOnt9','n'),
	(2,'text','1.0','YTowOnt9','n'),
	(3,'textarea','1.0','YTowOnt9','n'),
	(4,'date','1.0','YTowOnt9','n'),
	(5,'file','1.0','YTowOnt9','n'),
	(6,'multi_select','1.0','YTowOnt9','n'),
	(7,'checkboxes','1.0','YTowOnt9','n'),
	(8,'radio','1.0','YTowOnt9','n'),
	(9,'rel','1.0','YTowOnt9','n');

/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_attachments`;

CREATE TABLE `exp_freeform_attachments` (
  `attachment_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL,
  `pref_id` int(10) unsigned NOT NULL,
  `entry_date` int(10) NOT NULL,
  `server_path` varchar(150) NOT NULL,
  `filename` varchar(150) NOT NULL,
  `extension` varchar(7) NOT NULL,
  `filesize` int(10) NOT NULL,
  `emailed` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`attachment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `pref_id` (`pref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_entries`;

CREATE TABLE `exp_freeform_entries` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `group_id` int(10) unsigned NOT NULL default '0',
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `form_name` varchar(50) NOT NULL,
  `template` varchar(150) NOT NULL,
  `entry_date` int(10) NOT NULL,
  `edit_date` int(10) NOT NULL,
  `status` char(10) NOT NULL default 'open',
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `street1` varchar(50) NOT NULL,
  `street2` varchar(50) NOT NULL,
  `street3` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `postalcode` varchar(50) NOT NULL,
  `phone1` varchar(50) NOT NULL,
  `phone2` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  PRIMARY KEY  (`entry_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_fields`;

CREATE TABLE `exp_freeform_fields` (
  `field_id` int(10) unsigned NOT NULL auto_increment,
  `field_order` int(10) NOT NULL default '0',
  `field_type` varchar(50) NOT NULL default 'text',
  `field_length` int(3) NOT NULL default '150',
  `form_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `name_old` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL default '0',
  `entry_date` int(10) NOT NULL,
  `edit_date` int(10) NOT NULL,
  `editable` char(1) NOT NULL default 'y',
  `status` char(10) NOT NULL default 'open',
  PRIMARY KEY  (`field_id`),
  KEY `name` (`name`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_fields` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fields` DISABLE KEYS */;
INSERT INTO `exp_freeform_fields` (`field_id`,`field_order`,`field_type`,`field_length`,`form_name`,`name`,`name_old`,`label`,`weblog_id`,`author_id`,`entry_date`,`edit_date`,`editable`,`status`)
VALUES
	(1,1,'text',150,'','name','','Name',0,0,0,0,'n',''),
	(2,2,'text',150,'','email','','Email',0,0,0,0,'n',''),
	(3,3,'text',150,'','website','','Website',0,0,0,0,'n',''),
	(4,4,'text',150,'','street1','','Street 1',0,0,0,0,'n',''),
	(5,5,'text',150,'','street2','','Street 2',0,0,0,0,'n',''),
	(6,6,'text',150,'','street3','','Street 3',0,0,0,0,'n',''),
	(7,7,'text',150,'','city','','City',0,0,0,0,'n',''),
	(8,8,'text',150,'','state','','State',0,0,0,0,'n',''),
	(9,9,'text',150,'','country','','Country',0,0,0,0,'n',''),
	(10,10,'text',150,'','postalcode','','Postal Code',0,0,0,0,'n',''),
	(11,11,'text',150,'','phone1','','Phone 1',0,0,0,0,'n',''),
	(12,12,'text',150,'','phone2','','Phone 2',0,0,0,0,'n',''),
	(13,13,'text',150,'','fax','','Fax',0,0,0,0,'n','');

/*!40000 ALTER TABLE `exp_freeform_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_params
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_params`;

CREATE TABLE `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL auto_increment,
  `entry_date` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`params_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;
INSERT INTO `exp_freeform_params` (`params_id`,`entry_date`,`data`)
VALUES
	(1,1295820456,'a:18:{s:15:\"require_captcha\";s:3:\"yes\";s:9:\"form_name\";s:12:\"default_form\";s:10:\"require_ip\";s:0:\"\";s:11:\"ee_required\";s:32:\"firstname|lastname|email|message\";s:9:\"ee_notify\";s:0:\"\";s:10:\"recipients\";s:1:\"n\";s:15:\"recipient_limit\";s:2:\"10\";s:17:\"static_recipients\";b:0;s:22:\"static_recipients_list\";a:0:{}s:18:\"recipient_template\";s:16:\"default_template\";s:13:\"discard_field\";s:0:\"\";s:15:\"send_attachment\";s:0:\"\";s:15:\"send_user_email\";s:0:\"\";s:20:\"send_user_attachment\";s:0:\"\";s:19:\"user_email_template\";s:16:\"default_template\";s:8:\"template\";s:16:\"default_template\";s:20:\"prevent_duplicate_on\";s:0:\"\";s:11:\"file_upload\";s:0:\"\";}');

/*!40000 ALTER TABLE `exp_freeform_params` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_preferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_preferences`;

CREATE TABLE `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL auto_increment,
  `preference_name` varchar(80) NOT NULL,
  `preference_value` text NOT NULL,
  PRIMARY KEY  (`preference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_templates`;

CREATE TABLE `exp_freeform_templates` (
  `template_id` int(6) unsigned NOT NULL auto_increment,
  `enable_template` char(1) NOT NULL default 'y',
  `wordwrap` char(1) NOT NULL default 'y',
  `html` char(1) NOT NULL default 'n',
  `template_name` varchar(150) NOT NULL,
  `template_label` varchar(150) NOT NULL,
  `data_from_name` varchar(150) NOT NULL,
  `data_from_email` varchar(200) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY  (`template_id`),
  KEY `template_name` (`template_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_templates` WRITE;
/*!40000 ALTER TABLE `exp_freeform_templates` DISABLE KEYS */;
INSERT INTO `exp_freeform_templates` (`template_id`,`enable_template`,`wordwrap`,`html`,`template_name`,`template_label`,`data_from_name`,`data_from_email`,`data_title`,`template_data`)
VALUES
	(1,'y','y','n','default_template','Default Template','','','Someone has posted to Freeform','Someone has posted to Freeform. Here are the details:  \n			 		\nEntry Date: {entry_date}\n{all_custom_fields}');

/*!40000 ALTER TABLE `exp_freeform_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_user_email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_user_email`;

CREATE TABLE `exp_freeform_user_email` (
  `email_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL,
  `email_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_global_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_global_variables`;

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY  (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;



# Dump of table exp_html_buttons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_html_buttons`;

CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL default '1',
  `classname` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;
INSERT INTO `exp_html_buttons` (`id`,`site_id`,`member_id`,`tag_name`,`tag_open`,`tag_close`,`accesskey`,`tag_order`,`tag_row`,`classname`)
VALUES
	(1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),
	(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),
	(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),
	(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),
	(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');

/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_layout_publish
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish`;

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_group` int(4) unsigned NOT NULL default '0',
  `channel_id` int(4) unsigned NOT NULL default '0',
  `field_layout` text,
  PRIMARY KEY  (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_mailing_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_mailing_list`;

CREATE TABLE `exp_mailing_list` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `list_id` int(7) unsigned NOT NULL,
  `authcode` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  PRIMARY KEY  (`user_id`),
  KEY `list_id` (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_mailing_list_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_mailing_list_queue`;

CREATE TABLE `exp_mailing_list_queue` (
  `queue_id` int(10) unsigned NOT NULL auto_increment,
  `email` varchar(50) NOT NULL,
  `list_id` int(7) unsigned NOT NULL default '0',
  `authcode` varchar(10) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY  (`queue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_mailing_lists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_mailing_lists`;

CREATE TABLE `exp_mailing_lists` (
  `list_id` int(7) unsigned NOT NULL auto_increment,
  `list_name` varchar(40) NOT NULL,
  `list_title` varchar(100) NOT NULL,
  `list_template` text NOT NULL,
  PRIMARY KEY  (`list_id`),
  KEY `list_name` (`list_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_mailing_lists` WRITE;
/*!40000 ALTER TABLE `exp_mailing_lists` DISABLE KEYS */;
INSERT INTO `exp_mailing_lists` (`list_id`,`list_name`,`list_title`,`list_template`)
VALUES
	(1,'default','Default Mailing List','{message_text}\n\nTo remove your email from this mailing list, click here:\n{if html_email}<a href=\\\"{unsubscribe_url}\\\">{unsubscribe_url}</a>{/if}\n{if plain_email}{unsubscribe_url}{/if}');

/*!40000 ALTER TABLE `exp_mailing_lists` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_bulletin_board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_bulletin_board`;

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL default '',
  `bulletin_expires` int(10) unsigned NOT NULL default '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY  (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_member_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_data`;

CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;
INSERT INTO `exp_member_data` (`member_id`)
VALUES
	(1);

/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_fields`;

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL auto_increment,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL default 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) default '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL default 'y',
  `m_field_required` char(1) NOT NULL default 'n',
  `m_field_public` char(1) NOT NULL default 'y',
  `m_field_reg` char(1) NOT NULL default 'n',
  `m_field_fmt` char(5) NOT NULL default 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_groups`;

CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL default 'y',
  `can_view_offline_system` char(1) NOT NULL default 'n',
  `can_view_online_system` char(1) NOT NULL default 'y',
  `can_access_cp` char(1) NOT NULL default 'y',
  `can_access_content` char(1) NOT NULL default 'n',
  `can_access_publish` char(1) NOT NULL default 'n',
  `can_access_edit` char(1) NOT NULL default 'n',
  `can_access_files` char(1) NOT NULL default 'n',
  `can_access_design` char(1) NOT NULL default 'n',
  `can_access_addons` char(1) NOT NULL default 'n',
  `can_access_modules` char(1) NOT NULL default 'n',
  `can_access_extensions` char(1) NOT NULL default 'n',
  `can_access_accessories` char(1) NOT NULL default 'n',
  `can_access_plugins` char(1) NOT NULL default 'n',
  `can_access_members` char(1) NOT NULL default 'n',
  `can_access_admin` char(1) NOT NULL default 'n',
  `can_access_sys_prefs` char(1) NOT NULL default 'n',
  `can_access_content_prefs` char(1) NOT NULL default 'n',
  `can_access_tools` char(1) NOT NULL default 'n',
  `can_access_comm` char(1) NOT NULL default 'n',
  `can_access_utilities` char(1) NOT NULL default 'n',
  `can_access_data` char(1) NOT NULL default 'n',
  `can_access_logs` char(1) NOT NULL default 'n',
  `can_admin_channels` char(1) NOT NULL default 'n',
  `can_admin_design` char(1) NOT NULL default 'n',
  `can_admin_members` char(1) NOT NULL default 'n',
  `can_delete_members` char(1) NOT NULL default 'n',
  `can_admin_mbr_groups` char(1) NOT NULL default 'n',
  `can_admin_mbr_templates` char(1) NOT NULL default 'n',
  `can_ban_users` char(1) NOT NULL default 'n',
  `can_admin_modules` char(1) NOT NULL default 'n',
  `can_admin_templates` char(1) NOT NULL default 'n',
  `can_admin_accessories` char(1) NOT NULL default 'n',
  `can_edit_categories` char(1) NOT NULL default 'n',
  `can_delete_categories` char(1) NOT NULL default 'n',
  `can_view_other_entries` char(1) NOT NULL default 'n',
  `can_edit_other_entries` char(1) NOT NULL default 'n',
  `can_assign_post_authors` char(1) NOT NULL default 'n',
  `can_delete_self_entries` char(1) NOT NULL default 'n',
  `can_delete_all_entries` char(1) NOT NULL default 'n',
  `can_view_other_comments` char(1) NOT NULL default 'n',
  `can_edit_own_comments` char(1) NOT NULL default 'n',
  `can_delete_own_comments` char(1) NOT NULL default 'n',
  `can_edit_all_comments` char(1) NOT NULL default 'n',
  `can_delete_all_comments` char(1) NOT NULL default 'n',
  `can_moderate_comments` char(1) NOT NULL default 'n',
  `can_send_email` char(1) NOT NULL default 'n',
  `can_send_cached_email` char(1) NOT NULL default 'n',
  `can_email_member_groups` char(1) NOT NULL default 'n',
  `can_email_mailinglist` char(1) NOT NULL default 'n',
  `can_email_from_profile` char(1) NOT NULL default 'n',
  `can_view_profiles` char(1) NOT NULL default 'n',
  `can_delete_self` char(1) NOT NULL default 'n',
  `mbr_delete_notify_emails` varchar(255) default NULL,
  `can_post_comments` char(1) NOT NULL default 'n',
  `exclude_from_moderation` char(1) NOT NULL default 'n',
  `can_search` char(1) NOT NULL default 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL default 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL default '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL default '60',
  `can_attach_in_private_messages` char(1) NOT NULL default 'n',
  `can_send_bulletins` char(1) NOT NULL default 'n',
  `include_in_authorlist` char(1) NOT NULL default 'n',
  `include_in_memberlist` char(1) NOT NULL default 'y',
  `include_in_mailinglists` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;
INSERT INTO `exp_member_groups` (`group_id`,`site_id`,`group_title`,`group_description`,`is_locked`,`can_view_offline_system`,`can_view_online_system`,`can_access_cp`,`can_access_content`,`can_access_publish`,`can_access_edit`,`can_access_files`,`can_access_design`,`can_access_addons`,`can_access_modules`,`can_access_extensions`,`can_access_accessories`,`can_access_plugins`,`can_access_members`,`can_access_admin`,`can_access_sys_prefs`,`can_access_content_prefs`,`can_access_tools`,`can_access_comm`,`can_access_utilities`,`can_access_data`,`can_access_logs`,`can_admin_channels`,`can_admin_design`,`can_admin_members`,`can_delete_members`,`can_admin_mbr_groups`,`can_admin_mbr_templates`,`can_ban_users`,`can_admin_modules`,`can_admin_templates`,`can_admin_accessories`,`can_edit_categories`,`can_delete_categories`,`can_view_other_entries`,`can_edit_other_entries`,`can_assign_post_authors`,`can_delete_self_entries`,`can_delete_all_entries`,`can_view_other_comments`,`can_edit_own_comments`,`can_delete_own_comments`,`can_edit_all_comments`,`can_delete_all_comments`,`can_moderate_comments`,`can_send_email`,`can_send_cached_email`,`can_email_member_groups`,`can_email_mailinglist`,`can_email_from_profile`,`can_view_profiles`,`can_delete_self`,`mbr_delete_notify_emails`,`can_post_comments`,`exclude_from_moderation`,`can_search`,`search_flood_control`,`can_send_private_messages`,`prv_msg_send_limit`,`prv_msg_storage_limit`,`can_attach_in_private_messages`,`can_send_bulletins`,`include_in_authorlist`,`include_in_memberlist`,`include_in_mailinglists`)
VALUES
	(1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),
	(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),
	(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),
	(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),
	(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');

/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_homepage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_homepage`;

CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL default 'l',
  `recent_entries_order` int(3) unsigned NOT NULL default '0',
  `recent_comments` char(1) NOT NULL default 'l',
  `recent_comments_order` int(3) unsigned NOT NULL default '0',
  `recent_members` char(1) NOT NULL default 'n',
  `recent_members_order` int(3) unsigned NOT NULL default '0',
  `site_statistics` char(1) NOT NULL default 'r',
  `site_statistics_order` int(3) unsigned NOT NULL default '0',
  `member_search_form` char(1) NOT NULL default 'n',
  `member_search_form_order` int(3) unsigned NOT NULL default '0',
  `notepad` char(1) NOT NULL default 'r',
  `notepad_order` int(3) unsigned NOT NULL default '0',
  `bulletin_board` char(1) NOT NULL default 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL default '0',
  `pmachine_news_feed` char(1) NOT NULL default 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;
INSERT INTO `exp_member_homepage` (`member_id`,`recent_entries`,`recent_entries_order`,`recent_comments`,`recent_comments_order`,`recent_members`,`recent_members_order`,`site_statistics`,`site_statistics_order`,`member_search_form`,`member_search_form_order`,`notepad`,`notepad_order`,`bulletin_board`,`bulletin_board_order`,`pmachine_news_feed`,`pmachine_news_feed_order`)
VALUES
	(1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0);

/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_search`;

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members`;

CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL auto_increment,
  `group_id` smallint(4) NOT NULL default '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) default NULL,
  `authcode` varchar(10) default NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) default NULL,
  `location` varchar(50) default NULL,
  `occupation` varchar(80) default NULL,
  `interests` varchar(120) default NULL,
  `bday_d` int(2) default NULL,
  `bday_m` int(2) default NULL,
  `bday_y` int(4) default NULL,
  `aol_im` varchar(50) default NULL,
  `yahoo_im` varchar(50) default NULL,
  `msn_im` varchar(50) default NULL,
  `icq` varchar(50) default NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) default NULL,
  `avatar_width` int(4) unsigned default NULL,
  `avatar_height` int(4) unsigned default NULL,
  `photo_filename` varchar(120) default NULL,
  `photo_width` int(4) unsigned default NULL,
  `photo_height` int(4) unsigned default NULL,
  `sig_img_filename` varchar(120) default NULL,
  `sig_img_width` int(4) unsigned default NULL,
  `sig_img_height` int(4) unsigned default NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL default '0',
  `accept_messages` char(1) NOT NULL default 'y',
  `last_view_bulletins` int(10) NOT NULL default '0',
  `last_bulletin_date` int(10) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `join_date` int(10) unsigned NOT NULL default '0',
  `last_visit` int(10) unsigned NOT NULL default '0',
  `last_activity` int(10) unsigned NOT NULL default '0',
  `total_entries` smallint(5) unsigned NOT NULL default '0',
  `total_comments` smallint(5) unsigned NOT NULL default '0',
  `total_forum_topics` mediumint(8) NOT NULL default '0',
  `total_forum_posts` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `last_forum_post_date` int(10) unsigned NOT NULL default '0',
  `last_email_date` int(10) unsigned NOT NULL default '0',
  `in_authorlist` char(1) NOT NULL default 'n',
  `accept_admin_email` char(1) NOT NULL default 'y',
  `accept_user_email` char(1) NOT NULL default 'y',
  `notify_by_default` char(1) NOT NULL default 'y',
  `notify_of_pm` char(1) NOT NULL default 'y',
  `display_avatars` char(1) NOT NULL default 'y',
  `display_signatures` char(1) NOT NULL default 'y',
  `parse_smileys` char(1) NOT NULL default 'y',
  `smart_notifications` char(1) NOT NULL default 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL default 'n',
  `localization_is_site_default` char(1) NOT NULL default 'n',
  `time_format` char(2) NOT NULL default 'us',
  `cp_theme` varchar(32) default NULL,
  `profile_theme` varchar(32) default NULL,
  `forum_theme` varchar(32) default NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL default '20',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL default '18',
  `quick_links` text,
  `quick_tabs` text,
  `pmember_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;
INSERT INTO `exp_members` (`member_id`,`group_id`,`username`,`screen_name`,`password`,`unique_id`,`crypt_key`,`authcode`,`email`,`url`,`location`,`occupation`,`interests`,`bday_d`,`bday_m`,`bday_y`,`aol_im`,`yahoo_im`,`msn_im`,`icq`,`bio`,`signature`,`avatar_filename`,`avatar_width`,`avatar_height`,`photo_filename`,`photo_width`,`photo_height`,`sig_img_filename`,`sig_img_width`,`sig_img_height`,`ignore_list`,`private_messages`,`accept_messages`,`last_view_bulletins`,`last_bulletin_date`,`ip_address`,`join_date`,`last_visit`,`last_activity`,`total_entries`,`total_comments`,`total_forum_topics`,`total_forum_posts`,`last_entry_date`,`last_comment_date`,`last_forum_post_date`,`last_email_date`,`in_authorlist`,`accept_admin_email`,`accept_user_email`,`notify_by_default`,`notify_of_pm`,`display_avatars`,`display_signatures`,`parse_smileys`,`smart_notifications`,`language`,`timezone`,`daylight_savings`,`localization_is_site_default`,`time_format`,`cp_theme`,`profile_theme`,`forum_theme`,`tracker`,`template_size`,`notepad`,`notepad_size`,`quick_links`,`quick_tabs`,`pmember_id`)
VALUES
	(1,1,'admin','admin','2ed095616f7e5866739d87cd4f380435c0e561fb','4d87aebbeb594fdfdd871565d795dfeba2ed7a90','8a08165d4161b60a5587eb1ac909a43107304a1d',NULL,'info@eetemplates.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'68.220.174.118',1294351978,1294354946,1295820441,1,0,0,0,1294351978,0,0,0,'n','y','y','y','y','y','y','y','y','english','UTC','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18','',NULL,0);

/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_attachments`;

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL default '0',
  `message_id` int(10) unsigned NOT NULL default '0',
  `attachment_name` varchar(50) NOT NULL default '',
  `attachment_hash` varchar(40) NOT NULL default '',
  `attachment_extension` varchar(20) NOT NULL default '',
  `attachment_location` varchar(150) NOT NULL default '',
  `attachment_date` int(10) unsigned NOT NULL default '0',
  `attachment_size` int(10) unsigned NOT NULL default '0',
  `is_temp` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_message_copies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_copies`;

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL auto_increment,
  `message_id` int(10) unsigned NOT NULL default '0',
  `sender_id` int(10) unsigned NOT NULL default '0',
  `recipient_id` int(10) unsigned NOT NULL default '0',
  `message_received` char(1) NOT NULL default 'n',
  `message_read` char(1) NOT NULL default 'n',
  `message_time_read` int(10) unsigned NOT NULL default '0',
  `attachment_downloaded` char(1) NOT NULL default 'n',
  `message_folder` int(10) unsigned NOT NULL default '1',
  `message_authcode` varchar(10) NOT NULL default '',
  `message_deleted` char(1) NOT NULL default 'n',
  `message_status` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_message_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_data`;

CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL default '0',
  `message_date` int(10) unsigned NOT NULL default '0',
  `message_subject` varchar(255) NOT NULL default '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL default 'y',
  `message_attachments` char(1) NOT NULL default 'n',
  `message_recipients` varchar(200) NOT NULL default '',
  `message_cc` varchar(200) NOT NULL default '',
  `message_hide_cc` char(1) NOT NULL default 'n',
  `message_sent_copy` char(1) NOT NULL default 'n',
  `total_recipients` int(5) unsigned NOT NULL default '0',
  `message_status` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_message_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_folders`;

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL default '0',
  `folder1_name` varchar(50) NOT NULL default 'InBox',
  `folder2_name` varchar(50) NOT NULL default 'Sent',
  `folder3_name` varchar(50) NOT NULL default '',
  `folder4_name` varchar(50) NOT NULL default '',
  `folder5_name` varchar(50) NOT NULL default '',
  `folder6_name` varchar(50) NOT NULL default '',
  `folder7_name` varchar(50) NOT NULL default '',
  `folder8_name` varchar(50) NOT NULL default '',
  `folder9_name` varchar(50) NOT NULL default '',
  `folder10_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_message_listed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_listed`;

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL default '0',
  `listed_member` int(10) unsigned NOT NULL default '0',
  `listed_description` varchar(100) NOT NULL default '',
  `listed_type` varchar(10) NOT NULL default 'blocked',
  PRIMARY KEY  (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_module_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_module_member_groups`;

CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_modules`;

CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL auto_increment,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL default 'n',
  `has_publish_fields` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` (`module_id`,`module_name`,`module_version`,`has_cp_backend`,`has_publish_fields`)
VALUES
	(1,'Emoticon','2.0','n','n'),
	(2,'Jquery','1.0','n','n'),
	(3,'Mailinglist','3.0','y','n'),
	(4,'Channel','2.0.1','n','n'),
	(5,'Member','2.0','n','n'),
	(6,'Stats','2.0','n','n'),
	(7,'Email','2.0','n','n'),
	(8,'Rss','2.0','n','n'),
	(9,'Comment','2.1','y','n'),
	(10,'Search','2.0','n','n'),
	(11,'Freeform','3.0.5','y','n');

/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_online_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_online_users`;

CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `in_forum` char(1) NOT NULL default 'n',
  `name` varchar(50) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `date` int(10) unsigned NOT NULL default '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY  (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
INSERT INTO `exp_online_users` (`online_id`,`site_id`,`member_id`,`in_forum`,`name`,`ip_address`,`date`,`anon`)
VALUES
	(52,1,0,'n','','68.220.161.243',1295820402,''),
	(53,1,1,'n','admin','68.220.161.243',1295820585,'y');

/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_password_lockout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_password_lockout`;

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL auto_increment,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY  (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_ping_servers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_ping_servers`;

CREATE TABLE `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL default '80',
  `ping_protocol` varchar(12) NOT NULL default 'xmlrpc',
  `is_default` char(1) NOT NULL default 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_relationships`;

CREATE TABLE `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL auto_increment,
  `rel_parent_id` int(10) NOT NULL default '0',
  `rel_child_id` int(10) NOT NULL default '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY  (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_reset_password
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_reset_password`;

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY  (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_revision_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_revision_tracker`;

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY  (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search`;

CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL default '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY  (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `exp_search` WRITE;
/*!40000 ALTER TABLE `exp_search` DISABLE KEYS */;
INSERT INTO `exp_search` (`search_id`,`site_id`,`search_date`,`keywords`,`member_id`,`ip_address`,`total_results`,`per_page`,`query`,`custom_fields`,`result_page`)
VALUES
	('0e7054865ad7b87dd269b5a5277f339d',1,1295820585,'template7',1,'68.220.161.243',3,50,'s:1430:\\\"SELECT DISTINCT(t.entry_id), t.entry_id, t.channel_id, t.forum_topic_id, t.author_id, t.ip_address, t.title, t.url_title, t.status, t.dst_enabled, t.view_count_one, t.view_count_two, t.view_count_three, t.view_count_four, t.allow_comments, t.comment_expiration_date, t.sticky, t.entry_date, t.year, t.month, t.day, t.entry_date, t.edit_date, t.expiration_date, t.recent_comment_date, t.comment_total, t.site_id as entry_site_id,\n						w.channel_title, w.channel_name, w.search_results_url, w.search_excerpt, w.channel_url, w.comment_url, w.comment_moderate, w.channel_html_formatting, w.channel_allow_img_urls, w.channel_auto_link_urls, w.comment_system_enabled, \n						m.username, m.email, m.url, m.screen_name, m.location, m.occupation, m.interests, m.aol_im, m.yahoo_im, m.msn_im, m.icq, m.signature, m.sig_img_filename, m.sig_img_width, m.sig_img_height, m.avatar_filename, m.avatar_width, m.avatar_height, m.photo_filename, m.photo_width, m.photo_height, m.group_id, m.member_id, m.bday_d, m.bday_m, m.bday_y, m.bio,\n						md.*,\n						wd.*\n				FROM MDBMPREFIXchannel_titles		AS t\n				LEFT JOIN MDBMPREFIXchannels 		AS w  ON t.channel_id = w.channel_id \n				LEFT JOIN MDBMPREFIXchannel_data	AS wd ON t.entry_id = wd.entry_id \n				LEFT JOIN MDBMPREFIXmembers		AS m  ON m.member_id = t.author_id \n				LEFT JOIN MDBMPREFIXmember_data	AS md ON md.member_id = m.member_id \n				WHERE t.entry_id IN (4,5,6)  ORDER BY entry_date  desc\\\";','a:3:{s:7:\\\"summary\\\";a:2:{i:0;s:1:\\\"1\\\";i:1;s:1:\\\"y\\\";}s:4:\\\"body\\\";a:2:{i:0;s:1:\\\"2\\\";i:1;s:1:\\\"y\\\";}s:8:\\\"extended\\\";a:2:{i:0;s:1:\\\"3\\\";i:1;s:1:\\\"y\\\";}}','search/results');

/*!40000 ALTER TABLE `exp_search` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_search_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search_log`;

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `exp_search_log` WRITE;
/*!40000 ALTER TABLE `exp_search_log` DISABLE KEYS */;
INSERT INTO `exp_search_log` (`id`,`site_id`,`member_id`,`screen_name`,`ip_address`,`search_date`,`search_type`,`search_terms`)
VALUES
	(1,1,0,'','68.220.174.118',1294352017,'site','test'),
	(2,1,0,'','68.220.174.118',1294352023,'site','html'),
	(3,1,0,'','68.220.174.118',1294429474,'site','test'),
	(4,1,0,'','68.220.174.118',1294429480,'site','typography'),
	(5,1,1,'admin','68.220.161.243',1295820584,'site','template7');

/*!40000 ALTER TABLE `exp_search_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_security_hashes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_security_hashes`;

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL auto_increment,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY  (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` (`hash_id`,`date`,`ip_address`,`hash`)
VALUES
	(178,1295820585,'68.220.161.243','195b233ea62437fc24b0b83321e42a134dbba303'),
	(177,1295820490,'68.220.161.243','7519c2dbde18e60ea7cf1107e53c66c44599af43'),
	(176,1295820490,'68.220.161.243','de22b20c2365166739470f6b20a83833d4e35605'),
	(175,1295820481,'68.220.161.243','3a96aca684169ff9573149d7f73f09539a8600a9'),
	(174,1295820478,'68.220.161.243','7952b5013f320e681a9d50d036135349122165d3'),
	(173,1295820476,'68.220.161.243','71164be1ddc2d16369727dcea6c2852134264f26'),
	(172,1295820474,'68.220.161.243','fd2aac4ef62dab4b1681760821980d74c5a82682'),
	(171,1295820465,'68.220.161.243','e88038c038c37230df262f881a441ae652b651a8'),
	(170,1295820465,'68.220.161.243','e49cbdeebe5c902465f539bf6e7cc8f6d7c3d06f'),
	(169,1295820456,'68.220.161.243','2a13c3eb37ea58117f1a3be70a1cf115263ffb61'),
	(168,1295820456,'68.220.161.243','3134f66d6c8cff3a551267b3cb307a4cfccc20d7'),
	(167,1295820452,'68.220.161.243','b418aa968f431e77a649ca67bc18a90173f05f30'),
	(166,1295820452,'68.220.161.243','986c9f9ec97d9a150dd99a556bed4e19e33924ce'),
	(165,1295820447,'68.220.161.243','221b39d8a1e3d2f56ecc7079e7b68fbeac00eecf'),
	(164,1295820441,'68.220.161.243','021409333e3066f15102df530c66f95c9290e71f'),
	(163,1295820441,'68.220.161.243','eb78b623f49e31b3ff407ee5427b7601f7dd71f7'),
	(162,1295820438,'68.220.161.243','12cf41d745273b9de39691bfc0c7e3959feb233d'),
	(161,1295820401,'68.220.161.243','5fe3255adbd4ab01a81cfd43cf2344bf4b32bae9'),
	(160,1295820400,'68.220.161.243','92f709c85d919934225fce9eb6f0305b4d0b0a96'),
	(159,1295820391,'68.220.161.243','c6c5b08c5d2a76e730edb663501270b4990f8912');

/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sessions`;

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL default '0',
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `admin_sess` tinyint(1) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;
INSERT INTO `exp_sessions` (`session_id`,`site_id`,`member_id`,`admin_sess`,`ip_address`,`user_agent`,`last_activity`)
VALUES
	('0ebaac6e70b9c80501e1ebb5b34f5bc63a256412',1,1,1,'68.220.161.243','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en',1295820585);

/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sites`;

CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL auto_increment,
  `site_label` varchar(100) NOT NULL default '',
  `site_name` varchar(50) NOT NULL default '',
  `site_description` text,
  `site_system_preferences` text NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  PRIMARY KEY  (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;
INSERT INTO `exp_sites` (`site_id`,`site_label`,`site_name`,`site_description`,`site_system_preferences`,`site_mailinglist_preferences`,`site_member_preferences`,`site_template_preferences`,`site_channel_preferences`,`site_bootstrap_checksums`)
VALUES
	(1,'test','default_site',NULL,'YTo5MTp7czoxMDoic2l0ZV9pbmRleCI7czo5OiJpbmRleC5waHAiO3M6ODoic2l0ZV91cmwiO3M6NDQ6Imh0dHA6Ly9zYW5kYm94Lm1hY21pbmlwYXJraW5nLmNvbS90ZW1wbGF0ZTcvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjUxOiJodHRwOi8vc2FuZGJveC5tYWNtaW5pcGFya2luZy5jb20vdGVtcGxhdGU3L3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoyMDoiaW5mb0BlZXRlbXBsYXRlcy5jb20iO3M6MTQ6IndlYm1hc3Rlcl9uYW1lIjtzOjA6IiI7czoyMDoiY2hhbm5lbF9ub21lbmNsYXR1cmUiO3M6NzoiY2hhbm5lbCI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjYwOiJodHRwOi8vc2FuZGJveC5tYWNtaW5pcGFya2luZy5jb20vdGVtcGxhdGU3L2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfcGF0aCI7czo3ODoiL0xpYnJhcnkvV2ViU2VydmVyL1NpdGVzL3NhbmRib3gubWFjbWluaXBhcmtpbmcuY29tL3RlbXBsYXRlNy9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTc6ImVuYWJsZV9kYl9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE4OiJ0ZW1wbGF0ZV9kZWJ1Z2dpbmciO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTc6InVzZXJfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTg6ImFkbWluX3Nlc3Npb25fdHlwZSI7czoyOiJjcyI7czoyMToiYWxsb3dfdXNlcm5hbWVfY2hhbmdlIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2xvZ2lucyI7czoxOiJ5IjtzOjE2OiJwYXNzd29yZF9sb2Nrb3V0IjtzOjE6InkiO3M6MjU6InBhc3N3b3JkX2xvY2tvdXRfaW50ZXJ2YWwiO3M6MToiMSI7czoyMDoicmVxdWlyZV9pcF9mb3JfbG9naW4iO3M6MToieSI7czoyMjoicmVxdWlyZV9pcF9mb3JfcG9zdGluZyI7czoxOiJ5IjtzOjE4OiJhbGxvd19tdWx0aV9lbWFpbHMiO3M6MToibiI7czoyNDoicmVxdWlyZV9zZWN1cmVfcGFzc3dvcmRzIjtzOjE6Im4iO3M6MTk6ImFsbG93X2RpY3Rpb25hcnlfcHciO3M6MToieSI7czoyMzoibmFtZV9vZl9kaWN0aW9uYXJ5X2ZpbGUiO3M6MDoiIjtzOjE3OiJ4c3NfY2xlYW5fdXBsb2FkcyI7czoxOiJ5IjtzOjE1OiJyZWRpcmVjdF9tZXRob2QiO3M6ODoicmVkaXJlY3QiO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjEzOiJsb2dfcmVmZXJyZXJzIjtzOjE6Im4iO3M6MTM6Im1heF9yZWZlcnJlcnMiO3M6MzoiNTAwIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiJ1cyI7czoxNToic2VydmVyX3RpbWV6b25lIjtzOjM6IlVUQyI7czoxMzoic2VydmVyX29mZnNldCI7czowOiIiO3M6MTY6ImRheWxpZ2h0X3NhdmluZ3MiO3M6MToibiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjM6IlVUQyI7czoxNjoiZGVmYXVsdF9zaXRlX2RzdCI7czoxOiJuIjtzOjE1OiJob25vcl9lbnRyeV9kc3QiO3M6MToieSI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6ODoiY3BfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoyMToiZW1haWxfbW9kdWxlX2NhcHRjaGFzIjtzOjE6Im4iO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxMjoic2VjdXJlX2Zvcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTM6ImVtb3RpY29uX3BhdGgiO3M6NTk6Imh0dHA6Ly9zYW5kYm94Lm1hY21pbmlwYXJraW5nLmNvbS90ZW1wbGF0ZTcvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToieSI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjY5OiIvTGlicmFyeS9XZWJTZXJ2ZXIvU2l0ZXMvc2FuZGJveC5tYWNtaW5pcGFya2luZy5jb20vdGVtcGxhdGU3L3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7fQ==','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToieSI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NTk6Imh0dHA6Ly9zYW5kYm94Lm1hY21pbmlwYXJraW5nLmNvbS90ZW1wbGF0ZTcvaW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czo3NzoiL0xpYnJhcnkvV2ViU2VydmVyL1NpdGVzL3NhbmRib3gubWFjbWluaXBhcmtpbmcuY29tL3RlbXBsYXRlNy9pbWFnZXMvYXZhdGFycy8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6NjU6Imh0dHA6Ly9zYW5kYm94Lm1hY21pbmlwYXJraW5nLmNvbS90ZW1wbGF0ZTcvaW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjEwOiJwaG90b19wYXRoIjtzOjgzOiIvTGlicmFyeS9XZWJTZXJ2ZXIvU2l0ZXMvc2FuZGJveC5tYWNtaW5pcGFya2luZy5jb20vdGVtcGxhdGU3L2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxNToicGhvdG9fbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNjoicGhvdG9fbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTI6InBob3RvX21heF9rYiI7czoyOiI1MCI7czoxNjoiYWxsb3dfc2lnbmF0dXJlcyI7czoxOiJ5IjtzOjEzOiJzaWdfbWF4bGVuZ3RoIjtzOjM6IjUwMCI7czoyMToic2lnX2FsbG93X2ltZ19ob3RsaW5rIjtzOjE6Im4iO3M6MjA6InNpZ19hbGxvd19pbWdfdXBsb2FkIjtzOjE6Im4iO3M6MTE6InNpZ19pbWdfdXJsIjtzOjczOiJodHRwOi8vc2FuZGJveC5tYWNtaW5pcGFya2luZy5jb20vdGVtcGxhdGU3L2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6OTE6Ii9MaWJyYXJ5L1dlYlNlcnZlci9TaXRlcy9zYW5kYm94Lm1hY21pbmlwYXJraW5nLmNvbS90ZW1wbGF0ZTcvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czo4NDoiL0xpYnJhcnkvV2ViU2VydmVyL1NpdGVzL3NhbmRib3gubWFjbWluaXBhcmtpbmcuY29tL3RlbXBsYXRlNy9pbWFnZXMvcG1fYXR0YWNobWVudHMvIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJ0b3RhbF9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJuIjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6InkiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo3MjoiL0xpYnJhcnkvV2ViU2VydmVyL1NpdGVzL3NhbmRib3gubWFjbWluaXBhcmtpbmcuY29tL3RlbXBsYXRlNy90ZW1wbGF0ZXMvIjt9','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czoxMDoidW5kZXJzY29yZSI7czoxNzoidXNlX2NhdGVnb3J5X25hbWUiO3M6MToibiI7czoyMjoicmVzZXJ2ZWRfY2F0ZWdvcnlfd29yZCI7czo4OiJjYXRlZ29yeSI7czoyMzoiYXV0b19jb252ZXJ0X2hpZ2hfYXNjaWkiO3M6MToibiI7czoyMjoibmV3X3Bvc3RzX2NsZWFyX2NhY2hlcyI7czoxOiJ5IjtzOjIzOiJhdXRvX2Fzc2lnbl9jYXRfcGFyZW50cyI7czoxOiJ5Ijt9','YToxOntzOjcxOiIvTGlicmFyeS9XZWJTZXJ2ZXIvU2l0ZXMvc2FuZGJveC5tYWNtaW5pcGFya2luZy5jb20vdGVtcGxhdGU3L2luZGV4LnBocCI7czozMjoiZTg1ZWZmZmY1ODdkZjc0ZDA0OWE2MTA2NTcxOWVhNmEiO30=');

/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_snippets`;

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY  (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;
INSERT INTO `exp_snippets` (`snippet_id`,`site_id`,`snippet_name`,`snippet_contents`)
VALUES
	(1,1,'twitter','http://twitter.com/eetemplates'),
	(2,1,'facebook','http://facebook.com'),
	(3,1,'blogtitle','Template7'),
	(4,1,'blogtagline','A Search Engine Optimized blog template for ExpressionEngine'),
	(5,1,'emailaddress','someone@nodomainhere.com'),
	(6,1,'phone','(123) 456-7890'),
	(7,1,'fax','(123) 456-7890'),
	(8,1,'streetaddress','123 EE Lane'),
	(9,1,'city','Daphne'),
	(10,1,'state','AL'),
	(11,1,'zip','36526'),
	(12,1,'linkedin','http://linkedin.com'),
	(13,1,'youtube','http://youtube.com'),
	(14,1,'plaxo','http://plaxo.com'),
	(15,1,'enablesidebarads','yes'),
	(16,1,'aboutauthor','no'),
	(17,1,'memberlinks','no'),
	(18,1,'calendar','no'),
	(19,1,'syndicate','yes'),
	(20,1,'mailinglist','no'),
	(21,1,'abouttitle','This is an about page'),
	(22,1,'contacttitle','This is a contact page'),
	(23,1,'categorylisttitle','This is an Category Listing page'),
	(24,1,'archivelisttitle','This is an Archive Listing page');

/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_specialty_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_specialty_templates`;

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `enable_template` char(1) NOT NULL default 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY  (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;
INSERT INTO `exp_specialty_templates` (`template_id`,`site_id`,`enable_template`,`template_name`,`data_title`,`template_data`)
VALUES
	(1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
	(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
	(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
	(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
	(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
	(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
	(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
	(8,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
	(9,1,'y','reset_password_notification','New Login Information','{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),
	(10,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
	(11,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
	(12,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
	(13,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
	(14,1,'y','comments_opened_notification','New comments have been added','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
	(15,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
	(16,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_stats`;

CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `total_members` mediumint(7) NOT NULL default '0',
  `recent_member_id` int(10) NOT NULL default '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL default '0',
  `total_forum_topics` mediumint(8) NOT NULL default '0',
  `total_forum_posts` mediumint(8) NOT NULL default '0',
  `total_comments` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_forum_post_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `last_visitor_date` int(10) unsigned NOT NULL default '0',
  `most_visitors` mediumint(7) NOT NULL default '0',
  `most_visitor_date` int(10) unsigned NOT NULL default '0',
  `last_cache_clear` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;
INSERT INTO `exp_stats` (`stat_id`,`site_id`,`total_members`,`recent_member_id`,`recent_member`,`total_entries`,`total_forum_topics`,`total_forum_posts`,`total_comments`,`last_entry_date`,`last_forum_post_date`,`last_comment_date`,`last_visitor_date`,`most_visitors`,`most_visitor_date`,`last_cache_clear`)
VALUES
	(1,1,1,1,'admin',6,0,0,0,1294330886,0,0,1295820585,23,1294354961,1296425190);

/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_status_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_status_groups`;

CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;
INSERT INTO `exp_status_groups` (`group_id`,`site_id`,`group_name`)
VALUES
	(1,1,'Statuses');

/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_status_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_status_no_access`;

CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_statuses`;

CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY  (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;
INSERT INTO `exp_statuses` (`status_id`,`site_id`,`group_id`,`status`,`status_order`,`highlight`)
VALUES
	(1,1,1,'open',1,'009933'),
	(2,1,1,'closed',2,'990000');

/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_groups`;

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` (`group_id`,`site_id`,`group_name`,`group_order`,`is_site_default`)
VALUES
	(5,1,'sitemap',4,'n'),
	(2,1,'includes',2,'n'),
	(3,1,'search',3,'n'),
	(4,1,'blog',4,'y');

/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_member_groups`;

CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_template_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_no_access`;

CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_template_no_access` WRITE;
/*!40000 ALTER TABLE `exp_template_no_access` DISABLE KEYS */;
INSERT INTO `exp_template_no_access` (`template_id`,`member_group`)
VALUES
	(1,2),
	(2,2),
	(3,2),
	(4,2),
	(5,2),
	(6,2),
	(7,2),
	(8,2),
	(9,2),
	(10,2),
	(11,2),
	(12,2),
	(12,3),
	(12,4),
	(12,5),
	(13,2),
	(14,2),
	(15,2),
	(16,2),
	(17,2),
	(18,2),
	(19,2),
	(20,2),
	(21,2),
	(22,2),
	(23,2),
	(24,2),
	(25,2),
	(26,2),
	(27,2),
	(28,2),
	(29,2),
	(30,2),
	(31,2),
	(32,2),
	(32,3),
	(32,4),
	(32,5),
	(33,2),
	(34,2);

/*!40000 ALTER TABLE `exp_template_no_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_templates`;

CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL default 'n',
  `template_type` varchar(16) NOT NULL default 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL default '0',
  `last_author_id` int(10) unsigned NOT NULL default '0',
  `cache` char(1) NOT NULL default 'n',
  `refresh` int(6) unsigned NOT NULL default '0',
  `no_auth_bounce` varchar(50) NOT NULL default '',
  `enable_http_auth` char(1) NOT NULL default 'n',
  `allow_php` char(1) NOT NULL default 'n',
  `php_parse_location` char(1) NOT NULL default 'o',
  `hits` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` (`template_id`,`site_id`,`group_id`,`template_name`,`save_template_file`,`template_type`,`template_data`,`template_notes`,`edit_date`,`last_author_id`,`cache`,`refresh`,`no_auth_bounce`,`enable_http_auth`,`allow_php`,`php_parse_location`,`hits`)
VALUES
	(2,1,2,'index','y','webpage','',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(54,1,5,'index','y','xml','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n\n<url>\n<loc>\n{site_url}\n</loc>\n<lastmod>{current_time format=\"%Y-%d-%m\"}</lastmod>\n<changefreq>monthly</changefreq>\n<priority>0.5</priority>\n</url>\n{exp:channel:entries channel=\"blog\"}\n<url>\n<loc>\n{title_permalink=\'blog\'}\n</loc>\n<lastmod>{entry_date format=\"%Y-%d-%m\"}</lastmod>\n<changefreq>monthly</changefreq>\n<priority>0.5</priority>\n</url>\n{/exp:channel:entries}\n\n</urlset>','',1294355000,1,'n',0,'','n','n','o',1),
	(21,1,3,'index','y','webpage','',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(22,1,3,'results','y','webpage','\n	{embed=\"includes/.head\" blog=\"blog\"}\n	<link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS\" href=\"{path=\'blog/rss2\'}\" />\n\n</head>\n<body>\n\n{embed=\"includes/.header\" template_group=\"blog\"}\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	<div class=\"grid_8 push_4 content\">\n\n		<h2>{lang:search_results}:</h2>\n		<div class=\"entry\">\n		<span>Your search for <strong>{exp:search:keywords}</strong> resulted in <strong>{exp:search:total_results}</strong> search results</span>\n		{exp:search:search_results switch=\"resultRowOne|resultRowTwo\"}\n			<div class=\"{switch}\">\n				<h2 class=\"title\"><a href=\"{auto_path}\">{title}</a></h2>\n				<p>{excerpt}</p>\n				<p>Posted by: <a href=\"{member_path=\'member/index\'}\">{author}</a> on {entry_date format=\"%m/%d/%y\"}</p>\n			</div>\n		{/exp:search:search_results}\n		</div>\n		{if paginate}\n		<div class=\'paginate\'>\n			<span class=\'pagecount\'>{page_count}</span>&nbsp; {paginate}\n		</div>\n		{/if}\n\n\n	</div>\n	{embed=\"includes/.blogsidebar\" template_group=\"blog\" blog=\"blog\"}\n	<div class=\"clear\"></div>\n</div>\n{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n\n\n',NULL,1294355000,1,'n',0,'','n','n','o',15),
	(23,1,4,'about','y','webpage','\n	{embed=\"includes/.head\"}\n	<link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS\" href=\"{path={my_template_group}/rss2}\">\n\n</head>\n<body>\n\n{embed=\"includes/.header\"}\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	<div class=\"grid_8 push_4 content\">\n		{exp:weblog:entries weblog=\"blog\" url_title=\"about\"}\n			<div class=\"entry\">\n				<h2 class=\"title\">{title}</h2>\n				{summary}\n				{body}\n				{extended}\n			</div>\n		{/exp:weblog:entries}\n	</div>\n	{embed=\"includes/.blogsidebar\"}\n	<div class=\"clear\"></div>\n</div>\n{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n',NULL,1294355000,1,'n',0,'','n','n','o',53),
	(24,1,4,'indexnocss','y','webpage','\n<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<head>\n<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" >\n\n<title>{exp:channel:entries limit=\"1\" url_title=\"not about\"}{title}{/exp:channel:entries} - {blogtitle}</title>\n\n	<link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS\" href=\"{path={my_template_group}/rss2}\">\n\n</head>\n<body>\n\n{embed=\"includes/.header\" template_group=\"blog\"}\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	<div class=\"grid_8 content\">\n		{exp:channel:category_heading weblog=\"blog\"}\n			<h2>Category: {category_name}</h2>\n			{if category_description}\n				<p>{category_description}</p>\n			{/if}\n		{/exp:channel:category_heading}\n\n		{exp:channel:entries channel=\"blog\" orderby=\"date\" sort=\"desc\" limit=\"10\" url_title=\"not about|contact\"}\n			<div class=\"entry\">\n				<h2 class=\"title\"><a href=\"{title_permalink=\'blog/comments\'}\">{title}</a></h2>\n				{summary}\n				{body}\n				{extended}\n				<div class=\"posted\">Posted by {author} on {entry_date format=\'%m/%d\'} at {entry_date format=\'%h:%i %A\'}\n					{categories}\n						<a href=\"{path=site_index}\">{category_name}</a> &#8226;\n					{/categories}\n					{if allow_comments}\n						({comment_total}) <a href=\"{url_title_path=\'blog/comments\'}\">Comments</a> &#8226;\n					{/if}\n					<a href=\"{title_permalink=\'blog/index\'}\">Permalink</a>\n				</div>\n				{paginate}\n					<div class=\"paginate\">\n						<span class=\"pagecount\">Page {current_page} of {total_pages} pages</span>  {pagination_links}\n					</div>\n				{/paginate}\n			</div>\n		{/exp:channel:entries}\n	</div>\n	{embed=\"includes/.blogsidebar\" template_group=\"blog\" blog=\"blog\"}\n	<div class=\"clear\"></div>\n</div>\n{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n',NULL,1294355000,1,'n',0,'','n','n','o',13),
	(25,1,4,'index','y','webpage','	{embed=\"includes/.head\"}\n	<link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS\" href=\"{path=blog/rss2}\">\n\n</head>\n<body>\n\n{embed=\"includes/.header\" template_group=\"blog\"}\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	<div class=\"grid_8 push_4 content\">\n		{exp:channel:category_heading channel=\"blog\"}\n			<h2>Category: {category_name}</h2>\n			{if category_description}\n				<p>{category_description}</p>\n			{/if}\n		{/exp:channel:category_heading}\n\n		{exp:channel:entries channel=\"blog\" orderby=\"date\" sort=\"desc\" limit=\"10\" url_title=\"not about|contact\"}\n			<div class=\"entry\">\n				<h2 class=\"title\"><a href=\"{title_permalink=\'blog/comments\'}\">{title}</a></h2>\n				{summary}\n				{body}\n				{extended}\n				<div class=\"posted\">Posted by {author} on {entry_date format=\'%m/%d\'} at {entry_date format=\'%h:%i %A\'}\n					{categories}\n						<a href=\"{path=site_index}\">{category_name}</a> &#8226;\n					{/categories}\n					{if allow_comments}\n						({comment_total}) <a href=\"{url_title_path=\'blog/comments\'}\">Comments</a> &#8226;\n					{/if}\n					<a href=\"{title_permalink=\'blog\'}\">Permalink</a>\n				</div>\n				{paginate}\n					<div class=\"paginate\">\n						<span class=\"pagecount\">Page {current_page} of {total_pages} pages</span>  {pagination_links}\n					</div>\n				{/paginate}\n			</div>\n		{/exp:channel:entries}\n	</div>\n	{embed=\"includes/.blogsidebar\" template_group=\"blog\" blog=\"blog\"}	\n	<div class=\"clear\"></div>\n</div>\n{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n','',1294355000,1,'n',0,'','n','n','o',579),
	(26,1,4,'categories','y','webpage','	{embed=\"includes/.head\"}\n	<link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS\" href=\"{path=blog/rss2}\">\n	<title>{categorylisttitle}</title>\n\n</head>\n<body>\n\n{embed=\"includes/.header\"}\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	<div class=\"grid_8 push_4 content\">\n		<h2 class=\"sidetitle\">Categories</h2>\n		{exp:channel:category_archive channel=\"blog\" id=\"categorylist\"}\n			{categories}<h4>{category_name}</h4>{/categories}\n			{entry_titles}<a href=\"{path=\'blog/comments\'}\">{title}</a>{/entry_titles}\n		{/exp:channel:category_archive}\n		<p><a href=\"{homepage}\">&lt;&lt; Back to main</a></p>\n	</div>\n	{embed=\"includes/.blogsidebar\"}\n	<div class=\"clear\"></div>\n</div>\n{embed=\"includes/.footer\"}\n\n</body>\n</html>\n\n',NULL,1294355000,1,'n',0,'','n','n','o',13),
	(27,1,4,'comments','y','webpage','\n	{embed=\"includes/.head\"}\n<link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS\" href=\"{path={my_template_group}/rss2}\">\n\n  </head>\n<body>\n	{embed=\"includes/.header\"}\n\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	\n<div class=\"grid_8 push_4 content\">\n\n{exp:channel:entries limit=\"1\"}\n<div class=\"entry\">\n<h2 class=\"title\">{title}</h2>\n\n{summary}\n\n{body}\n\n<div class=\"posted\">\n<p>Posted by {author} on {entry_date format=\'%m/%d\'} at {entry_date format=\'%h:%i %A\'}</p>\n</div>\n</div>\n{/exp:channel:entries}\n\n<div class=\"related\">\n	<h4>Related Posts</h4>\n	<ul>\n		{exp:channel:entries related_categories_mode=\"on\" channel=\"blog\" limit=\"10\" orderby=\"edit_date\"}\n			<li><a href=\"{title_permalink=\'blog/comments\'}\"><strong>{title}</strong> Posted by {author} on {edit_date format=\"%Y-%m-%d\"}</a></li>\n		{/exp:channel:entries}\n	</ul>\n</div>\n\n{exp:comment:entries channel=\"blog\" limit=\"10\"}\n<div class=\"grid_8 alpha omega commentwrapper\">\n	<div class=\"grid_3 commentposted alpha\"><p>{url_as_author}</p><p>{comment_date format=\'%m/%d\'} &nbsp;at&nbsp; {comment_date format=\'%h:%i %A\'}</p></div>\n	<div class=\"grid_5 comment omega\">{comment}</div>\n\n\n{paginate}\n<div class=\"paginate\">\n<span class=\"pagecount\">Page {current_page} of {total_pages} pages</span>  {pagination_links}\n</div>\n{/paginate}\n\n</div>\n\n{/exp:comment:entries}\n\n\n<div class=\"entry\">\n{exp:comment:form preview=\"blog/comment_preview\"}\n\n{if logged_out}\n<p>\nName:<br />\n<input type=\"text\" name=\"name\" value=\"{name}\" size=\"50\" />\n</p>\n<p>\nEmail:<br />\n<input type=\"text\" name=\"email\" value=\"{email}\" size=\"50\" />\n</p>\n<p>\nLocation:<br />\n<input type=\"text\" name=\"location\" value=\"{location}\" size=\"50\" />\n</p>\n<p>\nURL:<br />\n<input type=\"text\" name=\"url\" value=\"{url}\" size=\"50\" />\n</p>\n\n{/if}\n\n<p>\n<a href=\"{path=blog/smileys}\" onclick=\"window.open(this.href, \'_blank\', \'width=400,height=440\');return false;\" onkeypress=\"this.onclick()\">Smileys</a>\n</p>\n\n\n<p>\n<textarea name=\"comment\" cols=\"50\" rows=\"12\">{comment}</textarea>\n</p>\n\n{if logged_out}\n<p><input type=\"checkbox\" class=\"commentcheck\" name=\"save_info\" value=\"yes\" {save_info} /> Remember my personal information</p>\n{/if}\n\n<p><input type=\"checkbox\" class=\"commentcheck\" name=\"notify_me\" value=\"yes\" {notify_me} /> Notify me of follow-up comments?</p>\n\n{if captcha}\n<p>Submit the word you see below:</p>\n<p>\n{captcha}\n<br />\n<input type=\"text\" name=\"captcha\" value=\"\" size=\"20\" maxlength=\"20\" style=\"width:140px;\" />\n</p>\n{/if}\n\n<input type=\"submit\" class=\"commentsubmit\" name=\"submit\" value=\"Submit\" />\n<input type=\"submit\" class=\"commentsubmit\" name=\"preview\" value=\"Preview\" />\n\n{/exp:comment:form}\n\n</div>\n\n\n<div class=\"center\">\n\n{exp:channel:next_entry weblog=\"blog\"}\n<p>Next entry: <a href=\"{path=\'blog/comments\'}\">{title}</a></p>\n{/exp:channel:next_entry}\n\n{exp:channel:prev_entry weblog=\"blog\"}\n<p>Previous entry: <a href=\"{path=\'blog/comments\'}\">{title}</a></p>\n{/exp:channel:prev_entry}\n\n</div>\n\n\n<p><a href=\"{homepage}\">&lt;&lt; Back to main</a></p>\n\n\n</div>\n{embed=\"includes/.blogsidebar\"}\n	<div class=\"clear\"></div>\n</div>\n\n	{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n',NULL,1294355000,1,'n',0,'','n','n','o',150),
	(53,1,4,'thanks','y','webpage','	{embed=\"includes/.head\"}\n	<title>{contacttitle}</title>\n\n</head>\n<body>\n\n{embed=\"includes/.header\"}\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	<div class=\"grid_8 push_4 content\">\n		<div class=\"entry\">\n			<h2 class=\"title\">Thank you!</h2>\n			<p>Thank you for your contact form Submission. Someone will be with you shortly.</p>\n		</div>\n		<div class=\"entry\" id=\"physicaladdress\">\n			<h2>Physical Address</h2>\n			<p>{streetaddress}<br>\n			{city}, {state} {zip}</p>\n			{if phone}<p><strong>Phone:</strong> {phone}</p>{/if}\n			{if fax}<p><strong>Fax:</strong> {fax}</p>{/if}\n			{if emailaddress}<p><strong>Email:</strong> {encode=\"{emailaddress}\"}</p>{/if}\n		</div>\n		<div class=\"entry\" id=\"socialmedia\">\n			<h2>Social Media</h2>\n			<ul>\n			{if twitter}<li id=\"twitter\"><a href=\"{twitter}\"><img src=\"{site_url}images/twitter.png\"><span>Twitter</span></a></li>{/if}\n			{if facebook}<li id=\"facebook\"><a href=\"{facebook}\"><img src=\"{site_url}images/facebook.png\"><span>Facebook</span></a></li>{/if}\n			{if myspace}<li id=\"myspace\"><a href=\"{myspace}\"><img src=\"{site_url}images/myspace.png\"><span>Myspace</span></a></li>{/if}\n			{if linkedin}<li id=\"linkedin\"><a href=\"{linkedin}\"><img src=\"{site_url}images/linkedin.png\"><span>LinkedIn</span></a></li>{/if}\n			{if youtube}<li id=\"youtube\"><a href=\"{youtube}\"><img src=\"{site_url}images/youtube.png\"><span>Youtube</span></a></li>{/if}\n			{if plaxo}<li id=\"vimeo\"><a href=\"{vimeo}\"><img src=\"{site_url}images/vimeo.png\"><span>Vimeo</span></a></li>{/if}\n			</ul>\n		</div>\n\n		<div class=\"entry\">\n			<h2>Contact Form</h2>\n			<p>Please fill-in the following fields:</p>\n			{exp:freeform:form form_name=\"default_form\" return=\"blog/thanks\" notify=\"\" template=\"default_template\" required=\"firstname|lastname|email|message\"}\n			<div id=\"customform\">\n			<table width=\"100%\">\n				<tr>\n					<td width=\"100%\"><input type=\"text\" name=\"firstname\" value=\"\" /><label><span class=\"requiredfield\">*</span>First Name:</label></td>\n				</tr>\n				<tr>\n					<td><input type=\"text\" name=\"lastname\" value=\"\" /><label><span class=\"requiredfield\">*</span>Last Name:</label></td>\n				</tr>\n				<tr>\n					<td><input type=\"text\" name=\"email\" value=\"\" /><label><span class=\"requiredfield\">*</span>Email Address:</label></td>\n				</tr>\n				<tr>\n					<td>\n						<textarea rows=\"5\" cols=\"50\" type=\"text\" name=\"message\" value=\"\" /></textarea><label><span class=\"requiredfield\">*</span>Message:</label>\n					</td>\n				</tr>\n			</table>\n\n\n\n\n			{if captcha}\n			<p>Please enter the word you see in the image below:</p>\n			<p>{captcha}<br />\n			<input id=\"captcha\" type=\"text\" name=\"captcha\" value=\"\" maxlength=\"20\" /></p>\n			{/if}\n\n			<p>\n			<input type=\"submit\" name=\"submit\" id=\"contactsubmit\" value=\"submit\" />\n			</p>\n			</div>\n			{/exp:freeform:form}\n		</div>\n	</div>\n	{embed=\"includes/.blogsidebar\"}\n	<div class=\"clear\"></div>\n</div>\n{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(29,1,4,'comment_preview','y','webpage','	{embed=\"includes/.head\"}\n<link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS\" href=\"{path=\'blog/rss2\'}\">\n\n  </head>\n<body>\n	{embed=\"includes/.header\"}\n\n\n<div class=\"container_12\" id=\"contentwrapper\">\n<div class=\"grid_8 push_4 content\">\n\n<div class=\"entry\">\n{exp:comment:preview}\n{comment}\n{/exp:comment:preview}\n</div>\n\n<div class=\"entry\">\n{exp:comment:form}\n\n{if logged_out}\n<p>\nName:<br />\n<input type=\"text\" name=\"name\" value=\"{name}\" size=\"50\" />\n</p>\n<p>\nEmail:<br />\n<input type=\"text\" name=\"email\" value=\"{email}\" size=\"50\" />\n</p>\n<p>\nLocation:<br />\n<input type=\"text\" name=\"location\" value=\"{location}\" size=\"50\" />\n</p>\n<p>\nURL:<br />\n<input type=\"text\" name=\"url\" value=\"{url}\" size=\"50\" />\n</p>\n\n{/if}\n\n<p>\n<a href=\"{path=\'blog/smileys\'}\" onclick=\"window.open(this.href, \'_blank\', \'width=400,height=440\');return false;\" onkeypress=\"this.onclick()\">Smileys</a>\n</p>\n\n<p>\n<textarea name=\"comment\" cols=\"50\" rows=\"12\">{comment}</textarea>\n</p>\n\n{if logged_out}\n<p><input type=\"checkbox\" name=\"save_info\" value=\"yes\" {save_info} /> Remember my personal information</p>\n{/if}\n\n<p><input type=\"checkbox\" name=\"notify_me\" value=\"yes\" {notify_me} /> Notify me of follow-up comments?</p>\n\n{if captcha}\n<p>Submit the word you see below:</p>\n<p>\n{captcha}\n<br />\n<input type=\"text\" name=\"captcha\" value=\"\" size=\"20\" maxlength=\"20\" style=\"width:140px;\" />\n</p>\n{/if}\n\n<input type=\"submit\" name=\"submit\" value=\"Submit\" />\n<input type=\"submit\" name=\"preview\" value=\"Preview\" />\n\n{/exp:comment:form}\n</div>\n\n<p><a href=\"{homepage}\">&lt;&lt; Back to main</a></p>\n\n\n</div>\n{embed=\"includes/.blogsidebar\"}\n\n	<div class=\"clear\"></div>\n</div>\n\n	{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(30,1,4,'contact','y','webpage','	{embed=\"includes/.head\"}\n	<title>{contacttitle}</title>\n\n</head>\n<body>\n\n{embed=\"includes/.header\"}\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	<div class=\"grid_8 push_4 content\">\n		{exp:channel:entries channel=\"blog\" url_title=\"contact\"}\n			<div class=\"entry\">\n				<h2 class=\"title\">{title}</h2>\n				{summary}\n				{body}\n				{extended}\n			</div>\n		{/exp:channel:entries}\n		<div class=\"entry\" id=\"physicaladdress\">\n			<h2>Physical Address</h2>\n			<p>{streetaddress}<br>\n			{city}, {state} {zip}</p>\n			{if phone}<p><strong>Phone:</strong> {phone}</p>{/if}\n			{if fax}<p><strong>Fax:</strong> {fax}</p>{/if}\n			{if emailaddress}<p><strong>Email:</strong> {encode=\"{emailaddress}\"}</p>{/if}\n		</div>\n		<div class=\"entry\" id=\"socialmedia\">\n			<h2>Social Media</h2>\n			<ul>\n			{if twitter}<li id=\"twitter\"><a href=\"{twitter}\"><img src=\"{site_url}images/twitter.png\"><span>Twitter</span></a></li>{/if}\n			{if facebook}<li id=\"facebook\"><a href=\"{facebook}\"><img src=\"{site_url}images/facebook.png\"><span>Facebook</span></a></li>{/if}\n			{if myspace}<li id=\"myspace\"><a href=\"{myspace}\"><img src=\"{site_url}images/myspace.png\"><span>Myspace</span></a></li>{/if}\n			{if linkedin}<li id=\"linkedin\"><a href=\"{linkedin}\"><img src=\"{site_url}images/linkedin.png\"><span>LinkedIn</span></a></li>{/if}\n			{if youtube}<li id=\"youtube\"><a href=\"{youtube}\"><img src=\"{site_url}images/youtube.png\"><span>Youtube</span></a></li>{/if}\n			{if plaxo}<li id=\"vimeo\"><a href=\"{vimeo}\"><img src=\"{site_url}images/vimeo.png\"><span>Vimeo</span></a></li>{/if}\n			</ul>\n		</div>\n\n		<div class=\"entry\">\n			<h2>Contact Form</h2>\n			<p>Please fill-in the following fields:</p>\n			{exp:freeform:form form_name=\"default_form\" return=\"blog/thanks\" notify=\"\" template=\"default_template\" required=\"firstname|lastname|email|message\"}\n			<div id=\"customform\">\n			<table width=\"100%\">\n				<tr>\n					<td width=\"100%\"><input type=\"text\" name=\"firstname\" value=\"\" /><label><span class=\"requiredfield\">*</span>First Name:</label></td>\n				</tr>\n				<tr>\n					<td><input type=\"text\" name=\"lastname\" value=\"\" /><label><span class=\"requiredfield\">*</span>Last Name:</label></td>\n				</tr>\n				<tr>\n					<td><input type=\"text\" name=\"email\" value=\"\" /><label><span class=\"requiredfield\">*</span>Email Address:</label></td>\n				</tr>\n				<tr>\n					<td>\n						<textarea rows=\"5\" cols=\"50\" type=\"text\" name=\"message\" value=\"\" /></textarea><label><span class=\"requiredfield\">*</span>Message:</label>\n					</td>\n				</tr>\n			</table>\n\n\n\n\n			{if captcha}\n			<p>Please enter the word you see in the image below:</p>\n			<p>{captcha}<br />\n			<input id=\"captcha\" type=\"text\" name=\"captcha\" value=\"\" maxlength=\"20\" /></p>\n			{/if}\n\n			<p>\n			<input type=\"submit\" name=\"submit\" id=\"contactsubmit\" value=\"submit\" />\n			</p>\n			</div>\n			{/exp:freeform:form}\n		</div>\n	</div>\n	{embed=\"includes/.blogsidebar\"}\n	<div class=\"clear\"></div>\n</div>\n{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n',NULL,1294355000,1,'n',0,'','n','n','o',76),
	(31,1,4,'archives','y','webpage','\n	{embed=\"includes/.head\"}\n	<link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS\" href=\"{path=\'blog/rss2}\'\">\n	<title>{archivelisttitle}</title>\n\n</head>\n<body>\n\n{embed=\"includes/.header\"}\n\n<div class=\"container_12\" id=\"contentwrapper\">\n	<div class=\"grid_8 push_4 content\">\n		<h2>By Date:</h2>\n		{exp:channel:entries orderby=\"date\" channel=\"blog\" url_title=\"not about|contact\" sort=\"desc\" limit=\"100\" disable=\"pagination|custom_fields|categories|member_data\"}\n			{date_heading display=\"yearly\"}\n				<h4 class=\"title\">{entry_date format=\"%Y\"}</h2>\n			{/date_heading}\n\n			{date_heading display=\"monthly\"}\n				<h5 class=\"date\">{entry_date format=\"%F\"}</h3>\n				<ul class=\"archivelist\">\n			{/date_heading}\n			<li><a href=\"{title_permalink=\'blog/index\'}\">{entry_date format=\"%d\"} / {title}</a></li>\n		{/exp:channel:entries}\n		</ul>\n	</div>\n	{embed=\"includes/.blogsidebar\"}\n	<div class=\"clear\"></div>\n</div>\n{embed=\"includes/.footer\"}\n{embed=\"includes/.analytics\"}\n</body>\n</html>\n\n',NULL,1294355000,1,'n',0,'','n','n','o',42),
	(32,1,4,'rss2','y','feed','{exp:rss:feed channel=\"blog\"}\n\n<?xml version=\"1.0\" encoding=\"{encoding}\"?>\n<rss version=\"2.0\"\n    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"\n    xmlns:sy=\"http://purl.org/rss/1.0/modules/syndication/\"\n    xmlns:admin=\"http://webns.net/mvcb/\"\n    xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"\n    xmlns:content=\"http://purl.org/rss/1.0/modules/content/\">\n\n    <channel>\n    \n    <title>{exp:xml_encode}{blogtitle}{/exp:xml_encode}</title>\n    <link>{site_url}</link>\n    <description>{channel_description}</description>\n    <dc:language>{channel_language}</dc:language>\n    <dc:creator>{author}</dc:creator>\n    <dc:rights>Copyright {gmt_date format=\"%Y\"}</dc:rights>\n    <dc:date>{gmt_date format=\"%Y-%m-%dT%H:%i:%s%Q\"}</dc:date>\n    <admin:generatorAgent rdf:resource=\"http://expressionengine.com/\" />\n    \n{exp:channel:entries channel=\"blog\" limit=\"10\" dynamic_start=\"on\" disable=\"member_data|pagination\"}\n   <item>\n      <title>{exp:xml_encode}{title}{/exp:xml_encode}</title>\n      <link>{title_permalink=\'blog/comments\'}</link>\n      <guid>{title_permalink=\'blog/comments\'}#When:{gmt_entry_date format=\"%H:%i:%sZ\"}</guid>\n      <description><![CDATA[{body}\n\n             <p>Published in: {categories}<a href=\"{path=\'blog\'}\">{category_name}</a>{/categories} by {author}</p>\n\n  <hr />\n\n]]></description>\n      <dc:subject>{exp:xml_encode}{categories backspace=\"1\"}{category_name}, {/categories}{/exp:xml_encode}</dc:subject>\n\n      <dc:date>{gmt_entry_date format=\"%Y-%m-%dT%H:%i:%s%Q\"}</dc:date>\n    </item>{/exp:channel:entries}\n    \n    </channel>\n</rss>\n\n{/exp:rss:feed}','',1294355045,1,'n',0,'','n','n','o',132),
	(33,1,4,'smileys','y','webpage','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"{lang}\" lang=\"{lang}\">\n<head>\n<meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\" />\n<title>Smileys</title>\n\n<style type=\"text/css\">\n\nbody {\n background-color: #ffffff;\n margin-left: 40px;\n margin-right: 40px;\n margin-top: 30px;\n font-size: 11px;\n font-family: verdana,trebuchet,sans-serif;\n}\na:link {\n color: #990000;\n font-size: 11px;\n font-weight: normal;\n text-decoration: underline;\n}\na:visited {\n color: #990000;\n font-size: 11px;\n font-weight: normal;\n text-decoration: underline;\n}\na:active {\n color: #990000;\n font-size: 11px;\n font-weight: normal;\n text-decoration: underline;\n}\na:hover {\n color: #990000;\n font-size: 11px;\n font-weight: normal;\n text-decoration: none;\n}\n\n</style>\n\n<script language=\"javascript\">\n<!--\n\nfunction add_smiley(smiley)\n{\n    opener.document.getElementById(\'comment_form\').comment.value += \" \" + smiley + \" \";\n    opener.window.document.getElementById(\'comment_form\').comment.focus();\n    window.close();\n}\n//-->\n</script>\n\n</head>\n<body>\n\n<p>Click on an image to add it to your comment</p>\n\n<table border=\"0\" width=\"100%\" cellpadding=\"6\" cellspacing=\"1\">\n\n{exp:emoticon columns=\"4\"}\n<tr>\n<td><div>{smiley}</div></td>\n</tr>\n{/exp:emoticon}\n\n</table>\n\n</body>\n</html>\n',NULL,1294355000,1,'n',0,'','n','n','o',12),
	(34,1,2,'.footer','y','webpage','<div id=\"footer\">\n	<div class=\"container_12\">\n		<div class=\"grid_6\" id=\"footerinnerleft\">\n			<p>{phone} // &copy; 2009 {if {current_time format=\"%Y\"}!=\"2009\"}- {current_time format=\"%Y\"}{/if} {blogtitle}</p>\n			<p>{encode=\"{emailaddress}\" title=\"{emailaddress}\"} // <a href=\"http://www.eetemplates.com\">Powered by EEtemplates.com</a></p>\n		</div>\n		<div class=\"grid_6\" id=\"footerinnerright\">\n			<p><a href=\"{site_url}\">Home</a>  //  <a href=\"{path=\'blog/contact\'}\">Contact</a></p>\n			<p><a href=\"{twitter}\">Twitter</a>  //  <a href=\"{path=\'blog/rss2\'}\">RSS</a></p>\n		</div>\n		<div class=\"clear\"></div>\n	</div>\n</div>',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(35,1,2,'.analytics','y','webpage','<script type=\"text/javascript\">\nvar gaJsHost = ((\"https:\" == document.location.protocol) ? \"https://ssl.\" : \"http://www.\");\ndocument.write(unescape(\"%3Cscript src=\'\" + gaJsHost + \"google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E\"));\n</script>\n<script type=\"text/javascript\">\ntry {\nvar pageTracker = _gat._getTracker(\"UA-2330916-2\");\npageTracker._trackPageview();\n} catch(err) {}</script>\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(36,1,2,'.aboutauthor','y','webpage','<h3 class=\"sidetitle\">About</h3>\n{exp:channel:entries url_title=\"about\" dynamic=\"off\"}\n{exp:word_limit total=\"50\"}{body}{/exp:word_limit}\n<a href=\"{path=\'blog/about\'}\">more...</a>\n{/exp:channel:entries}\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(37,1,2,'.head','y','webpage','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<head>\n<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" >\n\n<title>{exp:channel:entries limit=\"1\" url_title=\"not about\"}{title}{/exp:channel:entries} - {blogtitle}</title>\n\n<link href=\'http://fonts.googleapis.com/css?family=Bentham\' rel=\'stylesheet\' type=\'text/css\'>\n\n	{embed=\"includes/.css\"}\n	',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(38,1,2,'.css','y','webpage','<link rel=\'stylesheet\' type=\'text/css\' media=\'all\' href=\'{site_url}css/960m.css\'>\n<link rel=\'stylesheet\' type=\'text/css\' media=\'all\' href=\'{site_url}css/layout.css\'>\n<link rel=\'stylesheet\' type=\'text/css\' media=\'all\' href=\'{site_url}images/style1/style1.css\'>\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(39,1,2,'.ads','y','webpage','<!--in this template you can either insert your own ads as HTML or use EE to manage your ads by using the following code and weblogs. Note: it is written for use with Ads that are -->\n\n{exp:channel:entries channel=\"ads\" orderby=\"random\" dynamic=\"off\" limit=\"6\" disable=\"member_data\" }\n<a class=\"ads\" href=\"{adlink}\"><img src=\"{adimage}\" alt=\"{adalt}\" title=\"{adtitle}\"></a>\n{/exp:channel:entries}\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(40,1,2,'.search','y','webpage','{exp:search:simple_form search_in=\"everywhere\"}\n<h3 class=\"sidetitle\">Search</h3>\n<p><input type=\"text\" name=\"keywords\" value=\"\" class=\"searchinput\" size=\"18\" maxlength=\"100\"><input type=\"submit\" value=\"submit\" class=\"searchsubmit submit\"></p>\n{/exp:search:simple_form}\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(41,1,2,'.mailinglist','y','webpage','<h3 class=\"sidetitle\">Join our Mailing List</h3>\n{exp:mailinglist:form}\n<p><input type=\"text\" name=\"email\" value=\"\" id=\"searchinput\" class=\"input\" size=\"18\" /><input type=\"submit\" value=\"submit\" class=\"searchsubmit submit\" /></p>\n{/exp:mailinglist:form}\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(42,1,2,'.header','y','webpage','<div class=\"container_12\" id=\"logonav\">\n	<div class=\"grid_6\">\n		<h1><a href=\"{site_url}\">{blogtitle}</a></h1>\n	</div>\n	<div class=\"grid_6\">\n		{embed=\"includes/.navigation\"}\n	</div>\n	<div class=\"clear\"></div>\n</div>\n\n<div id=\"header\">\n	<div class=\"container_12\">\n		<div class=\"grid_12\" id=\"headerinner\">\n			<h2>{blogtagline}</h2>\n		</div>\n		<div class=\"clear\"></div>\n	</div>\n</div>',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(43,1,2,'.syndicate','y','webpage','<ul id=\"syndicate\">\n<li><a href=\"{path=\'blog/rss2\'}\">Subscribe to {site_name}</a></li>\n</ul>\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(44,1,2,'.scripts','y','webpage','',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(45,1,2,'.archives','y','webpage','<h3 class=\"sidetitle\">Monthly Archives</h3>\n<ul>\n{exp:channel:month_links weblog=\"blog\"}\n<li><a href=\"{path=\'blog/index\'}\">{month} {year}</a></li>\n{/exp:channel:month_links}\n<li><a href=\"{path=\'blog/archives\'}\">Complete Archives</a></li>\n<li><a href=\"{path=\'blog/categories\'}\">Category Archives</a></li>\n</ul>\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(46,1,2,'.memberlinks','y','webpage','<h3>Members:</h3>\n{if logged_in}\n <a href=\"{path=\'member/profile\'}\">Your Account</a>  |  <a href=\"{path=\'logout\'}\">Logout</a>\n{/if}\n\n{if logged_out}\n <a href=\"{path=\'member/login\'}\">Login</a> | <a href=\"{path=\'member/register\'}\">Register</a>\n{/if}\n\n | <a href=\"{path=\'member/memberlist\'}\">Member List</a>\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(47,1,2,'.categories','y','webpage','<h3 class=\"sidetitle\">Categories</h3>\n{exp:channel:categories channel=\"blog\" style=\"nested\"}\n<a href=\"{path=\'blog/index\'}\">{category_name}</a>\n{/exp:channel:categories}\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(48,1,2,'.mostrecent','y','webpage','<h3 class=\"sidetitle\">Most recent entries</h3>\n<ul>\n{exp:channel:entries orderby=\"date\" sort=\"desc\" limit=\"7\" channel=\"blog\" dynamic=\"off\" disable=\"pagination|categories|member_data\" url_title=\"not about|contact\"}\n<li><a href=\"{title_permalink=\'blog/comments\'}\">{title}</a></li>\n{/exp:channel:entries}\n</ul>\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(49,1,2,'.index','y','webpage','',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(50,1,2,'.blogsidebar','y','webpage','<div class=\"grid_4 pull_8\" id=\"blogsidebar\">\n<div id=\"blogsidebarinner\">\n\n\n	{if enablesidebarads == \'yes\'}\n	{embed=\"includes/.ads\"}\n	{/if}\n\n	{embed=\"includes/.mostrecent\"}\n	\n	{if aboutauthor == \'yes\'}\n		{embed=\"includes/.aboutauthor\"}\n	{/if}\n\n	{if memberlinks == \'yes\'}\n		{embed=\"includes/.memberlinks\"}\n	{/if}\n\n	{if calendar == \'yes\'}\n		{embed=\"includes/.calendar\"}\n	{/if}\n\n	{embed=\"includes/.search\"}\n\n	{embed=\"includes/.categories\"}\n\n	{embed=\"includes/.archives\"}\n\n	{if syndicate == \'yes\'}\n		{embed=\"includes/.syndicate\"}\n	{/if}\n\n	{if mailinglist == \'yes\'}\n		{embed=\"includes/.mailinglist\"}\n	{/if}\n	\n</div></div>',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(51,1,2,'.calendar','y','webpage','<h3>Calendar:</h3>\n{exp:channel:calendar switch=\"calendarToday|calendarCell\"}\n\n<table class=\"calendarBG\" border=\"0\" cellpadding=\"5\" cellspacing=\"1\" id=\"calendar\">\n<tr>\n<th class=\"calendarHeader\"><div class=\"calendarMonthLinks\"><a href=\"{previous_path=\'blog/index\'}\">&lt;&lt;</a></div></th>\n<th class=\"calendarHeader\" colspan=\"5\">{date format=\"%F %Y\"}</th>\n<th class=\"calendarHeader\"><div class=\"calendarMonthLinks\"><a class=\"calendarMonthLinks\" href=\"{next_path=\'blog/index\'}\">&gt;&gt;</a></div></th>\n</tr>\n<tr>\n{calendar_heading}\n<td class=\"calendarDayHeading\">{lang:weekday_abrev}</td>\n{/calendar_heading}\n</tr>\n{calendar_rows }\n{row_start}<tr>{/row_start}\n{if entries}<td class=\'{switch}\' align=\'center\'><a href=\"{day_path=\'blog/index\'}\">{day_number}</a></td>{/if}\n{if not_entries}<td class=\'{switch}\' align=\'center\'>{day_number}</td>{/if}\n{if blank}<td class=\'calendarBlank\'>&nbsp;</td>{/if}\n{row_end}</tr>{/row_end}\n{/calendar_rows}\n</table>\n{/exp:channel:calendar}\n\n',NULL,1294355000,1,'n',0,'','n','n','o',0),
	(52,1,2,'.navigation','y','webpage','<ul>\n  <li><a href=\"{site_url}\" title=\"Home\">Home</a></li>\n  <li><a href=\"{path=\'blog/about\'}\" title=\"About\">About</a></li>\n  <li><a href=\"{path=\'blog/archives\'}\" title=\"Archives\">Archives</a></li>\n  <li><a href=\"{path=\'blog/contact\'}\" title=\"Contact\">Contact</a></li>\n</ul>\n',NULL,1294355000,1,'n',0,'','n','n','o',0);

/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_throttle`;

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL auto_increment,
  `ip_address` varchar(16) NOT NULL default '0',
  `last_activity` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_upload_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_no_access`;

CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_upload_prefs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs`;

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(150) NOT NULL default '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL default 'img',
  `max_size` varchar(16) default NULL,
  `max_height` varchar(6) default NULL,
  `max_width` varchar(6) default NULL,
  `properties` varchar(120) default NULL,
  `pre_format` varchar(120) default NULL,
  `post_format` varchar(120) default NULL,
  `file_properties` varchar(120) default NULL,
  `file_pre_format` varchar(120) default NULL,
  `file_post_format` varchar(120) default NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
INSERT INTO `exp_upload_prefs` (`id`,`site_id`,`name`,`server_path`,`url`,`allowed_types`,`max_size`,`max_height`,`max_width`,`properties`,`pre_format`,`post_format`,`file_properties`,`file_pre_format`,`file_post_format`)
VALUES
	(1,1,'Uploads','/home/eerulz/public_html/demo/template7/images/uploads/','http://sandbox.macminiparking.com/template7//images/uploads/','all','','','','','','','','','');

/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
