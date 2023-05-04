-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Май 03 2023 г., 14:36
-- Версия сервера: 8.0.32
-- Версия PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `fit_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `applications`
--

CREATE TABLE `applications` (
  `id` int NOT NULL,
  `id_product_type` int NOT NULL,
  `id_purpose` int NOT NULL,
  `id_passport` int NOT NULL,
  `id_client_data` int NOT NULL,
  `id_job` int NOT NULL,
  `id_loan_rate` int NOT NULL,
  `loan_term` int NOT NULL,
  `sum` float NOT NULL,
  `total_sum` float NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `applications`
--

INSERT INTO `applications` (`id`, `id_product_type`, `id_purpose`, `id_passport`, `id_client_data`, `id_job`, `id_loan_rate`, `loan_term`, `sum`, `total_sum`, `date`) VALUES
(2, 1, 1, 1, 1, 1, 1, 36, 100000, 140000, '2023-05-01'),
(3, 2, 1, 1, 1, 1, 1, 12, 50000, 100000, '2023-05-02'),
(4, 1, 1, 1, 1, 1, 1, 22, 100000, 10000000, '2023-05-02');

-- --------------------------------------------------------

--
-- Структура таблицы `application_services`
--

CREATE TABLE `application_services` (
  `id` int NOT NULL,
  `id_application` int NOT NULL,
  `id_service` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `clients_data`
--

CREATE TABLE `clients_data` (
  `id` int NOT NULL,
  `phone` char(20) NOT NULL,
  `add_phone` char(20) NOT NULL,
  `email` varchar(320) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `clients_data`
--

INSERT INTO `clients_data` (`id`, `phone`, `add_phone`, `email`) VALUES
(1, '77777777777', '77777777777', 'aa@aa.aa');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` int NOT NULL,
  `id_region` int NOT NULL,
  `name` char(100) NOT NULL,
  `inn` char(10) NOT NULL,
  `position` char(100) NOT NULL,
  `salary` float NOT NULL,
  `date_of_employment` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jobs`
--

INSERT INTO `jobs` (`id`, `id_region`, `name`, `inn`, `position`, `salary`, `date_of_employment`) VALUES
(1, 1, 'ООО Рога и копыта', '1234567890', 'Программный инженер', 50000, '2023-05-10');

-- --------------------------------------------------------

--
-- Структура таблицы `loan_rates`
--

CREATE TABLE `loan_rates` (
  `id` int NOT NULL,
  `rate` float NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `loan_rates`
--

INSERT INTO `loan_rates` (`id`, `rate`, `date`) VALUES
(1, 7.8, '2023-05-01');

-- --------------------------------------------------------

--
-- Структура таблицы `passports`
--

CREATE TABLE `passports` (
  `id` int NOT NULL,
  `name` char(100) NOT NULL,
  `surname` char(100) NOT NULL,
  `patronymic` char(100) NOT NULL,
  `series` char(4) NOT NULL,
  `number` char(6) NOT NULL,
  `issue_date` date NOT NULL,
  `departament_code` char(7) NOT NULL,
  `issued_by` char(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `place_of_birth` char(255) NOT NULL,
  `id_region` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `passports`
--

INSERT INTO `passports` (`id`, `name`, `surname`, `patronymic`, `series`, `number`, `issue_date`, `departament_code`, `issued_by`, `date_of_birth`, `place_of_birth`, `id_region`) VALUES
(1, 'Даниил', 'Мостовой', 'Витальевич', '1234', '123456', '1977-05-09', '123-456', 'МВД', '2023-05-11', 'Новосибирск', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_types`
--

CREATE TABLE `product_types` (
  `id` int NOT NULL,
  `name` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `product_types`
--

INSERT INTO `product_types` (`id`, `name`) VALUES
(1, 'Кредит наличными'),
(2, 'Кредит безналичными');

-- --------------------------------------------------------

--
-- Структура таблицы `purposes`
--

CREATE TABLE `purposes` (
  `id` int NOT NULL,
  `name` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `purposes`
--

INSERT INTO `purposes` (`id`, `name`) VALUES
(1, 'Покупка товаров / услуг');

-- --------------------------------------------------------

--
-- Структура таблицы `regions`
--

CREATE TABLE `regions` (
  `id` int NOT NULL,
  `name` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `regions`
--

INSERT INTO `regions` (`id`, `name`) VALUES
(1, 'Новосибирская область');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `name` char(100) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `price`) VALUES
(1, 'Страхование жизни', 25000),
(2, 'Юридическая помощь', 15000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product_type` (`id_product_type`),
  ADD KEY `id_purpose` (`id_purpose`),
  ADD KEY `id_passport` (`id_passport`),
  ADD KEY `id_client_data` (`id_client_data`),
  ADD KEY `id_loan_rate` (`id_loan_rate`),
  ADD KEY `id_job` (`id_job`);

--
-- Индексы таблицы `application_services`
--
ALTER TABLE `application_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_application` (`id_application`),
  ADD KEY `id_service` (`id_service`);

--
-- Индексы таблицы `clients_data`
--
ALTER TABLE `clients_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_region` (`id_region`);

--
-- Индексы таблицы `loan_rates`
--
ALTER TABLE `loan_rates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `passports`
--
ALTER TABLE `passports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_region` (`id_region`);

--
-- Индексы таблицы `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `purposes`
--
ALTER TABLE `purposes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `application_services`
--
ALTER TABLE `application_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `clients_data`
--
ALTER TABLE `clients_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `loan_rates`
--
ALTER TABLE `loan_rates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `passports`
--
ALTER TABLE `passports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `purposes`
--
ALTER TABLE `purposes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`id_product_type`) REFERENCES `product_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`id_purpose`) REFERENCES `purposes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`id_passport`) REFERENCES `passports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_4` FOREIGN KEY (`id_client_data`) REFERENCES `clients_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_5` FOREIGN KEY (`id_loan_rate`) REFERENCES `loan_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_6` FOREIGN KEY (`id_job`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `application_services`
--
ALTER TABLE `application_services`
  ADD CONSTRAINT `application_services_ibfk_1` FOREIGN KEY (`id_application`) REFERENCES `applications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_services_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `passports`
--
ALTER TABLE `passports`
  ADD CONSTRAINT `passports_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
