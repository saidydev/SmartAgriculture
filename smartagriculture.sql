-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2025 at 09:04 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartagriculture`
--

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL DEFAULT 1,
  `temp_threshold` decimal(5,2) NOT NULL DEFAULT 35.00,
  `humidity_threshold` int(11) NOT NULL DEFAULT 80,
  `wind_threshold` decimal(5,2) NOT NULL DEFAULT 10.00,
  `dew_threshold` decimal(5,2) NOT NULL DEFAULT 20.00,
  `refresh_interval_secs` int(11) NOT NULL DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `temp_threshold`, `humidity_threshold`, `wind_threshold`, `dew_threshold`, `refresh_interval_secs`) VALUES
(1, '65.00', 66, '9.60', '20.10', 5);

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE `dataset` (
  `name` varchar(11) DEFAULT NULL,
  `datetime` varchar(10) DEFAULT NULL,
  `tempmax` decimal(3,1) DEFAULT NULL,
  `tempmin` decimal(3,1) DEFAULT NULL,
  `temp` decimal(3,1) DEFAULT NULL,
  `feelslikemax` decimal(3,1) DEFAULT NULL,
  `feelslikemin` decimal(3,1) DEFAULT NULL,
  `feelslike` decimal(3,1) DEFAULT NULL,
  `dew` decimal(3,1) DEFAULT NULL,
  `humidity` decimal(3,1) DEFAULT NULL,
  `precip` decimal(4,3) DEFAULT NULL,
  `precipprob` decimal(3,1) DEFAULT NULL,
  `precipcover` decimal(4,2) DEFAULT NULL,
  `preciptype` varchar(4) DEFAULT NULL,
  `snow` int(1) DEFAULT NULL,
  `snowdepth` int(1) DEFAULT NULL,
  `windgust` decimal(3,1) DEFAULT NULL,
  `windspeed` decimal(2,1) DEFAULT NULL,
  `winddir` decimal(4,1) DEFAULT NULL,
  `sealevelpressure` decimal(5,1) DEFAULT NULL,
  `cloudcover` decimal(3,1) DEFAULT NULL,
  `visibility` decimal(3,1) DEFAULT NULL,
  `solarradiation` decimal(4,1) DEFAULT NULL,
  `solarenergy` decimal(3,1) DEFAULT NULL,
  `uvindex` int(1) DEFAULT NULL,
  `severerisk` int(2) DEFAULT NULL,
  `sunrise` varchar(19) DEFAULT NULL,
  `sunset` varchar(19) DEFAULT NULL,
  `moonphase` decimal(3,2) DEFAULT NULL,
  `conditions` varchar(22) DEFAULT NULL,
  `description` varchar(72) DEFAULT NULL,
  `icon` varchar(17) DEFAULT NULL,
  `stations` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`name`, `datetime`, `tempmax`, `tempmin`, `temp`, `feelslikemax`, `feelslikemin`, `feelslike`, `dew`, `humidity`, `precip`, `precipprob`, `precipcover`, `preciptype`, `snow`, `snowdepth`, `windgust`, `windspeed`, `winddir`, `sealevelpressure`, `cloudcover`, `visibility`, `solarradiation`, `solarenergy`, `uvindex`, `severerisk`, `sunrise`, `sunset`, `moonphase`, `conditions`, `description`, `icon`, `stations`) VALUES
('kilimanjaro', '2025-06-22', '69.2', '57.3', '63.4', '69.2', '57.3', '63.4', '58.9', '85.5', '0.024', '99.9', '20.83', 'rain', 0, 0, '9.6', '7.1', '88.5', '1019.7', '64.9', '9.7', '144.2', '12.5', 5, 10, '2025-06-22T06:34:56', '2025-06-22T18:30:36', '0.89', 'Rain, Partially cloudy', 'Partly cloudy throughout the day with rain in the morning and afternoon.', 'rain', 'HTKJ,remote,HTAR'),
('kilimanjaro', '2025-06-23', '62.1', '56.2', '59.4', '62.1', '56.2', '59.4', '55.9', '88.6', '0.044', '0.0', '41.67', 'rain', 0, 0, '9.4', '5.6', '129.9', '1019.8', '78.7', '6.9', '58.3', '5.0', 2, 10, '2025-06-23T06:35:09', '2025-06-23T18:30:49', '0.93', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-06-24', '69.7', '53.7', '61.3', '69.7', '53.7', '61.3', '53.0', '75.5', '0.008', '9.7', '8.33', 'rain', 0, 0, '14.1', '7.8', '111.5', '1019.5', '33.9', '13.2', '217.5', '18.7', 8, 10, '2025-06-24T06:35:22', '2025-06-24T18:31:03', '0.96', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-06-25', '68.1', '55.8', '61.6', '68.1', '55.8', '61.6', '55.5', '80.9', '0.060', '38.7', '45.83', 'rain', 0, 0, '14.3', '7.2', '128.0', '1019.1', '57.5', '10.1', '161.4', '13.8', 6, 10, '2025-06-25T06:35:34', '2025-06-25T18:31:16', '0.00', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-06-26', '68.4', '58.0', '61.8', '68.4', '58.0', '61.8', '56.7', '83.8', '0.056', '19.4', '41.67', 'rain', 0, 0, '5.8', '5.4', '136.8', '1019.2', '85.5', '9.8', '112.3', '9.6', 4, 10, '2025-06-26T06:35:46', '2025-06-26T18:31:29', '0.03', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-06-27', '68.4', '57.6', '61.8', '68.4', '57.6', '61.8', '56.5', '83.0', '0.024', '0.0', '20.83', 'rain', 0, 0, '5.4', '6.0', '121.4', '1019.2', '88.7', '11.6', '146.5', '12.6', 5, 10, '2025-06-27T06:35:58', '2025-06-27T18:31:42', '0.06', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-06-28', '67.4', '57.7', '61.5', '67.4', '57.7', '61.5', '55.3', '80.8', '0.028', '6.5', '16.67', 'rain', 0, 0, '12.5', '6.7', '124.4', '1018.9', '61.0', '10.1', '148.4', '12.9', 5, 10, '2025-06-28T06:36:10', '2025-06-28T18:31:55', '0.10', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-06-29', '69.0', '55.1', '60.7', '69.0', '55.1', '60.7', '49.4', '68.8', '0.004', '3.2', '4.17', 'rain', 0, 0, '10.7', '8.1', '122.3', '1020.3', '75.3', '11.8', '260.0', '22.7', 8, 10, '2025-06-29T06:36:21', '2025-06-29T18:32:08', '0.13', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-06-30', '63.8', '54.8', '59.4', '63.8', '54.8', '59.4', '52.3', '77.8', '0.016', '16.1', '12.50', 'rain', 0, 0, '11.0', '6.3', '105.4', '1021.0', '83.4', '11.1', '102.3', '8.9', 3, 10, '2025-06-30T06:36:32', '2025-06-30T18:32:21', '0.16', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-07-01', '62.0', '55.7', '58.8', '62.0', '55.7', '58.8', '53.6', '82.9', '0.052', '6.5', '20.83', 'rain', 0, 0, '12.5', '6.9', '105.9', '1021.9', '81.3', '7.9', '94.4', '7.8', 3, 10, '2025-07-01T06:36:43', '2025-07-01T18:32:34', '0.19', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-07-02', '66.8', '53.3', '59.9', '66.8', '53.3', '59.9', '51.3', '74.2', '0.004', '3.2', '4.17', 'rain', 0, 0, '10.5', '9.2', '122.7', '1021.8', '48.0', '14.8', '231.4', '20.3', 7, 10, '2025-07-02T06:36:53', '2025-07-02T18:32:46', '0.25', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-07-03', '67.9', '53.9', '59.8', '67.9', '53.9', '59.8', '50.3', '71.9', '0.004', '3.2', '4.17', 'rain', 0, 0, '10.5', '7.8', '117.7', '1021.7', '59.1', '13.1', '204.5', '17.7', 7, 10, '2025-07-03T06:37:03', '2025-07-03T18:32:58', '0.26', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-07-04', '67.9', '55.5', '60.4', '67.9', '55.5', '60.4', '53.7', '79.5', '0.040', '3.2', '16.67', 'rain', 0, 0, '9.8', '5.4', '121.2', '1021.3', '67.0', '9.8', '137.6', '12.2', 5, 10, '2025-07-04T06:37:12', '2025-07-04T18:33:10', '0.29', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-07-05', '67.7', '57.6', '61.0', '67.7', '57.6', '61.0', '54.3', '79.6', '0.044', '3.2', '25.00', 'rain', 0, 0, '10.1', '5.6', '135.1', '1021.3', '77.4', '8.2', '128.4', '11.3', 5, 10, '2025-07-05T06:37:22', '2025-07-05T18:33:22', '0.32', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', ''),
('kilimanjaro', '2025-07-06', '66.8', '56.2', '60.0', '66.8', '56.2', '60.0', '53.6', '80.1', '0.020', '12.9', '16.67', 'rain', 0, 0, '5.8', '4.5', '122.8', '1020.8', '69.7', '8.2', '130.6', '11.4', 5, 10, '2025-07-06T06:37:30', '2025-07-06T18:33:34', '0.35', 'Partially cloudy', 'Partly cloudy throughout the day.', 'partly-cloudy-day', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
