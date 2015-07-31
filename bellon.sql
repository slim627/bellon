-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 28 2015 г., 18:11
-- Версия сервера: 5.6.25-0ubuntu0.15.04.1
-- Версия PHP: 5.6.4-4ubuntu6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `bellon`
--

-- --------------------------------------------------------

--
-- Структура таблицы `acl_classes`
--

CREATE TABLE IF NOT EXISTS `acl_classes` (
`id` int(10) unsigned NOT NULL,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acl_entries`
--

CREATE TABLE IF NOT EXISTS `acl_entries` (
`id` int(10) unsigned NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acl_object_identities`
--

CREATE TABLE IF NOT EXISTS `acl_object_identities` (
`id` int(10) unsigned NOT NULL,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acl_object_identity_ancestors`
--

CREATE TABLE IF NOT EXISTS `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acl_security_identities`
--

CREATE TABLE IF NOT EXISTS `acl_security_identities` (
`id` int(10) unsigned NOT NULL,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `slug`) VALUES
(5, 'Майки', 'c203e4d6ea382b3d00dfbc6e189a73cd0ac37514.jpeg', 'maiki'),
(6, 'кепки', '9b9e45e1eb85731fcddf34e0b50dfbeb45d8f1c2.jpeg', 'kiepki'),
(7, 'толстовки', 'e3ded4fa3d0e85139c253e8a5c87c12ac41f7176.jpeg', 'tolstovki'),
(8, 'детские', 'f59ab1e490741311dfdefd7dc141ae99a9a009d3.jpeg', 'dietskiie');

-- --------------------------------------------------------

--
-- Структура таблицы `config`
--

CREATE TABLE IF NOT EXISTS `config` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyValue` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `config`
--

INSERT INTO `config` (`id`, `name`, `value`, `keyValue`) VALUES
(1, 'Footer copyright', '© 2015 Bellon Company', 'FOOTER_COPYRIGHT'),
(2, 'Footer описание', 'By Alexey', 'FOOTER_DESCRIPTION');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_one` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_two` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_three` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_four` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `address`, `phone_one`, `phone_two`, `phone_three`, `phone_four`, `email`, `description`) VALUES
(1, 'Адрес', 'пр.Рокоссовского 77-627', '321321312', NULL, '321321312', NULL, 'sliml2@mail.ru', 'dfsjfdius fdsi fdsog fgm fgm fdk');

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_group` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_user`
--

CREATE TABLE IF NOT EXISTS `fos_user_user` (
`id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 1, 'atnjjz019kgsko4o0k0kk84444088sc', '6dTRExw5bnC4OUrseAr+mZ6DWX+gNMEoroH8wgu5rkUv9VF+U+MxiMdK9o8wienUEUvOcF3RQNXfeTKq+5oZEg==', '2015-06-29 17:04:42', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '2015-06-29 15:05:18', '2015-06-29 17:04:42', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `short_description`, `description`, `category_id`, `slug`, `text`) VALUES
(6, 'майка 1', '751d6422db0c116bd5913c2eee715e82ebaa6e2b.jpeg', 'авы авы авы выа ыва', '<p>авы авы авы выа ыва&nbsp;авы авы авы выа ыва&nbsp;авы авы авы выа ыва&nbsp;авы авы авы выа ыва&nbsp;авы авы авы выа ыва&nbsp;авы авы авы выа ыва&nbsp;авы авы авы выа ыва&nbsp;авы авы авы выа ыва&nbsp;авы авы авы выа ыва&nbsp;</p>', 5, 'maika-1', NULL),
(7, 'майка 2', '4f7d71f555ea4fb8b91e556ddd02b3b7038a33ab.jpeg', 'авыавы ва ыва ыва вы', '<p>авыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва вы</p>', 5, 'maika-2', NULL),
(8, 'майка 3', '9b69f9173d892605e80c29cfb66b5957ec87cf67.jpeg', 'авыавы ва ыва ыва выавыавы ва ыва ыва вы', '<p>авыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва вы</p>', 5, 'maika-3', '<p><span style="line-height: 20.7999992370605px;">авыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва выавыавы ва ыва ыва вы</span></p>');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `acl_classes`
--
ALTER TABLE `acl_classes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`);

--
-- Индексы таблицы `acl_entries`
--
ALTER TABLE `acl_entries`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`), ADD KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`), ADD KEY `IDX_46C8B806EA000B10` (`class_id`), ADD KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`), ADD KEY `IDX_46C8B806DF9183C9` (`security_identity_id`);

--
-- Индексы таблицы `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`), ADD KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`);

--
-- Индексы таблицы `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
 ADD PRIMARY KEY (`object_identity_id`,`ancestor_id`), ADD KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`), ADD KEY `IDX_825DE299C671CEA1` (`ancestor_id`);

--
-- Индексы таблицы `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_64C19C1989D9B62` (`slug`);

--
-- Индексы таблицы `config`
--
ALTER TABLE `config`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fos_user_group`
--
ALTER TABLE `fos_user_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`);

--
-- Индексы таблицы `fos_user_user`
--
ALTER TABLE `fos_user_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`), ADD UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`);

--
-- Индексы таблицы `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
 ADD PRIMARY KEY (`user_id`,`group_id`), ADD KEY `IDX_B3C77447A76ED395` (`user_id`), ADD KEY `IDX_B3C77447FE54D947` (`group_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_D34A04AD989D9B62` (`slug`), ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `acl_classes`
--
ALTER TABLE `acl_classes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `acl_entries`
--
ALTER TABLE `acl_entries`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `config`
--
ALTER TABLE `config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `fos_user_group`
--
ALTER TABLE `fos_user_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `fos_user_user`
--
ALTER TABLE `fos_user_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `acl_entries`
--
ALTER TABLE `acl_entries`
ADD CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
ADD CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`);

--
-- Ограничения внешнего ключа таблицы `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
ADD CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
