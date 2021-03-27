-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 27, 2021 at 11:22 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `pascal`
--

-- --------------------------------------------------------

--
-- Table structure for table `moneyCategory`
--

CREATE TABLE `moneyCategory` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moneyCategory`
--

INSERT INTO `moneyCategory` (`idCategory`, `name`, `type`, `timestamp`) VALUES
(1, 'Achat produit ', 'outlet', 1616097565);

-- --------------------------------------------------------

--
-- Table structure for table `moneyTransactions`
--

CREATE TABLE `moneyTransactions` (
  `idTransaction` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `nameOfCategory` varchar(50) NOT NULL,
  `nameOfUser` varchar(50) NOT NULL,
  `amountAfter` double NOT NULL,
  `enter` double DEFAULT NULL,
  `outlet` double DEFAULT NULL,
  `description` varchar(300) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `idProduct` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `price` double NOT NULL,
  `inStock` double NOT NULL,
  `unit` varchar(75) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productsCategory`
--

CREATE TABLE `productsCategory` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productTransactions`
--

CREATE TABLE `productTransactions` (
  `idTransaction` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `nameOfCategory` varchar(50) NOT NULL,
  `nameOfUser` varchar(50) NOT NULL,
  `nameOfProduct` varchar(100) NOT NULL,
  `stockAfter` double NOT NULL,
  `enter` double DEFAULT NULL,
  `outlet` double DEFAULT NULL,
  `description` varchar(300) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moneyCategory`
--
ALTER TABLE `moneyCategory`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indexes for table `moneyTransactions`
--
ALTER TABLE `moneyTransactions`
  ADD PRIMARY KEY (`idTransaction`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idProduct`);

--
-- Indexes for table `productsCategory`
--
ALTER TABLE `productsCategory`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indexes for table `productTransactions`
--
ALTER TABLE `productTransactions`
  ADD PRIMARY KEY (`idTransaction`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moneyCategory`
--
ALTER TABLE `moneyCategory`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `moneyTransactions`
--
ALTER TABLE `moneyTransactions`
  MODIFY `idTransaction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productsCategory`
--
ALTER TABLE `productsCategory`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productTransactions`
--
ALTER TABLE `productTransactions`
  MODIFY `idTransaction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;
