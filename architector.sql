-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 10 2021 г., 15:34
-- Версия сервера: 10.4.13-MariaDB
-- Версия PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `architector`
--

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(5) NOT NULL,
  `shower_uz` varchar(500) NOT NULL,
  `link` varchar(500) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `shower_ru` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `shower_uz`, `link`, `icon`, `shower_ru`) VALUES
(1, '(+998) 90 963-21-47', 'tel:+998909632147', '<i class=\"fas fa-phone-alt\"></i>', '(+998) 90 963-21-47'),
(2, 'lazizjonov.jasur@gmail.com', 'mailto:lazizjonov.jasur@gmail.com', '<i class=\"fas fa-envelope\"></i>', 'lazizjonov.jasur@gmail.com'),
(3, 'chilonzor ko\'chasi, 4-uy', 'https://goo.gl/maps/5sLDSkC1V36nRYU46', '<i class=\"fas fa-map-marker-alt\"></i>', 'Улица Чиланзарская, дом 4');

-- --------------------------------------------------------

--
-- Структура таблицы `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `emails`
--

INSERT INTO `emails` (`id`, `mail`, `date`) VALUES
(18, 'anonym_pochta@mail.ru', '2020-07-25 00:00:00'),
(19, 'test@miramax.uz', '2020-07-25 03:47:37'),
(20, 'test@miramax.uz', '2020-07-25 04:08:49'),
(21, 'lazizjonov.jasur@gmail.com', '2021-02-10 19:31:27');

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int(5) NOT NULL,
  `pos` mediumtext NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `pos`, `name`) VALUES
(1, '/uploads/imgs/1_57_48_8_1_2021_1_auto1.jpg', 'This is firs object');

-- --------------------------------------------------------

--
-- Структура таблицы `lang`
--

CREATE TABLE `lang` (
  `name` varchar(25) NOT NULL,
  `uz` varchar(500) NOT NULL,
  `ru` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `lang`
--

INSERT INTO `lang` (`name`, `uz`, `ru`) VALUES
('aboutus', 'Biz haqimizda', 'О нас'),
('contacts', 'Aloqa', 'Контакты'),
('contactus', 'Bog\'lanish', 'Связаться'),
('loading', 'Yuklanmoqda', 'Загрузка'),
('mailing', 'E-mail xabarnoma yoqish bilan siz IDNS-GROUP yangilik va xabarnomalarini elektron pochtangizga jo\'natilishiga rozilik bildirasiz.', 'Включив уведомление по электронной почте, вы соглашаетесь с отправкой новостей и уведомлений IDNS-GROUP на вашу электронную почту.'),
('main', 'Asosiy', 'Главная'),
('more', 'Batafsil', 'Подробно'),
('name', 'Ismingiz', 'Ваше имя'),
('projects', 'Loyihalar', 'Проекты'),
('ready', 'Tayyor', 'Готово'),
('services', 'Xizmatlar', 'Услуги'),
('sms', 'E-mail xabarnoma', 'E-mail оповещения'),
('turnon', 'Yoqish', 'Включить'),
('your_tel', 'Telefon raqamingiz', 'Номер телефона');

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id` varchar(500) NOT NULL,
  `name_uz` varchar(500) NOT NULL,
  `name_ru` varchar(500) NOT NULL,
  `desc_uz` varchar(500) NOT NULL,
  `desc_ru` varchar(500) NOT NULL,
  `fulltext_uz` text NOT NULL,
  `fulltext_ru` text NOT NULL,
  `image_1` mediumtext NOT NULL,
  `image_2` mediumtext NOT NULL,
  `image_3` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `name_uz`, `name_ru`, `desc_uz`, `desc_ru`, `fulltext_uz`, `fulltext_ru`, `image_1`, `image_2`, `image_3`) VALUES
('chiziqcha-bilan-yoziladi', 'Nunc non dapibus sem, vitae vehicula libero.', 'Nunc non dapibus sem, vitae vehicula libero.', 'Praesent egestas lobortis sapien nec molestie. In scelerisque vestibulum magna, eget fermentum lectus congue vel. Pellentesque ultricies nunc orci, eget sollicitudin risus condimentum ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi quis nulla purus.', 'Praesent egestas lobortis sapien nec molestie. In scelerisque vestibulum magna, eget fermentum lectus congue vel. Pellentesque ultricies nunc orci, eget sollicitudin risus condimentum ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi quis nulla purus.', '<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Aenean sollicitudin gravida pharetra. Integer consequat nisi a aliquam elementum. Sed iaculis, lectus at euismod efficitur, mi enim rutrum dui, in venenatis nibh eros quis diam. Sed fermentum ullamcorper felis. Vestibulum egestas vestibulum ligula non eleifend. Pellentesque dictum nunc eu odio venenatis condimentum. Praesent massa mi, sodales ac mi quis, vehicula scelerisque tortor. Morbi velit velit, feugiat at tincidunt et, mattis non massa. Nunc sed porta ante. Nunc vestibulum commodo ultricies. Praesent egestas suscipit condimentum. Proin vel lectus lectus. Ut faucibus mi eu egestas ornare. In tempus, diam et lobortis consectetur, nibh ipsum scelerisque dolor, in faucibus leo nulla varius massa.</span></span></p>\r\n', '<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Aenean sollicitudin gravida pharetra. Integer consequat nisi a aliquam elementum. Sed iaculis, lectus at euismod efficitur, mi enim rutrum dui, in venenatis nibh eros quis diam. Sed fermentum ullamcorper felis. Vestibulum egestas vestibulum ligula non eleifend. Pellentesque dictum nunc eu odio venenatis condimentum. Praesent massa mi, sodales ac mi quis, vehicula scelerisque tortor. Morbi velit velit, feugiat at tincidunt et, mattis non massa. Nunc sed porta ante. Nunc vestibulum commodo ultricies. Praesent egestas suscipit condimentum. Proin vel lectus lectus. Ut faucibus mi eu egestas ornare. In tempus, diam et lobortis consectetur, nibh ipsum scelerisque dolor, in faucibus leo nulla varius massa.</span></span></p>\r\n', '/uploads/imgs/10_32_8_10_1_2021_chiziqcha-bilan-yoziladi_default-4.jpg', '/uploads/imgs/9_22_23_10_1_2021_undefined_default-1.jpg', '/uploads/imgs/9_22_23_10_1_2021_undefined_default-2.jpg'),
('Donec-varius-viverra-nisi', 'Donec varius viverra nisi, semper aliquet est rutrum et.', 'Donec varius viverra nisi, semper aliquet est rutrum et.', 'Donec varius viverra nisi, semper aliquet est rutrum et. Sed sed libero id ipsum sodales hendrerit. Mauris ultricies ullamcorper ultricies. Curabitur iaculis ligula et accumsan facilisis. Proin sed tortor a odio pretium gravida non quis tellus.', 'Donec varius viverra nisi, semper aliquet est rutrum et. Sed sed libero id ipsum sodales hendrerit. Mauris ultricies ullamcorper ultricies. Curabitur iaculis ligula et accumsan facilisis. Proin sed tortor a odio pretium gravida non quis tellus.', '<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Donec varius viverra nisi, semper aliquet est rutrum et. Sed sed libero id ipsum sodales hendrerit. Mauris ultricies ullamcorper ultricies. Curabitur iaculis ligula et accumsan facilisis. Proin sed tortor a odio pretium gravida non quis tellus. Morbi vehicula neque id enim sollicitudin, nec convallis quam sodales. Vivamus nec posuere diam. Ut nec mi dolor. Fusce blandit elit varius dapibus rutrum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel mollis enim.</span></span></p>\r\n', '<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Donec varius viverra nisi, semper aliquet est rutrum et. Sed sed libero id ipsum sodales hendrerit. Mauris ultricies ullamcorper ultricies. Curabitur iaculis ligula et accumsan facilisis. Proin sed tortor a odio pretium gravida non quis tellus. Morbi vehicula neque id enim sollicitudin, nec convallis quam sodales. Vivamus nec posuere diam. Ut nec mi dolor. Fusce blandit elit varius dapibus rutrum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel mollis enim.</span></span></p>\r\n', '/uploads/imgs/10_26_58_10_1_2021_Donec-varius-viverra-nisi_project-1.jpg', '/uploads/imgs/10_26_58_10_1_2021_Donec-varius-viverra-nisi_default-4.jpg', '/uploads/imgs/10_26_58_10_1_2021_Donec-varius-viverra-nisi_project-2.jpg'),
('lorem-id', 'It is a long established fact', 'It is a long established fact', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n', '<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n', '/uploads/imgs/10_37_33_10_1_2021_lorem-id_project-3.jpg', '/uploads/imgs/10_37_33_10_1_2021_lorem-id_project-2.jpg', '/uploads/imgs/10_37_33_10_1_2021_lorem-id_project-1.jpg'),
('this-is-last-id', 'Where can I get some?', 'Where can I get some?', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', '<p><span style=\"font-size:16px\">If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>\r\n', '<p><span style=\"font-size:16px\">If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>\r\n', '/uploads/imgs/10_39_10_10_1_2021_this-is-last-id_default-5.jpg', '/uploads/imgs/10_39_10_10_1_2021_this-is-last-id_default-3.jpg', '/uploads/imgs/10_39_10_10_1_2021_this-is-last-id_default-1.jpg'),
('tort-qavatli-biznes-ofis', '4 qavatli biznes markazi loyihasi', '4 qavatli biznes markazi loyihasi', 'Nam commodo, nulla ut pulvinar laoreet, nisi dui venenatis quam, id pulvinar augue nibh ut sapien. In dolor erat, rhoncus vel vehicula vitae, tincidunt at dui. Vivamus ultrices posuere velit et eleifend. ', 'Nam commodo, nulla ut pulvinar laoreet, nisi dui venenatis quam, id pulvinar augue nibh ut sapien. In dolor erat, rhoncus vel vehicula vitae, tincidunt at dui. Vivamus ultrices posuere velit et eleifend. ', '<blockquote>\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Cras elit sapien, condimentum in semper vitae, tempus blandit est. Sed scelerisque ac diam sed rhoncus. In dignissim condimentum purus malesuada varius. Cras metus nisl, viverra in metus nec, fermentum tincidunt dui. Pellentesque sollicitudin vitae lectus quis vulputate. Curabitur sapien nisi, scelerisque vitae arcu nec, suscipit bibendum elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur </span></span></p>\r\n</blockquote>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">ridiculus mus. Praesent mollis hendrerit elit. Aenean commodo dignissim lorem, molestie venenatis sem auctor nec. Integer congue eleifend elit. In lacinia ac nibh at lacinia. Maecenas gravida, justo vel vehicula hendrerit, dui ex porttitor sapien, ut interdum neque velit quis arcu. Morbi a massa tempor, euismod ligula vel, condimentum massa. Praesent eleifend eros et iaculis bibendum.</span></span></p>\r\n', '<blockquote>\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Cras elit sapien, condimentum in semper vitae, tempus blandit est. Sed scelerisque ac diam sed rhoncus. In dignissim condimentum purus malesuada varius. Cras metus nisl, viverra in metus nec, fermentum tincidunt dui. Pellentesque sollicitudin vitae lectus quis vulputate. Curabitur sapien nisi, scelerisque vitae arcu nec, suscipit bibendum elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur </span></span></p>\r\n</blockquote>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">ridiculus mus. Praesent mollis hendrerit elit. Aenean commodo dignissim lorem, molestie venenatis sem auctor nec. Integer congue eleifend elit. In lacinia ac nibh at lacinia. Maecenas gravida, justo vel vehicula hendrerit, dui ex porttitor sapien, ut interdum neque velit quis arcu. Morbi a massa tempor, euismod ligula vel, condimentum massa. Praesent eleifend eros et iaculis bibendum.</span></span></p>\r\n', '/uploads/imgs/10_32_31_10_1_2021_tort-qavatli-biznes-ofis_default-5.jpg', '/uploads/imgs/8_46_48_10_1_2021_undefined_default-6.jpg', '/uploads/imgs/8_46_48_10_1_2021_undefined_default-5.jpg'),
('uy-loyihasi-dala-hovli', 'Dala hovli uy loyihasi', 'Dala hovli uy loyihasi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend in nisi non gravida. Aliquam viverra non turpis non pulvinar. Duis rutrum libero ultrices mattis blandit. Donec magna neque, bibendum ut augue a, malesuada tincidunt mauris. Aenean est tellus, egestas ac tincidunt ut, fermentum nec nulla. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend in nisi non gravida. Aliquam viverra non turpis non pulvinar. Duis rutrum libero ultrices mattis blandit. Donec magna neque, bibendum ut augue a, malesuada tincidunt mauris. Aenean est tellus, egestas ac tincidunt ut, fermentum nec nulla. ', '<blockquote>\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:18px\"><strong>Aenean sollicitudin gravida pharetra. </strong>Integer consequat nisi a aliquam elementum. Sed iaculis, lectus at euismod efficitur, mi enim rutrum dui, in venenatis nibh eros quis diam. Sed fermentum ullamcorper felis. Vestibulum egestas vestibulum ligula non eleifend. </span></span></p>\r\n</blockquote>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:18px\">Pellentesque dictum nunc eu odio venenatis condimentum. <em>Praesent massa</em> mi, sodales ac mi quis, vehicula scelerisque tortor. Morbi velit velit, feugiat at tincidunt et, mattis non massa. Nunc sed porta ante. Nunc vestibulum commodo ultricies. <u>Praesent egestas suscipit condimentum.</u> Proin vel lectus lectus. Ut faucibus mi eu egestas ornare. In tempus, diam et lobortis consectetur, nibh ipsum scelerisque dolor, in faucibus leo nulla varius massa.</span></span></p>\r\n', '<blockquote>\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:18px\"><strong>Aenean sollicitudin gravida pharetra. </strong>Integer consequat nisi a aliquam elementum. Sed iaculis, lectus at euismod efficitur, mi enim rutrum dui, in venenatis nibh eros quis diam. Sed fermentum ullamcorper felis. Vestibulum egestas vestibulum ligula non eleifend. </span></span></p>\r\n</blockquote>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:18px\">Pellentesque dictum nunc eu odio venenatis condimentum. <em>Praesent massa</em> mi, sodales ac mi quis, vehicula scelerisque tortor. Morbi velit velit, feugiat at tincidunt et, mattis non massa. Nunc sed porta ante. Nunc vestibulum commodo ultricies. <u>Praesent egestas suscipit condimentum.</u> Proin vel lectus lectus. Ut faucibus mi eu egestas ornare. In tempus, diam et lobortis consectetur, nibh ipsum scelerisque dolor, in faucibus leo nulla varius massa.</span></span></p>\r\n', '/uploads/imgs/8_44_7_10_1_2021_undefined_perspective.jpg', '/uploads/imgs/8_44_7_10_1_2021_undefined_project-1.jpg', '/uploads/imgs/8_44_7_10_1_2021_undefined_project-2.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` varchar(50) NOT NULL,
  `name_uz` varchar(500) NOT NULL,
  `name_ru` varchar(500) NOT NULL,
  `desc_uz` varchar(500) NOT NULL,
  `desc_ru` varchar(500) NOT NULL,
  `fulltext_uz` text NOT NULL,
  `fulltext_ru` text NOT NULL,
  `icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name_uz`, `name_ru`, `desc_uz`, `desc_ru`, `fulltext_uz`, `fulltext_ru`, `icon`) VALUES
('binoni-yangilash', 'Qo\'shimcha qurilish uchun loyihalar', 'Qo\'shimcha qurilish uchun loyihalar', 'Binoni yangilash va modernizatsiyalash uchun loyihalar tayyorlash.', 'Binoni yangilash va modernizatsiyalash uchun loyihalar tayyorlash.', '<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>CCA TASHKENT</strong><br />\r\n<br />\r\nYaqin kelajakda Zamonaviy san&#39;at markaziga aylantiriladigan ushbu bino 1912 yilda qurilgan. Bu yerda inqilobdan avval, shaharning birinchi tramvay yo&lsquo;nalishi uchun enegriya yoqilg&lsquo;isi ishlab chiqaruvchi dizel elektr stansiyasi mavjud edi. Aynan shu yerdan Toshkent shahrini elektr bilan ta&#39;minlash boshlangan. Hozirda, bu joyda yangi O&lsquo;zbekistonning yangi badiiy muhitini shakillantirish ishlari boshlanmoqda.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Davlat bolalar kutubxonasi</strong><br />\r\n<br />\r\nBino 1909 yilda arxitektor Markevichning loyihasiga asosan qurilgan.&nbsp;Dastlab bu paxtakor Vadyaevning uyi edi va 1910 yildan beri bu erda ommaviy yig&#39;ilishlar o&#39;tkizilar edi.&nbsp;1930-yillarda bu erda &quot;Komsomolning 30 yilligi&quot; kinoteatri ochilgan. Hozirgacha kutubxona joylashgan binoning faqat chap qismi saqlanib qolingan.&nbsp;Unda Markaziy Osiyodagi eng katta bolalar uchun 200 000 dan ortiq kitoblar to&#39;plamlari&nbsp;mavjud.&nbsp;2020 yilda binoni qayta qurish loyihasi taqdim etiladi, uni Ludi Architects byurosi (Rossiya) boshqarishi rejalashtirilgan.</span></span></p>\r\n', '<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>CCA TASHKENT</strong><br />\r\n<br />\r\nYaqin kelajakda Zamonaviy san&#39;at markaziga aylantiriladigan ushbu bino 1912 yilda qurilgan. Bu yerda inqilobdan avval, shaharning birinchi tramvay yo&lsquo;nalishi uchun enegriya yoqilg&lsquo;isi ishlab chiqaruvchi dizel elektr stansiyasi mavjud edi. Aynan shu yerdan Toshkent shahrini elektr bilan ta&#39;minlash boshlangan. Hozirda, bu joyda yangi O&lsquo;zbekistonning yangi badiiy muhitini shakillantirish ishlari boshlanmoqda.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Davlat bolalar kutubxonasi</strong><br />\r\n<br />\r\nBino 1909 yilda arxitektor Markevichning loyihasiga asosan qurilgan.&nbsp;Dastlab bu paxtakor Vadyaevning uyi edi va 1910 yildan beri bu erda ommaviy yig&#39;ilishlar o&#39;tkizilar edi.&nbsp;1930-yillarda bu erda &quot;Komsomolning 30 yilligi&quot; kinoteatri ochilgan. Hozirgacha kutubxona joylashgan binoning faqat chap qismi saqlanib qolingan.&nbsp;Unda Markaziy Osiyodagi eng katta bolalar uchun 200 000 dan ortiq kitoblar to&#39;plamlari&nbsp;mavjud.&nbsp;2020 yilda binoni qayta qurish loyihasi taqdim etiladi, uni Ludi Architects byurosi (Rossiya) boshqarishi rejalashtirilgan.</span></span></p>\r\n', '<i class=\"fas fa-ruler-combined\"></i>'),
('Services-for-seo', 'Maydonga qarab binoni loyihalash', 'Maydonga qarab binoni loyihalash', 'Aynan ma`lum bir yer maydoni uchun maxsus bino loyihasi ishlab chiqish. ', 'Aynan ma`lum bir yer maydoni uchun maxsus bino loyihasi ishlab chiqish. ', '<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Davlat san&#39;at muzeyi</strong><br />\r\n<br />\r\nToshkentdagi modernizmning asosiy yodgorliklaridan biri hisoblanib, u 1974 yilda bir guruh yosh me&#39;morlar tomonidan yaratilgan. Bir necha o&#39;n yillar davomida muzey ekspozitsiyasi va infratuzilmasi yangilanmadi, binoning fasad qismini bezashda foydalanilgan eksperimental materiallar dastlab rejalashtirilgan darajada bardoshli bo&#39;lmagan.&nbsp;Bu yil Davlat san&#39;at muzeyini qayta qurish loyihasi taqdim etiladi.&nbsp;Qayta qurish muallifi yapon me&#39;mori, Pritsker mukofoti laureyati Tadao Ando.&nbsp;Muzeyning umumiy maydoni ikki baravarga kengaytirilib, 20000 kvadrat metrni, shu jumladan, 7000 kvadrat metr ko&#39;rgazma maydonini egallaydi.&nbsp;Bu muzey ekspozitsiyasini qayta ko&#39;rib chiqish va muzeyning omborxonasini kengaytirish imkonini beradi, bu erda institutning butun arxivi 100 000 dan ortiq eksponatlar saqlanadi.&nbsp;Binoning atrofida umumiy maydoni - 1,1 gektar maydonda shahar markazida yangi zamonaviy bog&#39; tashkil etiladi.&nbsp;</span></span></p>\r\n', '<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Davlat san&#39;at muzeyi</strong><br />\r\n<br />\r\nToshkentdagi modernizmning asosiy yodgorliklaridan biri hisoblanib, u 1974 yilda bir guruh yosh me&#39;morlar tomonidan yaratilgan. Bir necha o&#39;n yillar davomida muzey ekspozitsiyasi va infratuzilmasi yangilanmadi, binoning fasad qismini bezashda foydalanilgan eksperimental materiallar dastlab rejalashtirilgan darajada bardoshli bo&#39;lmagan.&nbsp;Bu yil Davlat san&#39;at muzeyini qayta qurish loyihasi taqdim etiladi.&nbsp;Qayta qurish muallifi yapon me&#39;mori, Pritsker mukofoti laureyati Tadao Ando.&nbsp;Muzeyning umumiy maydoni ikki baravarga kengaytirilib, 20000 kvadrat metrni, shu jumladan, 7000 kvadrat metr ko&#39;rgazma maydonini egallaydi.&nbsp;Bu muzey ekspozitsiyasini qayta ko&#39;rib chiqish va muzeyning omborxonasini kengaytirish imkonini beradi, bu erda institutning butun arxivi 100 000 dan ortiq eksponatlar saqlanadi.&nbsp;Binoning atrofida umumiy maydoni - 1,1 gektar maydonda shahar markazida yangi zamonaviy bog&#39; tashkil etiladi.&nbsp;</span></span></p>\r\n', '<i class=\"fas fa-drafting-compass\"></i>'),
('Tayyor-chizilgan-loyihalar', 'Tayyor chizilgan loyihalar', 'Tayyor chizilgan loyihalar', 'Ushbu loyihalar orasida bo\'lajak uyingizni toping.', 'Ushbu loyihalar orasida bo\'lajak uyingizni toping.', '<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Shahzoda Romanovning qarorgohi</strong><br />\r\n<br />\r\nShahzoda Nikolay Romanovning qarorgohi 1881 yilda me&#39;morlar Wilhelm Heintzelman va Alexey Benoi tomonidan qurilgan.&nbsp;1918 yildan 1935 yilga qadar bu binoda Davlat san&#39;at muzeyi joylashgan edi.&nbsp;Yaqin vaqtgacha saroy jamoatchilik uchun yopiq edi.&nbsp;2020 yilda Jamg&#39;arma binoni rekonstruktsiya qilish va unda Davlat San&#39;at muzeyining filialini tashkil etish rejalari haqida e&#39;lon qildi.&nbsp;Knyaz qarorgohi binosidagi ekspozitsiyaning asosiy vazifasi o&#39;sha davrdagi vaziyatni tiklashdir.&nbsp;Nikolay Konstantinovich boshchiligidagi guruhi loyiha mualliflari saqlagan arxiv fotosuratlaridan foydalangan holda saroyning ichki bezagini iloji boricha avvalgisiga yaqinroq qilishga harakat qiladi.&nbsp;Ko&#39;rgazmada Davlat san&#39;at muzeyi ekspozitsiyalari, klassik tasviriy san&#39;at asarlari, italiya haykaltaroshlik namunalari va chinni buyumlar, mebellar, shuningdek shahzodaning asl irodasi namoyish etiladi, unga ko&#39;ra u o&#39;z to&#39;plamini Toshkentga topshirishi rejalashtirilgan.&nbsp;</span></span></p>\r\n', '<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Shahzoda Romanovning qarorgohi</strong><br />\r\n<br />\r\nShahzoda Nikolay Romanovning qarorgohi 1881 yilda me&#39;morlar Wilhelm Heintzelman va Alexey Benoi tomonidan qurilgan.&nbsp;1918 yildan 1935 yilga qadar bu binoda Davlat san&#39;at muzeyi joylashgan edi.&nbsp;Yaqin vaqtgacha saroy jamoatchilik uchun yopiq edi.&nbsp;2020 yilda Jamg&#39;arma binoni rekonstruktsiya qilish va unda Davlat San&#39;at muzeyining filialini tashkil etish rejalari haqida e&#39;lon qildi.&nbsp;Knyaz qarorgohi binosidagi ekspozitsiyaning asosiy vazifasi o&#39;sha davrdagi vaziyatni tiklashdir.&nbsp;Nikolay Konstantinovich boshchiligidagi guruhi loyiha mualliflari saqlagan arxiv fotosuratlaridan foydalangan holda saroyning ichki bezagini iloji boricha avvalgisiga yaqinroq qilishga harakat qiladi.&nbsp;Ko&#39;rgazmada Davlat san&#39;at muzeyi ekspozitsiyalari, klassik tasviriy san&#39;at asarlari, italiya haykaltaroshlik namunalari va chinni buyumlar, mebellar, shuningdek shahzodaning asl irodasi namoyish etiladi, unga ko&#39;ra u o&#39;z to&#39;plamini Toshkentga topshirishi rejalashtirilgan.&nbsp;</span></span></p>\r\n', '<i class=\"fas fa-home\"></i>'),
('Tejamkor-qurilish-loyihalari', 'Tejamkor qurilish', 'Tejamkor qurilish', 'Qurilishni sifatli va chidamli loyihalash bilan birga mahsulotlardan tejamkor foydalanish', 'Qurilishni sifatli va chidamli loyihalash bilan birga mahsulotlardan tejamkor foydalanish', '<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\"><strong>Istiqlol ko&#39;chasidagi Madaniyat uyi</strong><br />\r\n<br />\r\n&quot;Inturist&quot; axborot-madaniyat markazining binosi 1986 yilda qurilgan.&nbsp;Mualliflar loyihaga keng kinoteatr va ichki hovli qurishgan.&nbsp;Inshootning umumiy maydoni 10,338 metrni tashkil etadi. Bugungi kunga qadar bino zarur darajada ta&#39;mirlanmagan.&nbsp;2020 yilning kuzida Toshkentda binoning rekonstruksiya qilish loyihasi taqdim etiladi.&nbsp;U yerda O&#39;zbekiston Respublikasi Madaniyat vazirligi huzuridagi Madaniyatni rivojlantirish jamg&#39;armasi, restavratsiya markazi va frantsuz markazi joylashishi rejalashtirilgan.&nbsp;Rekonstruksiya muallifi Greys byurosi asoschisi Yekaterina Golovatyukdir.</span></span></p>\r\n', '<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\"><strong>Istiqlol ko&#39;chasidagi Madaniyat uyi</strong><br />\r\n<br />\r\n&quot;Inturist&quot; axborot-madaniyat markazining binosi 1986 yilda qurilgan.&nbsp;Mualliflar loyihaga keng kinoteatr va ichki hovli qurishgan.&nbsp;Inshootning umumiy maydoni 10,338 metrni tashkil etadi. Bugungi kunga qadar bino zarur darajada ta&#39;mirlanmagan.&nbsp;2020 yilning kuzida Toshkentda binoning rekonstruksiya qilish loyihasi taqdim etiladi.&nbsp;U yerda O&#39;zbekiston Respublikasi Madaniyat vazirligi huzuridagi Madaniyatni rivojlantirish jamg&#39;armasi, restavratsiya markazi va frantsuz markazi joylashishi rejalashtirilgan.&nbsp;Rekonstruksiya muallifi Greys byurosi asoschisi Yekaterina Golovatyukdir.</span></span></p>\r\n', '<i class=\"fas fa-wallet\"></i>');

-- --------------------------------------------------------

--
-- Структура таблицы `slider`
--

CREATE TABLE `slider` (
  `id` varchar(50) NOT NULL,
  `name_uz` varchar(500) NOT NULL,
  `name_ru` varchar(500) NOT NULL,
  `desc_uz` varchar(500) NOT NULL,
  `desc_ru` varchar(500) NOT NULL,
  `fulltext_uz` text NOT NULL,
  `fulltext_ru` text NOT NULL,
  `img` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `slider`
--

INSERT INTO `slider` (`id`, `name_uz`, `name_ru`, `desc_uz`, `desc_ru`, `fulltext_uz`, `fulltext_ru`, `img`) VALUES
('2', 'This is head', 'This is head', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum tempora nisi eius pariatur sint asperiores nam id perferendis, error rem iusto quas hic repellat ea laborum ratione nulla quae quisquam?', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum tempora nisi eius pariatur sint asperiores nam id perferendis, error rem iusto quas hic repellat ea laborum ratione nulla quae quisquam?', '<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">0.1 This Indian Standard was adopted by the Indian Standards Institution on 11 February 1980, after the draft finalized by the Leather Sectional Committee had been approved by the Chemical Division Council. </span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">0.2 Hides and skins in India may be obtained from various sources, such as, </span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">municipal slaughter houses; </span></span></li>\r\n	<li><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">private butchers; </span></span></li>\r\n	<li><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">flaying and carcass utilization centres; </span></span></li>\r\n	<li><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">pinjrupoles;</span></span></li>\r\n	<li><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">village chamars. </span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Most of the fallen hides are obtained from the last three sources. </span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">0.3 Raw hides and skins being natural products vary considerably in quality depending on the breed of the animal and on the climatic conditions prevailng in different parts of the country. Most of the cattle hides in India are obtained from fallen animals and it is well recognized that fallen hides are generally inferior in quality than slaughtered hides. Goat and sheep skins are generally obtained from slaughtered animals but many of them are procured from the country side also. </span></span></p>\r\n', '<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">0.1 This Indian Standard was adopted by the Indian Standards Institution on 11 February 1980, after the draft finalized by the Leather Sectional Committee had been approved by the Chemical Division Council. </span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">0.2 Hides and skins in India may be obtained from various sources, such as, </span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">municipal slaughter houses; </span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">private butchers; </span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">flaying and carcass utilization centres; </span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">pinjrupoles;</span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">village chamars. </span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Most of the fallen hides are obtained from the last three sources. </span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">0.3 Raw hides and skins being natural products vary considerably in quality depending on the breed of the animal and on the climatic conditions prevailng in different parts of the country. Most of the cattle hides in India are obtained from fallen animals and it is well recognized that fallen hides are generally inferior in quality than slaughtered hides. Goat and sheep skins are generally obtained from slaughtered animals but many of them are procured from the country side also. </span></span></p>\r\n', '/uploads/imgs/9_4_40_8_1_2021_2_default-4.jpg'),
('3', 'This is head', 'This is head', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum tempora nisi eius pariatur sint asperiores nam id perferendis, error rem iusto quas hic repellat ea laborum ratione nulla quae quisquam?', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum tempora nisi eius pariatur sint asperiores nam id perferendis, error rem iusto quas hic repellat ea laborum ratione nulla quae quisquam?', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.1 This Indian Standard was adopted by the Indian Standards Institution on 11 February 1980, after the draft finalized by the Leather Sectional Committee had been approved by the Chemical Division Council. </span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.2 Hides and skins in India may be obtained from various sources, such as, </span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">municipal slaughter houses; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">private butchers; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">flaying and carcass utilization centres; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">pinjrupoles;</span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">village chamars. </span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Most of the fallen hides are obtained from the last three sources. </span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.3 Raw hides and skins being natural products vary considerably in quality depending on the breed of the animal and on the climatic conditions prevailng in different parts of the country. Most of the cattle hides in India are obtained from fallen animals and it is well recognized that fallen hides are generally inferior in quality than slaughtered hides. Goat and sheep skins are generally obtained from slaughtered animals but many of them are procured from the country side also. </span></span></p>\r\n', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.1 This Indian Standard was adopted by the Indian Standards Institution on 11 February 1980, after the draft finalized by the Leather Sectional Committee had been approved by the Chemical Division Council. </span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.2 Hides and skins in India may be obtained from various sources, such as, </span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">municipal slaughter houses; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">private butchers; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">flaying and carcass utilization centres; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">pinjrupoles;</span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">village chamars. </span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Most of the fallen hides are obtained from the last three sources. </span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.3 Raw hides and skins being natural products vary considerably in quality depending on the breed of the animal and on the climatic conditions prevailng in different parts of the country. Most of the cattle hides in India are obtained from fallen animals and it is well recognized that fallen hides are generally inferior in quality than slaughtered hides. Goat and sheep skins are generally obtained from slaughtered animals but many of them are procured from the country side also. </span></span></p>\r\n', '/uploads/imgs/9_5_49_8_1_2021_3_default-5.jpg'),
('for-seo-optimization', 'This is head', 'This is head', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum tempora nisi eius pariatur sint asperiores nam id perferendis, error rem iusto quas hic repellat ea laborum ratione nulla quae quisquam?', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum tempora nisi eius pariatur sint asperiores nam id perferendis, error rem iusto quas hic repellat ea laborum ratione nulla quae quisquam?', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.1 This Indian Standard was adopted by the Indian Standards Institution on 11 February 1980, after the draft finalized by the Leather Sectional Committee had been approved by the Chemical Division Council. </span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.2 Hides and skins in India may be obtained from various sources, such as, </span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">municipal slaughter houses; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">private butchers; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">flaying and carcass utilization centres; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">pinjrupoles;</span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">village chamars. </span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Most of the fallen hides are obtained from the last three sources. </span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.3 Raw hides and skins being natural products vary considerably in quality depending on the breed of the animal and on the climatic conditions prevailng in different parts of the country. Most of the cattle hides in India are obtained from fallen animals and it is well recognized that fallen hides are generally inferior in quality than slaughtered hides. Goat and sheep skins are generally obtained from slaughtered animals but many of them are procured from the country side also. </span></span></p>\r\n', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.1 This Indian Standard was adopted by the Indian Standards Institution on 11 February 1980, after the draft finalized by the Leather Sectional Committee had been approved by the Chemical Division Council. </span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.2 Hides and skins in India may be obtained from various sources, such as, </span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">municipal slaughter houses; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">private butchers; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">flaying and carcass utilization centres; </span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">pinjrupoles;</span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">village chamars. </span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Most of the fallen hides are obtained from the last three sources. </span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">0.3 Raw hides and skins being natural products vary considerably in quality depending on the breed of the animal and on the climatic conditions prevailng in different parts of the country. Most of the cattle hides in India are obtained from fallen animals and it is well recognized that fallen hides are generally inferior in quality than slaughtered hides. Goat and sheep skins are generally obtained from slaughtered animals but many of them are procured from the country side also. </span></span></p>\r\n', '/uploads/imgs/9_3_37_8_1_2021_1_default-3.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `socials`
--

CREATE TABLE `socials` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `link` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `socials`
--

INSERT INTO `socials` (`id`, `icon`, `link`) VALUES
(1, '<i class=\"fab fa-facebook\"></i>', 'https://www.facebook.com/jasurbek.lazizjonov.52'),
(2, '<i class=\"fab fa-telegram\"></i>', 'https://t.me/lazizjonov'),
(3, '<i class=\"fab fa-linkedin-in\"></i>', 'https://www.linkedin.com/in/jasurbek-lazizjonov-774b53189/');

-- --------------------------------------------------------

--
-- Структура таблицы `tel`
--

CREATE TABLE `tel` (
  `id` int(11) NOT NULL,
  `tel` int(11) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tel`
--

INSERT INTO `tel` (`id`, `tel`, `date`, `name`) VALUES
(5, 911881880, '2021-02-09 17:13:56', 'Шахноза'),
(6, 98745621, '2021-02-10 19:23:23', 'Jasurbek Lazizjonov'),
(7, 98745621, '2021-02-10 19:24:34', 'Jasurbek Lazizjonov'),
(8, 44547545, '2021-02-10 19:30:22', 'Jasurbek Lazizjonov'),
(9, 44547545, '2021-02-10 19:31:24', 'Jasurbek Lazizjonov');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `tel`
--
ALTER TABLE `tel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `tel`
--
ALTER TABLE `tel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
