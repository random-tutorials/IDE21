

CREATE TABLE IF NOT EXISTS `access_rules` (
  `ruleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(10) NOT NULL,
  `resource` varchar(100) NOT NULL,
  `rule` enum('allow','deny') DEFAULT NULL,
  PRIMARY KEY (`ruleId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `name_en` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_sr` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `category_items`
--

CREATE TABLE IF NOT EXISTS `category_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(50) NOT NULL,
  `contentType` varchar(50) NOT NULL,
  `moduleName` varchar(255) NOT NULL,
  `commentatorName` varchar(255) NOT NULL,
  `commentatorEmail` varchar(255) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT '2' COMMENT '0 - blocked 1 - pending for approval, 2 - approved',
  `replyToComment` int(10) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments_ratings`
--

CREATE TABLE IF NOT EXISTS `comments_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentatorName` varchar(255) NOT NULL,
  `commentatorIp` varchar(255) DEFAULT NULL,
  `rating` int(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pageId` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments_settings`
--

CREATE TABLE IF NOT EXISTS `comments_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentType` varchar(255) NOT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0 - disabled, 1- enabled',
  `access` int(1) DEFAULT '0' COMMENT '0 - public, 1 - registred',
  `postType` varchar(1) DEFAULT '0' COMMENT '0 - live, 1 - req cofirmation',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `depName` varchar(255) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `emailId` varchar(30) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `body` text,
  `description` text,
  PRIMARY KEY (`emailId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `weight` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) NOT NULL DEFAULT '1',
  `name` varchar(60) DEFAULT NULL,
  `description` text,
  `check_access` tinyint(1) DEFAULT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `menu_id` int(11) NOT NULL,
  `content_id` int(11) DEFAULT NULL,
  `projectId` int(10) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) DEFAULT '1',
  `expanded` tinyint(1) DEFAULT '0',
  `weight` int(11) DEFAULT '0',
  `check_access` tinyint(1) DEFAULT NULL,
  `name_en` varchar(60) NOT NULL,
  `description_en` text,
  `url_en` varchar(255) NOT NULL,
  `name_sr` varchar(60) NOT NULL,
  `description_sr` text,
  `url_sr` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `moduleId` int(10) NOT NULL AUTO_INCREMENT,
  `templateId` int(10) DEFAULT NULL,
  `projectId` int(10) NOT NULL DEFAULT '1',
  `moduleName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleDesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `core` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`moduleId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `mod_forms`
--

CREATE TABLE IF NOT EXISTS `mod_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) NOT NULL,
  `templateId` int(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contact` int(11) DEFAULT NULL,
  `weight` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `mod_forms_fields`
--

CREATE TABLE IF NOT EXISTS `mod_forms_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `weight` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages_en`
--

CREATE TABLE IF NOT EXISTS `pages_en` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) NOT NULL DEFAULT '1',
  `userId` int(10) NOT NULL,
  `dateChanged` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `objectids` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 NOT NULL,
  `template_id` int(10) NOT NULL DEFAULT '1',
  `image` varchar(100) CHARACTER SET latin1 NOT NULL,
  `output` longtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `homepage` int(1) NOT NULL DEFAULT '0',
  `css` text CHARACTER SET latin1 NOT NULL,
  `js` text CHARACTER SET latin1 NOT NULL,
  `check_access` tinyint(1) DEFAULT NULL,
  `bounded` tinyint(1) NOT NULL DEFAULT '1',
  `unbounded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages_sr`
--

CREATE TABLE IF NOT EXISTS `pages_sr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) NOT NULL DEFAULT '1',
  `userId` int(10) NOT NULL,
  `dateChanged` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `objectids` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 NOT NULL,
  `template_id` int(10) NOT NULL DEFAULT '1',
  `image` varchar(100) CHARACTER SET latin1 NOT NULL,
  `output` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `homepage` int(1) NOT NULL DEFAULT '0',
  `css` text CHARACTER SET latin1 NOT NULL,
  `js` text CHARACTER SET latin1 NOT NULL,
  `check_access` tinyint(1) DEFAULT NULL,
  `bounded` tinyint(1) NOT NULL DEFAULT '1',
  `unbounded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `core` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settingName` varchar(50) NOT NULL,
  `description` text,
  `value` varchar(255) DEFAULT NULL,
  `core` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- Table structure for table `tableregistry`
--

CREATE TABLE IF NOT EXISTS `tableregistry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tablePK` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `core` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Table structure for table `templates_en`
--

CREATE TABLE IF NOT EXISTS `templates_en` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) NOT NULL DEFAULT '1',
  `userId` int(10) NOT NULL,
  `dateChanged` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) CHARACTER SET latin1 NOT NULL,
  `objectids` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 NOT NULL,
  `image` varchar(100) CHARACTER SET latin1 NOT NULL,
  `output` longtext NOT NULL,
  `defaultTemplate` int(1) NOT NULL,
  `bodyBg` mediumtext,
  `staticFiles` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `templates_sr`
--

CREATE TABLE IF NOT EXISTS `templates_sr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) NOT NULL DEFAULT '1',
  `userId` int(10) NOT NULL,
  `dateChanged` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) CHARACTER SET latin1 NOT NULL,
  `objectids` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 NOT NULL,
  `image` varchar(100) CHARACTER SET latin1 NOT NULL,
  `output` longtext NOT NULL,
  `defaultTemplate` int(1) NOT NULL,
  `bodyBg` mediumtext,
  `staticFiles` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `requestId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `used` int(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`requestId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created` int(11) DEFAULT NULL,
  `login` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT 'UTC',
  `languageId` int(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `superadmin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`),
  KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;




INSERT INTO `category_items` (`id`, `content_id`, `category_id`) VALUES
(1, 2, 2),
(2, 1, 2),
(3, 2, 1);


INSERT INTO `contacts` (`id`, `name`, `lastName`, `depName`, `address`, `phone`, `fax`, `email`, `weight`) VALUES
(16, 'Nebojsa', 'Tomic', NULL, '', '', NULL, 'email@ex.com', 0);


INSERT INTO `emails` (`emailId`, `subject`, `body`, `description`) VALUES
('password_reminder', 'Your Password Reminder', '<p>This is the password recovery email. Click here: !link to change your password.</p>', 'Password Reminder'),
('new_user', 'Welcome to !site_name', '<p>!username,  Thank you for registering at !site_name.   We hope you have a plesant time with us.  Sincerely, Site Team</p>', 'E-Mail sent to new users.'),
('account_activation', 'Your Account Activation Link', '<p>Welcome, we are happy to see you join us! To activate your account  Click here:  !link</p>', 'Account Activation'),
('admin_info_new_user', 'New user has registered', 'New user has registered at the site: !site, with the username: !username\r\nat !time', 'New user has registered at the site');


INSERT INTO `languages` (`id`, `code`, `name`, `enabled`, `isDefault`, `weight`) VALUES
(1, 'en', 'English', 1, 1, 2),
(2, 'sr', 'Srpski', 1, 0, 1);


INSERT INTO `menus` (`menu_id`, `projectId`, `name`, `description`, `check_access`, `block_id`) VALUES
(1, 1, 'First', 'This is the first menu', NULL, 0),
(104, 1, 'Second', NULL, NULL, 0);



INSERT INTO `menu_items` (`item_id`, `parent_id`, `menu_id`, `content_id`, `projectId`, `enabled`, `expanded`, `weight`, `check_access`, `name_en`, `description_en`, `url_en`, `name_sr`, `description_sr`, `url_sr`) VALUES
(1, 0, 1, 7, 1, 1, 0, 0, NULL, 'First page', '', 'view/index/id/7', 'Prva strana', '', 'view/index/id/7'),
(2, 0, 1, 15, 1, 1, 0, 1, NULL, 'Second page', '', 'view/index/id/15', 'Druga strana', '', 'view/index/id/2'),
(3, 0, 1, 3, 1, 1, 0, 2, NULL, 'Contact', '', 'view/index/id/3', 'Kontakt', '', 'view/index/id/3'),
(4, 0, 1, 2, 1, 1, 0, 1, NULL, 'All about', '', 'view/index/id/2', 'Sve o', '', 'view/index/id/2'),
(5, 1, 1, 2, 1, 1, 0, 0, NULL, 'First page first sub', '', 'view/index/id/2', 'Prva strana prvi sub', '', 'view/index/id/2'),
(6, 1, 1, 2, 1, 1, 0, 1, NULL, 'First page 2nd sub', '', 'view/index/id/2', 'Prva strana 2. sub', '', 'view/index/id/2'),
(7, 1, 1, 2, 1, 1, 0, 2, NULL, 'First page 3rd sub', '', 'view/index/id/2', 'Prva strana 3. sub', '', 'view/index/id/2'),
(8, 4, 1, 2, 1, 1, 0, 0, NULL, 'All about me', '', 'view/index/id/2', 'Sve o meni', '', 'view/index/id/2'),
(9, 4, 1, 2, 1, 1, 0, 0, NULL, 'All about you', '', 'view/index/id/2', 'Sve o vama', '', 'view/index/id/2'),
(10, 4, 1, 2, 1, 1, 0, 1, NULL, 'All about us', '', 'view/index/id/2', 'Sve o nama', '', 'view/index/id/2'),
(12, 5, 1, 1, 1, 1, 0, 0, NULL, 'First page 1.sub of the 1. sub', '', 'view/index/id/1', 'Prva strana 1.sub prvog suba', '', 'view/index/id/1'),
(13, 0, 105, 18, 1, 1, 0, 0, NULL, 'Band', '', 'view/index/id/18', '', NULL, ''),
(14, 0, 105, 17, 1, 1, 0, 0, NULL, 'Diskografija', '', 'view/index/id/17', '', NULL, ''),
(15, 0, 105, 18, 1, 1, 0, 0, NULL, 'Media', '', 'view/index/id/18', '', NULL, ''),
(16, 0, 105, 18, 1, 1, 0, 0, NULL, 'Press', '', 'view/index/id/18', '', NULL, '');



INSERT INTO `modules` (`moduleId`, `templateId`, `projectId`, `moduleName`, `moduleDesc`, `version`, `enabled`, `core`) VALUES
(1, 1, 1, 'Search', 'search', 1, 1, 1),
(2, 1, 1, 'Forms', 'ContactForms', 1, 1, 1),
(3, 1, 1, 'User', 'User Module', 1, 1, 1),
(4, 1, 1, 'Comments', 'komentari', 1, 0, 1);


INSERT INTO `mod_forms` (`id`, `projectId`, `templateId`, `name`, `message`, `contact`, `weight`) VALUES
(1, 1, 1, 'contact', 'If there is anything to sss', 16, 0),
(2, 2, 16, 'rezervacija', 'rrrrrrzzzzyyyy', 12, 0);

INSERT INTO `mod_forms_fields` (`id`, `form_id`, `name`, `type`, `enabled`, `weight`) VALUES
(1, 1, 'First name', 1, 1, 0),
(2, 1, 'Last name', 1, 1, 0),
(3, 1, 'Company', 1, 1, 0),
(4, 1, 'eMail address', 1, 1, 0),
(5, 1, 'Phone number', 1, 0, 0),
(6, 1, 'Message', 2, 1, 0),
(8, 2, 'First Name', 1, 1, 0),
(9, 2, 'Last Name', 1, 1, 0),
(10, 2, 'Company', 1, 1, 0),
(11, 2, 'eMail address', 1, 1, 0),
(12, 2, 'Phone number', 1, 1, 0),
(13, 2, 'Poruka', 2, 1, 0),
(14, 2, 'Attachment', 1, 0, 0);


INSERT INTO `pages_en` (`id`, `projectId`, `userId`, `dateChanged`, `title`, `alias`, `objectids`, `description`, `keywords`, `category`, `template_id`, `image`, `output`, `published`, `homepage`, `css`, `js`, `check_access`, `bounded`, `unbounded`) VALUES
(1, 1, 1, 1312481789, 'Prva strana', 'prva-strana', '', '', '', '2', 11, '', '', 1, 0, '', '', NULL, 1, 0);


INSERT INTO `pages_sr` (`id`, `projectId`, `userId`, `dateChanged`, `title`, `alias`, `objectids`, `description`, `keywords`, `category`, `template_id`, `image`, `output`, `published`, `homepage`, `css`, `js`, `check_access`, `bounded`, `unbounded`) VALUES
(1, 1, 1, 1312481789, 'Prva strana', 'prva-strana', '', '', '', '2', 11, '', '', 1, 0, '', '', NULL, 1, 0);



INSERT INTO `roles` (`roleId`, `name`, `core`) VALUES
(1, 'guest', 1),
(2, 'registered', 1),
(3, 'editor', 1),
(4, 'administrator', 1);



INSERT INTO `settings` (`id`, `settingName`, `description`, `value`, `core`) VALUES
(1, 'urlRewrite', 'rewriting of the urls', '1', 1),
(10, 'cacheEnabled1', 'enable or disable  caching ', '1', 1),
(11, 'userRegistrationEnabled', 'user Registration Enabled', '1', 1),
(12, 'emails_from_default', 'emails_from_default ', 'email@ex.com', 1),
(22, 'defaultKeywords', 'default keywordss', 'cms online visual ide php', 1),
(23, 'defaultDescription', 'default Description for the site', 'cms-ide is a tool for online visual designing web pages, created by Nebojsa Tomic', 1),
(27, 'commentsAuto', 'should comments be automatic for each page or manually added', '0', 1),
(28, 'htmLawed', 'htmlawed turned on or off', '1', 1);



INSERT INTO `tableregistry` (`id`, `tablePK`, `name`, `core`) VALUES
(1, 'id', 'settings', 1),
(2, 'id', 'mod_forms', 1),
(3, 'id', 'contacts', 1),
(4, 'id', 'mod_forms_fields', 1),
(5, 'id', 'languages', 1),
(6, 'userId', 'users', 1),
(7, 'roleId', 'roles', 1),
(8, 'id', 'comments', 1),
(9, 'id', 'pages_sr', 0),
(10, 'id', 'pages_en', 0);

INSERT INTO `templates_en` (`id`, `projectId`, `userId`, `dateChanged`, `title`, `alias`, `objectids`, `description`, `category`, `image`, `output`, `defaultTemplate`, `bodyBg`, `staticFiles`) VALUES
(1, 1, 1, 1312481789, 'Template1-Blue', 'template1-blue', '', '', '', '', '', 1, 'url(images/backgrounds/vector_0298.jpg)  fixed;-moz-background-size:100%;-webkit-background-size:100%;-o-background-size:100%;background-size:100%; no-repeat;-moz-background-size:100%;-webkit-background-size:100%;-o-background-size:100%;background-size:100%;', 'css/themes.css');

INSERT INTO `templates_sr` (`id`, `projectId`, `userId`, `dateChanged`, `title`, `alias`, `objectids`, `description`, `category`, `image`, `output`, `defaultTemplate`, `bodyBg`, `staticFiles`) VALUES
(1, 1, 1, 1312481789, 'Template1-Blue', 'template1-blue', '', '', '', '', '', 1, 'url(images/backgrounds/vector_0298.jpg)  fixed;-moz-background-size:100%;-webkit-background-size:100%;-o-background-size:100%;background-size:100%; no-repeat;-moz-background-size:100%;-webkit-background-size:100%;-o-background-size:100%;background-size:100%;', 'css/themes.css');



INSERT INTO `users` (`userId`, `username`, `fullname`, `password`, `email`, `created`, `login`, `status`, `timezone`, `languageId`, `picture`, `roleId`, `date_format`, `superadmin`) VALUES
(1, 'nebojsa', 'NebojsaTomic', '4b8cb054ac14783fe1a0a8c0dc90937def450b46', 'email@ex.com', NULL, 1327679569, 1, 'UTC', 0, NULL, 4, NULL, 1),
(19, 'proba', 'Proba1', '9f47b814230f7481deb45506283214aa58e923f9', 'email@ex.com', 1256571392, 1370937668, 1, '', 0, NULL, 4, '', 1);
