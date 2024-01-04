-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 04 jan. 2024 à 12:42
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `corporus`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `idClient` int(11) NOT NULL,
  `nameOfUser` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `phoneNumber` varchar(500) NOT NULL,
  `birthday` varchar(500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`idClient`, `nameOfUser`, `name`, `email`, `phoneNumber`, `birthday`, `timestamp`) VALUES
(3, 'Pascal', 'Test', 'jfqlkjdsfkqj', 'lkfjqlksjdfkl', 'kfljslkjfd', 1666106656),
(4, 'Godwin Burume', 'Godwin', 'Mimoza', '0815461960', '24 Février', 1666774292),
(5, 'Godwin Burume', 'Glody Mabeka', 'glodymabeka@exadgroup.org', '0819941667', '9 septembre 1992', 1667480684);

-- --------------------------------------------------------

--
-- Structure de la table `moneyCategory`
--

CREATE TABLE `moneyCategory` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `useForStockIncrease` tinyint(1) NOT NULL DEFAULT '0',
  `useForStockDecrease` tinyint(1) DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `moneyCategory`
--

INSERT INTO `moneyCategory` (`idCategory`, `name`, `type`, `useForStockIncrease`, `useForStockDecrease`, `timestamp`) VALUES
(1, 'Vente cliente', 'enter', 0, 0, 1665906124),
(2, 'Achat produit', 'outlet', 0, 0, 1665906130),
(3, 'Paiement facture', 'outlet', 0, 0, 1666774514),
(4, 'Paiement salaire', 'outlet', 0, 0, 1667481243);

-- --------------------------------------------------------

--
-- Structure de la table `moneyTransactions`
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

--
-- Déchargement des données de la table `moneyTransactions`
--

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `idProduct` int(11) NOT NULL,
  `idType` int(11) DEFAULT NULL,
  `name` varchar(75) NOT NULL,
  `lotId` varchar(200) DEFAULT NULL,
  `nameOfType` varchar(500) DEFAULT NULL,
  `manufacturer` varchar(500) DEFAULT NULL,
  `country` varchar(500) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `inStock` double DEFAULT NULL,
  `unit` varchar(75) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `expirationTimestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`idProduct`, `idType`, `name`, `lotId`, `nameOfType`, `manufacturer`, `country`, `price`, `inStock`, `unit`, `timestamp`, `expirationTimestamp`) VALUES
(1, 1, 'Quinine HCl/Sulf, 300mg base, Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 100', 1704187969, NULL),
(2, 1, 'Sulfadoxine + Pyrimethamine, 500+25mg, Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(3, 1, 'Artemether+Luméfantrine, 20mg+120mg, 6Tab dispers., 2-11 mois', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 30', 1704187969, NULL),
(4, 1, 'Artemether+Luméfantrine, 20mg+120mg, 12 Tab dispers., 1-5 ans', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 30', 1704187969, NULL),
(5, 1, 'Artemether+Luméfantrine, 20mg+120mg, 18 Tab, 6-13 ans', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 30', 1704187969, NULL),
(6, 1, 'Artemether+Luméfantrine, 20mg+120mg, 24 Tab, Adulte', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 30', 1704187969, NULL),
(7, 1, 'Levonorgestrel (Pillule d`urgence) 1.5 mg', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1', 1704187969, NULL),
(8, 1, 'Amoxycilline, 250mg, Disp. Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 10', 1704187969, NULL),
(9, 1, 'Fer sulfate+Acide Folique, 200mg+0,25mg, Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 100', 1704187969, NULL),
(10, 1, 'SRO+Zinc Sulfate (2 sachets+10 cp), Co-packaged, Kit', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 2', 1704187969, NULL),
(11, 1, 'Misoprostol 200 µg', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 4', 1704187969, NULL),
(12, 1, 'CEFIXIME, 200 mg, comp.', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 10', 1704187969, NULL),
(13, 1, 'Nystatine, 100.000 UI, Tab vaginal', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 14', 1704187969, NULL),
(14, 1, 'Nifedipine, 10mg, Caps, 1000, Vr', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(15, 1, 'Enalapril, 2.5mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(16, 1, 'Glibenclamide, 5mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(17, 1, 'Ciprofloxacine Chlorhydrate, 500mg, Tab, Blister', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 100', 1704187969, NULL),
(18, 1, 'Cotrimoxazole, 480mg, Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(19, 1, 'AMOXICILLINE 500 mg/ ac. CLAVULANIQUE 62,5 mg, comp.', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 16', 1704187969, NULL),
(20, 1, 'Diazepam, 5mg, Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(21, 1, 'Erythromycine, 250mg, Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(22, 1, 'Metronidazole, 250mg, Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(23, 1, 'Salbutamol sulfate, 4mg, Tab', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(24, 1, 'Acide folique, 5mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(25, 1, 'Aluminium Hydroxyde, 300mg+ Trisilicate de Mg 250mg Tab, 1000', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(26, 1, 'Amoxycilline, 500mg, Caps, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(27, 1, 'Azythromycine anhydre, 250mg, Tab, 6, plaquettes', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 6', 1704187969, NULL),
(28, 1, 'Chlorpheniramine Maleate, 4mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(29, 1, 'Omeprazol 20 mg, cap', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 28', 1704187969, NULL),
(30, 1, 'Cotrimoxazole, 240mg/5ml, 100ml, flacon', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1', 1704187969, NULL),
(31, 1, 'Diclofenac, 50mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(32, 1, 'Doxycycline, 100mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(33, 1, 'Erythromycine, 125mg/5ml, 100ml, flacon, Unité, ', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1', 1704187969, NULL),
(34, 1, 'Erythromycine, 500mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(35, 1, 'Furosemide, 40mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(36, 1, 'Griseofulvine, 125mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(37, 1, 'Hyoscine bulybromide, 10mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(38, 1, 'Ibuprofen, 400mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(39, 1, 'Ibuprofen, 200mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(40, 1, 'Paracetamol, 500mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(41, 1, 'Phenoxymethylpenicillin (Peni V) , 250mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(42, 1, 'Prednisolone, 5mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(43, 1, 'Vitamine B complexe, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(44, 1, 'Papaverine, 40mg, comp', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(45, 1, 'PHENOBARBITAL, 50 mg, comp.', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 30', 1704187969, NULL),
(46, 1, 'METHYLERGOMETRINE maleate, 0,5mg, comp', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(47, 1, 'Griseofulvine, 500mg, Tab, 1000, Vrac', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(48, 1, 'PARACETAMOL (acétaminophène), 120mg/5ml,susp.orale,100ml fl.', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1', 1704187969, NULL),
(49, 1, 'PARACETAMOL (acétaminophène), 100 mg, comp.', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(50, 1, 'AMOXICILLINE, 125mg/5ml, poudre susp. orale, 100 ml, fl', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1', 1704187969, NULL),
(51, 1, 'TINIDAZOLE, 500 mg, comp.', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 500', 1704187969, NULL),
(52, 1, 'AZITHROMYCINE, 500 mg, comp', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 3', 1704187969, NULL),
(53, 1, 'NYSTATINE, 100.000 UI/ml, susp.orale + compte-gouttes gradué', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1', 1704187969, NULL),
(54, 1, 'NySTATINE, 500.000 UI, comprimé', NULL, 'Medicaments Oraux', NULL, NULL, NULL, 0, 'Boite de 1000', 1704187969, NULL),
(55, 10, 'Poche de transfusion 250 ml', NULL, 'Consommables medicaux', NULL, NULL, 8.5, 0, '1 Poche - 5', 1704187969, NULL),
(56, 10, 'Fil de Sut.,PGA,tressé,75cm, déc.2(3/0),aig.1/2c,R,eff,30mm', NULL, 'Consommables medicaux', NULL, NULL, 12.5, 0, '1 Pièce - 12', 1704187969, NULL),
(57, 10, 'Abaisse langue en bois, pièce, 100', NULL, 'Consommables medicaux', NULL, NULL, 2.5, 0, '1Pièce - 100', 1704187969, NULL),
(58, 10, 'Bande de gaze (Cambric), avec lisières, 5cm*5m', NULL, 'Consommables medicaux', NULL, NULL, 1, 0, '1Pièce - 12', 1704187969, NULL),
(59, 10, 'Bande de gaze, 7,5cmx5m, 12', NULL, 'Consommables medicaux', NULL, NULL, 2.5, 0, '1Pièce - 12', 1704187969, NULL),
(60, 10, 'Bande élastique, 8cmx4m, Unité, 12', NULL, 'Consommables medicaux', NULL, NULL, 8.5, 0, '1Pièce - 12', 1704187969, NULL),
(61, 10, 'Catheter court IV avec site d\'injection, u.u., 18G, Unité, 100', NULL, 'Consommables medicaux', NULL, NULL, 14, 0, '1Pièce - 100', 1704187969, NULL),
(62, 10, 'Catheter court IV avec site d\'injection, u.u., 22G, Unité, 100', NULL, 'Consommables medicaux', NULL, NULL, 14, 0, '1Pièce - 100', 1704187969, NULL),
(63, 10, 'Catheter court IV avec site d\'injection, u.u., 24G, Unité, 100', NULL, 'Consommables medicaux', NULL, NULL, 14, 0, '1Pièce - 100', 1704187969, NULL),
(64, 10, 'Catheter court IV avec site d\'injection, u.u., 20G, Unité, 100', NULL, 'Consommables medicaux', NULL, NULL, 14, 0, '1Pièce - 100', 1704187969, NULL),
(65, 10, 'Compresse de gaze, 10x10cm, 12 plis, non stérile, 100', NULL, 'Consommables medicaux', NULL, NULL, 7, 0, '1Pièce - 100', 1704187969, NULL),
(66, 10, 'Compresse de gaze, 10x10cm, 12 plis, stérile, 100/45', NULL, 'Consommables medicaux', NULL, NULL, 7, 0, '1Pièce - 100', 1704187969, NULL),
(67, 10, 'Cordon ombilical, rouleau, coton, 100 m, Unité, 12', NULL, 'Consommables medicaux', NULL, NULL, 72, 0, '1Pièce - 12', 1704187969, NULL),
(68, 10, 'Coton hydrophile, rouleau, 500g, Unité', NULL, 'Consommables medicaux', NULL, NULL, 3.3, 0, '1Pièce - 1', 1704187969, NULL),
(69, 10, 'Gants chirurgicaux, latex, u.u.,stériles,  7½, Paire', NULL, 'Consommables medicaux', NULL, NULL, 7, 0, '1Pièce - 24', 1704187969, NULL),
(70, 10, 'Gants d\'examen latex non stériles, u.u., Medium, 100', NULL, 'Consommables medicaux', NULL, NULL, 6.5, 0, '1Pièce - 100', 1704187969, NULL),
(71, 10, 'Sachet plastique pour médicament, 6x8cm, Sachet', NULL, 'Consommables medicaux', NULL, NULL, 9, 0, '1Pièce - 1000', 1704187969, NULL),
(72, 10, 'Sachet plastique pour médicament, 10x8cm, Sachet', NULL, 'Consommables medicaux', NULL, NULL, 15, 0, '1Pièce - 1000', 1704187969, NULL),
(73, 10, 'Seringue, u.u., Luer, 5ml, avec aiguille G23', NULL, 'Consommables medicaux', NULL, NULL, 117, 0, '1Pièce - 1800', 1704187969, NULL),
(74, 10, 'Sonde vésicale, Foley, 2 voies, ballonnet, CH14, stérile, ', NULL, 'Consommables medicaux', NULL, NULL, 8.5, 0, '1Pièce - 12', 1704187969, NULL),
(75, 10, 'Sonde vésicale, Foley, 2 voies, ballonnet, CH16, stérile,', NULL, 'Consommables medicaux', NULL, NULL, 8.5, 0, '1Pièce - 12', 1704187969, NULL),
(76, 10, 'Sonde vésicale, Foley, 3 voies CH20, 30-50ml, stérile, Unité', NULL, 'Consommables medicaux', NULL, NULL, 20, 0, '1Pièce - 12', 1704187969, NULL),
(77, 10, 'Sparadrap, Oxyde de Zinc, non perforé, 5cm*5m', NULL, 'Consommables medicaux', NULL, NULL, 12, 0, '1Pièce - 12', 1704187969, NULL),
(78, 10, 'Sparadrap, Oxyde de Zinc, non perforé, 10cm*10m', NULL, 'Consommables medicaux', NULL, NULL, 2.5, 0, '1Pièce - 1', 1704187969, NULL),
(79, 10, 'Sut., PGA, tressé, 75cm, déc.3 (2/0), aig.1/2c, R, eff., 30mm, 12', NULL, 'Consommables medicaux', NULL, NULL, 12.5, 0, '1Pièce - 12', 1704187969, NULL),
(80, 10, 'Sut., polyamide, monofil, 75cm, déc.3 (2/0), aig.3/8c, T, 12', NULL, 'Consommables medicaux', NULL, NULL, 14, 0, '1Pièce - 12', 1704187969, NULL),
(81, 10, 'Trousse de transfusion, Pièce, Unité', NULL, 'Consommables medicaux', NULL, NULL, 4.2, 0, '1Pièce - 10', 1704187969, NULL),
(82, 10, 'Trousse de perfusion, Pièce, Unité', NULL, 'Consommables medicaux', NULL, NULL, 5.5, 0, '1Pièce - 25', 1704187969, NULL),
(83, 10, 'SONDE GASTRIQUE, embout conique, 125 cm, u.u., CH06', NULL, 'Consommables medicaux', NULL, NULL, 0.8, 0, '1Pièce - 1', 1704187969, NULL),
(84, 10, 'SONDE GASTRIQUE, embout conique, 125 cm, u.u., CH08', NULL, 'Consommables medicaux', NULL, NULL, 0.8, 0, '1Pièce - 1', 1704187969, NULL),
(85, 10, 'SONDE GASTRIQUE, embout conique, 125 cm, u.u., CH10', NULL, 'Consommables medicaux', NULL, NULL, 0.8, 0, '1Pièce - 1', 1704187969, NULL),
(86, 10, 'SONDE GASTRIQUE, embout conique, 125 cm, u.u., CH12', NULL, 'Consommables medicaux', NULL, NULL, 0.8, 0, '1Pièce - 1', 1704187969, NULL),
(87, 10, 'SONDE GASTRIQUE, embout conique, 125 cm, u.u., CH16', NULL, 'Consommables medicaux', NULL, NULL, 0.8, 0, '1Pièce - 1', 1704187969, NULL),
(88, 10, 'SERINGUE, u.u., 60 ml, embout conique', NULL, 'Consommables medicaux', NULL, NULL, 90, 0, 'piece - 60', 1704187969, NULL),
(89, 10, '(HemoCue Hb 201+/301) NETTOYANT, 5pcs, HE139123', NULL, 'Consommables medicaux', NULL, NULL, 35, 0, 'piece - 5', 1704187969, NULL),
(90, 10, '(HemoCue Hb 301) MICROCUVETTE, u.u.', NULL, 'Consommables medicaux', NULL, NULL, 65, 0, 'piece - 50', 1704187969, NULL),
(91, 10, '(glucomètre Nova StatStrip) BANDELETTE 42214', NULL, 'Consommables medicaux', NULL, NULL, 35, 0, 'piece - 100', 1704187969, NULL),
(92, 10, 'AIGUILLE PONCTION LOMBAIRE, Luer, u.u., 20 G (0,9 x 90 mm)', NULL, 'Consommables medicaux', NULL, NULL, 20, 0, 'piece - 25', 1704187969, NULL),
(93, 10, 'AIGUILLE PONCTION LOMBAIRE, Luer, u.u., 22 G (0,7 x 40 mm)', NULL, 'Consommables medicaux', NULL, NULL, 20, 0, 'piece - 25', 1704187969, NULL),
(94, 10, 'SERINGUE, u.u., Luer, 10 ml avec Aiguille G21', NULL, 'Consommables medicaux', NULL, NULL, 90, 0, 'piece - 1200', 1704187969, NULL),
(95, 10, 'SERINGUE, u.u., Luer, 20 ml', NULL, 'Consommables medicaux', NULL, NULL, 15, 0, 'piece - 80', 1704187969, NULL),
(96, 10, 'Poche de transfusion 450 ml', NULL, 'Consommables medicaux', NULL, NULL, 51, 0, '1Pièce - 30', 1704187969, NULL),
(97, 10, 'MASQUE CHIRURGICAL, type IIR, u.u.', NULL, 'Consommables medicaux', NULL, NULL, 5, 0, 'piece - 50', 1704187969, NULL),
(98, 10, 'COMPTEUR DE COMPRIMES, triangulaire, mÃ©tallique, 17 cm', NULL, 'Consommables medicaux', NULL, NULL, 53, 0, 'Pce - 68', 1704187969, NULL),
(99, 10, 'BROYEUR DE COMPRIMES', NULL, 'Consommables medicaux', NULL, NULL, 20, 0, 'Pce - 67', 1704187969, NULL),
(100, 10, 'COUPEUR DE COMPRIMES, lame inoxydable', NULL, 'Consommables medicaux', NULL, NULL, 8.5, 0, 'Pce - 70', 1704187969, NULL),
(101, 10, 'Plateaux à pansement (30 cm x 20 cm x 3 cm)', NULL, 'Consommables medicaux', NULL, NULL, 17, 0, 'Pce - 68', 1704187969, NULL),
(102, 2, 'Cromoglycate collyre 2%', NULL, 'Produits à usage ophtalmique', NULL, NULL, 1.8, 0, 'undefined - 1', 1704187969, NULL),
(103, 2, 'Chloramphenicol collyre 0,5%', NULL, 'Produits à usage ophtalmique', NULL, NULL, 0.65, 0, 'undefined - 1', 1704187969, NULL),
(104, 2, 'Gentamycin collyre 0,1%', NULL, 'Produits à usage ophtalmique', NULL, NULL, 0.65, 0, 'undefined - 1', 1704187969, NULL),
(105, 2, 'Néomycine collyre1%', NULL, 'Produits à usage ophtalmique', NULL, NULL, 1.5, 0, 'undefined - 1', 1704187969, NULL),
(106, 2, 'Maxydrol collyre 3ml', NULL, 'Produits à usage ophtalmique', NULL, NULL, 3.85, 0, 'undefined - 1', 1704187969, NULL),
(107, 2, 'Chibron cadron collyre 5mg', NULL, 'Produits à usage ophtalmique', NULL, NULL, 2.55, 0, 'undefined - 1', 1704187969, NULL),
(108, 2, 'Ciprofloxacine collyre 0,3%', NULL, 'Produits à usage ophtalmique', NULL, NULL, 1.5, 0, 'undefined - 1', 1704187969, NULL),
(109, 2, 'DEXAMETHASONE 1mg, collyre, 5ml, fl.', NULL, 'Produits à usage ophtalmique', NULL, NULL, 0.65, 0, 'undefined - 1', 1704187969, NULL),
(110, 2, 'Diclofenac sodique 1mg, collyre, fl', NULL, 'Produits à usage ophtalmique', NULL, NULL, 1.5, 0, 'undefined - 1', 1704187969, NULL),
(111, 2, 'Tetracycline, 1%, pommade, tube, 5g, Unité', NULL, 'Produits à usage ophtalmique', NULL, NULL, 12, 0, 'undefined - 50', 1704187969, NULL),
(112, 3, 'Chlorhexidine digluconate 7,1%, 10gr, gel, tube', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 7.5, 0, 'undefined - 10', 1704187969, NULL),
(113, 3, 'Clotrimazole, 500mg, Tab gynécol, avec applicateur', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 0.65, 0, 'undefined - 1', 1704187969, NULL),
(114, 3, 'Tetracycline, 1%, pommade, tube, 5g, Unité', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 12, 0, 'undefined - 50', 1704187969, NULL),
(115, 3, 'Chlorhexidine + Cetrimide, 1.5% + 15%, 1 l, flacon, Unité', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 7.8, 0, 'undefined - 1', 1704187969, NULL),
(116, 3, 'Polyvidone iodine 10%, 200ml, Flacon, Unité', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 2.5, 0, 'undefined - 1', 1704187969, NULL),
(117, 3, 'Benzoate de Benyl, 25%, 1litre, Flacon, Unité', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 8, 0, 'undefined - 1', 1704187969, NULL),
(118, 3, 'Miconazole 2%, crème, 30g, Tube, Unité, 10', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 6.5, 0, 'undefined - 10', 1704187969, NULL),
(119, 3, 'SULFADIAZINE ARGENTIQUE, 1%, crème, stérile, 50 g, tube', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 0.9, 0, 'undefined - 1', 1704187969, NULL),
(120, 3, 'MICONAZOLE, 2%, gel oral, 40g, tube', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 0.75, 0, 'undefined - 1', 1704187969, NULL),
(121, 3, 'SERUM PHYSIOLOGIQUE, NaCl, 0,9%, 5 ml, fl. plastique', NULL, 'Medicamnts d\'Usages Externe ou Applications Locales', NULL, NULL, 12, 0, 'undefined - 30', 1704187969, NULL),
(122, 4, 'Artésunate, 60mg, Injectable', NULL, 'Médicaments parenteraux', NULL, NULL, 150, 0, '1 Amp - 100', 1704187969, NULL),
(123, 4, 'Quinine Bichlorhydrate, 300mg/ml, 2ml', NULL, 'Médicaments parenteraux', NULL, NULL, 22, 0, '1 Amp - 100', 1704187969, NULL),
(124, 4, 'Ceftriaxone 1g, Vial, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 0.32, 0, '1 Vial - 1', 1704187969, NULL),
(125, 4, 'Dexamethasone sodium phosphate, 4mg/ml, 1ml', NULL, 'Médicaments parenteraux', NULL, NULL, 0.48, 0, '1 Ampoule - 10', 1704187969, NULL),
(126, 4, 'Gentamycine, 40mg/ml, 2ml, Amp', NULL, 'Médicaments parenteraux', NULL, NULL, 6, 0, '1 Ampoule - 100', 1704187969, NULL),
(127, 4, 'Oxytocine, 10UI/ml, 1ml, Amp', NULL, 'Médicaments parenteraux', NULL, NULL, 9.5, 0, '1 Ampoule - 100', 1704187969, NULL),
(128, 4, 'Dextrose (Glucose), 50%, 50ml,', NULL, 'Médicaments parenteraux', NULL, NULL, 13, 0, '1 Baxter - 20', 1704187969, NULL),
(129, 4, 'Ciprofloxacine, 2mg/ml flacon', NULL, 'Médicaments parenteraux', NULL, NULL, 50, 0, 'Flacon - 100', 1704187969, NULL),
(130, 4, 'Metronidazole 500 mg/100 ml, inj, flacon', NULL, 'Médicaments parenteraux', NULL, NULL, 50, 0, 'Flacon - 100', 1704187969, NULL),
(131, 4, 'Epinéphrine (Adrenaline), 1mg/ml, 1ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 1.5, 0, '1 Ampoule - 10', 1704187969, NULL),
(132, 4, 'Ampicilline, 1g, Vial, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 17, 0, '1amp - 100', 1704187969, NULL),
(133, 4, 'Atropine, 1mg/ml, 1ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 6, 0, '1amp - 100', 1704187969, NULL),
(134, 4, 'Diazepam, 5mg/ml, 2ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 1.5, 0, '1amp - 10', 1704187969, NULL),
(135, 4, 'Diclofenac 25mg/ml, 3ml, Amp, Unité ', NULL, 'Médicaments parenteraux', NULL, NULL, 5, 0, '1amp - 100', 1704187969, NULL),
(136, 4, 'Eau pour injection, 10ml, Vial, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 6, 0, '1amp - 100', 1704187969, NULL),
(137, 4, 'Furosemide, 10mg/ml, 2ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 6, 0, '1amp - 100', 1704187969, NULL),
(138, 4, 'Hydrocortisone sodium succinate, 100mg, Vial, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 50, 0, '1amp - 100', 1704187969, NULL),
(139, 4, 'Methylergometrine maleate, 0.2mg/ml, 1ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 2.5, 0, '1amp - 10', 1704187969, NULL),
(140, 4, 'Métoclopramide chlorhydrate, 5mg/ml, 2ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 9, 0, '1amp - 100', 1704187969, NULL),
(141, 4, 'Penicilline Benzathine, 2,4MUI, Vial, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 17, 0, '1amp - 50', 1704187969, NULL),
(142, 4, 'Phenobarbital sodique, 100mg/ml, 2ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 8.5, 0, '1amp - 10', 1704187969, NULL),
(143, 4, 'Phytomenadione (Vitamine K1), 10mg/ml, 1ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 7, 0, '1amp - 30', 1704187969, NULL),
(144, 4, 'Pyridoxine, 50mg/ml, 2ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 0.5, 0, '1amp - 10', 1704187969, NULL),
(145, 4, 'Salbutamol, 0,5mg/ml, 1ml, Amp, Unité', NULL, 'Médicaments parenteraux', NULL, NULL, 11, 0, '1amp - 100', 1704187969, NULL),
(146, 4, 'Sulfate de Magnésium, 500mg, 10ml, Amp', NULL, 'Médicaments parenteraux', NULL, NULL, 13, 0, '1 Ampoule - 10', 1704187969, NULL),
(147, 4, 'CEFOTAXIME sodique, éq. 1g base, fl.', NULL, 'Médicaments parenteraux', NULL, NULL, 32, 0, 'Flacon - 100', 1704187969, NULL),
(148, 4, 'CLOXACILLINE sodique, éq. 500 mg base, poudre, fl. IV', NULL, 'Médicaments parenteraux', NULL, NULL, 22, 0, 'Flacon - 100', 1704187969, NULL),
(149, 4, 'CHLORAMPHENICOL, 1 g, poudre,  fl.', NULL, 'Médicaments parenteraux', NULL, NULL, 35, 0, 'Flacon - 50', 1704187969, NULL),
(150, 4, 'PARACETAMOL (acétaminophène), 10 mg/ml, 100 ml, fl.', NULL, 'Médicaments parenteraux', NULL, NULL, 20, 0, 'Flacon - 10', 1704187969, NULL),
(151, 4, 'TRAMADOL chlorhydrate, 50 mg/ml, 2 ml, amp.', NULL, 'Médicaments parenteraux', NULL, NULL, 2.55, 0, 'ampoule - 10', 1704187969, NULL),
(152, 5, 'THIOPENTAL sodique, 500 mg, poudre, fl.', NULL, 'Produits d\'Anesthesie', NULL, NULL, 175, 0, 'Flacon - 50', 1704187969, NULL),
(153, 5, 'PenCURONIUM bromure, 10 mg, poudre, fl.', NULL, 'Produits d\'Anesthesie', NULL, NULL, 40, 0, 'Flacon - 10', 1704187969, NULL),
(154, 5, 'SUXAMETHONIUM chlorure,  50 mg/ml, 2 ml, amp.', NULL, 'Produits d\'Anesthesie', NULL, NULL, 25, 0, 'ampoule - 10', 1704187969, NULL),
(155, 5, 'FENTANYL citrate, éq. 0,05mg/ml base, 2ml, amp.', NULL, 'Produits d\'Anesthesie', NULL, NULL, 23, 0, 'ampoule - 10', 1704187969, NULL),
(156, 5, 'PROPOFOL, 10mg/ml, 20ml, émulsion, amp.', NULL, 'Produits d\'Anesthesie', NULL, NULL, 19.5, 0, 'ampoule - 5', 1704187969, NULL),
(157, 5, 'Bupivacaine 0.5% (20 mL) flacon(Isobare)', NULL, 'Produits d\'Anesthesie', NULL, NULL, 85, 0, 'Flacon - 20', 1704187969, NULL),
(158, 5, 'Ketamine, 50mg/ml, 10ml, Vial', NULL, 'Produits d\'Anesthesie', NULL, NULL, 55, 0, '1 Vial - 25', 1704187969, NULL),
(159, 5, 'Lidocaïne chlorhydrate, 2%, 20 ml, Vial, Unité', NULL, 'Produits d\'Anesthesie', NULL, NULL, 12, 0, '1amp - 20', 1704187969, NULL),
(160, 6, 'Dextrose (Glucose), 5%, 500ml, Perfusion', NULL, 'Solutés de perfusions', NULL, NULL, 22.5, 0, '1 Baxter - 30', 1704187969, NULL),
(161, 6, 'Ringer lactate (Solution de Hartmann), 500ml, Perfusion', NULL, 'Solutés de perfusions', NULL, NULL, 45, 0, '1 Baxter - 60', 1704187969, NULL),
(162, 6, 'GLUCOSE, 10%, 500 ml, poche souple, sans PVC', NULL, 'Solutés de perfusions', NULL, NULL, 24, 0, 'Flacon - 40', 1704187969, NULL),
(163, 6, 'Chlorure de sodium, 0.9%, 500ml, Perfusion, Unité', NULL, 'Solutés de perfusions', NULL, NULL, 22.5, 0, 'Flacon - 30', 1704187969, NULL),
(164, 7, 'Test Diagnostic Rapide, Malaria', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 10, 0, '1 Test - 25', 1704187969, NULL),
(165, 7, 'Test, VIH 1+2, rapide, Determine', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 65, 0, '1 Test - 100', 1704187969, NULL),
(166, 7, 'Test, Syphilis, RPR, 250 tests', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 100, 0, '1 Test - 250', 1704187969, NULL),
(167, 7, '(HemoCue Hb 301) SOLUTION DE CONTROLE, bas, 1ml fl.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 0, 0, 'Flacon - 2', 1704187969, NULL),
(168, 7, '(HemoCue Hb 301) SOLUTION DE CONTROLE, normale, 1ml fl.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 0, 0, 'Flacon - 2', 1704187969, NULL),
(169, 7, '(HemoCue Hb 301) SOLUTION DE CONTROLE, haut, 1ml fl.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 0, 0, 'Flacon - 2', 1704187969, NULL),
(170, 7, '(glucomètre Nova StatStrip) SOL. DE CONTROLE bas 4ml 46947', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 0, 0, 'Flacon - 2', 1704187969, NULL),
(171, 7, '(glucomètre Nova StatStrip) SOL.DE CONTROLE normal 4ml 46948', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 0, 0, 'Flacon - 1', 1704187969, NULL),
(172, 7, '(glucomètre Nova StatStrip) SOL. DE CONTROLE haut 4ml 46949', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 0, 0, 'Flacon - 1', 1704187969, NULL),
(173, 7, 'ACIDE CHLORHYDRIQUE, 37%, 1 l, fl.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 10, 0, 'Flacon - 1', 1704187969, NULL),
(174, 7, 'METHANOL, 1 l, fl.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 22, 0, 'Flacon - 1', 1704187969, NULL),
(175, 7, 'ETHANOL, dénaturé, 95%, 1 l, fl.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 7, 0, 'Flacon - 1', 1704187969, NULL),
(176, 7, 'ACIDE ACETIQUE, glacial, 1 l, fl.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 22, 0, 'Flacon - 1', 1704187969, NULL),
(177, 7, 'GIEMSA, colorant (Merck), solution, 500 ml, fl.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 25, 0, 'Flacon - 1', 1704187969, NULL),
(178, 7, 'LUGOL, solution non diluée, 1 l, bout.', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 25, 0, 'Flacon - 1', 1704187969, NULL),
(179, 7, 'COLORATION RAPIDE FROTTIS (RAL 555), 3 x 100 ml, kit', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 65, 0, 'Flacon - 1', 1704187969, NULL),
(180, 7, 'Test de groupage sanguin, anti A, monoclonal, 10ml, Unité', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 90, 0, 'Flacon - 10', 1704187969, NULL),
(181, 7, 'Test de groupage sanguin, anti AB, monoclonal, 10ml', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 90, 0, 'Flacon - 10', 1704187969, NULL),
(182, 7, 'Test de groupage sanguin, anti B, monoclonal, 10ml, Unité', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 90, 0, 'Flacon - 10', 1704187969, NULL),
(183, 7, 'Test de groupage sanguin, anti D, monoclonal, 10ml, Unité', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 90, 0, 'Flacon - 10', 1704187969, NULL),
(184, 7, 'Test urinaire Glucose/Proteine/Ph/Sang, 100 tests, Unité', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 13, 0, '1 Test - 100', 1704187969, NULL),
(185, 7, 'Test, hepatite B, rapide, Determine, Flacon 100 tests', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 40, 0, '1 Test - 100', 1704187969, NULL),
(186, 7, 'Test, hepatite C, rapide, Determine, Flacon 100 tests', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 42, 0, '1 Test - 100', 1704187969, NULL),
(187, 7, '(test rapide Determine) TAMPON, 2,5 ml, 7D2243', NULL, 'Reactifs Et Tests de Diagnostics Rapide', NULL, NULL, 15, 0, 'Flacon - 1', 1704187969, NULL),
(188, 8, 'Thermomètre mural, Pièce, Unité', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 33, 0, '1Pièce - 1', 1704187969, NULL),
(189, 8, 'PHOTOMETRE HEMOGLOBINE (HemoCue Hb 301), tropicalisé', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 1550, 0, 'piece - 1', 1704187969, NULL),
(190, 8, 'GLUCOMETRE, lecteur glycémie (StatStrip Xpress) mmol/l', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 0, 0, 'piece - 1', 1704187969, NULL),
(191, 8, 'LAMELLE COUVRE-OBJET, 22 x 22 mm, emballage tropicalisé', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 3.5, 0, 'piece - 200', 1704187969, NULL),
(192, 8, 'LAME PORTE-OBJETS, dépolie, 76 x 26 mm,emballage tropicalisé', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 5, 0, 'piece - 50', 1704187969, NULL),
(193, 8, 'CARTE CONTROLE AU LIT DU PATIENT compatibilité ABO (Serafol)', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 800, 0, 'piece - 50', 1704187969, NULL),
(194, 8, '(carte contrôle au lit du patient Serafol) FEUILLE ADHESIVE', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 0, 0, 'piece - 50', 1704187969, NULL),
(195, 8, '(carte contrôle au lit du patient Serafol) BATONNETS plast.', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 0, 0, 'piece - 100', 1704187969, NULL),
(196, 8, '(pip.aut.) EMBOUT BLEU, 50-1000µl (Eppdf)', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 15, 0, 'piece - 1000', 1704187969, NULL),
(197, 8, 'PIPETTE, plastique, graduée, cotonnée, stérile 10 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 50, 0, 'piece - 200', 1704187969, NULL),
(198, 8, '(s.prél.sang.) TUBE SOUS VIDE, plastique,SERUM SEC,4ml,rouge', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 13, 0, 'piece - 100', 1704187969, NULL),
(199, 8, '(s.prél.sang.) TUBE SOUS VIDE, plastique, K2EDTA, 4ml, mauve', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 13, 0, 'piece - 100', 1704187969, NULL),
(200, 8, 'MICROSCOPE (Olympus CX23LED) COMPLETE (bin,mirror,box)', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 2750, 0, 'piece - 1', 1704187969, NULL),
(201, 8, 'PAPIER INDICATEUR pH, 2 Ã  9, grad. 0,5, gastr. la bandelette', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 0, 0, 'piece - 100', 1704187969, NULL),
(202, 8, 'ENTONNOIR, verre, Ã˜ 150 mm', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 0, 0, 'piece - 1', 1704187969, NULL),
(203, 8, 'PLAQUE, groupage sanguin, lisse, avec 5 cavitÃ©s', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 800, 0, 'piece - 1', 1704187969, NULL),
(204, 8, 'TUBE A CENTRIFUGER, 15 ml, fond conique, stÃ©rile PP', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 5, 0, 'piece - 1', 1704187969, NULL),
(205, 8, 'TUBE A HEMOLYSE, Ã˜ 12 mm, verre, 5 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 120, 0, 'piece - 1', 1704187969, NULL),
(206, 8, 'AGITATEUR, verre, 250 mm, Ã˜ 6-7 mm', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 22, 0, 'piece - 1', 1704187969, NULL),
(207, 8, 'BECHER, verre, graduÃ© avec bec verseur 10 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 18, 0, 'piece - 1', 1704187969, NULL),
(208, 8, 'BECHER, verre, graduÃ© avec bec verseur 100 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 20, 0, 'piece - 1', 1704187969, NULL),
(209, 8, 'BECHER, verre, graduÃ© avec bec verseur 50 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 25, 0, 'piece - 1', 1704187969, NULL),
(210, 8, 'DISTILLATEUR (Tuttnauer EWS-RD1),0.95L/h, 3.8L, 220V,50/60Hz', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 2500, 0, 'piece - 1', 1704187969, NULL),
(211, 8, 'CENTRIFUGEUSE, manuelle pour 4 tubes 15 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 60, 0, 'piece - 1', 1704187969, NULL),
(212, 8, 'CENTRIFUGEUSE Ã  hÃ©matocrite Ã©lectr. (Hettich Haematokrit200)', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 800, 0, 'piece - 1', 1704187969, NULL),
(213, 8, 'PISSETTE, col de cygne, plastique, 250 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 9, 0, 'piece - 1', 1704187969, NULL),
(214, 8, 'FLACON, verre transparent, avec bouchon, 25 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 3, 0, 'piece - 1', 1704187969, NULL),
(215, 8, 'FLACON COMPTE-GOUTTES, plastique, 60 ml', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 5, 0, 'piece - 1', 1704187969, NULL),
(216, 8, 'AGITATEUR MAGNETIQUE chauffant, min. 2l, 50-60Hz 230V OU RECHAUD, Ã©lectriq', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 950, 0, 'piece - 1', 1704187969, NULL),
(217, 8, 'BARREAU MAGNETIQUE, pour agitateur, 50 mm', NULL, 'Equipement de Laboratoire et Autre', NULL, NULL, 15, 0, 'piece - 1', 1704187969, NULL),
(218, 9, 'Congélateur Vestfrost  MF 314', NULL, 'Chaine de Froid Projet', NULL, NULL, 0, 0, 'piece - 1', 1704187969, NULL),
(219, 9, 'Réfrigérateur vestfrost MK 204 OU 304', NULL, 'Chaine de Froid Projet', NULL, NULL, 0, 0, 'piece - 1', 1704187969, NULL),
(220, 9, 'RCW25(Cool BOX)', NULL, 'Chaine de Froid Projet', NULL, NULL, 0, 0, 'piece - 1', 1704187969, NULL),
(221, 9, 'Porte Vaccin(6L)', NULL, 'Chaine de Froid Projet', NULL, NULL, 95, 0, 'piece - 4', 1704187969, NULL),
(222, 9, 'Accumulateurs de Froid (Icepacks) 0.6L', NULL, 'Chaine de Froid Projet', NULL, NULL, 4, 0, 'piece - 243', 1704187969, NULL),
(223, 9, 'Logtag électronniqueavec écran pour lecture (tableau lecture)', NULL, 'Chaine de Froid Projet', NULL, NULL, 0, 0, 'Pce - 10', 1704187969, NULL),
(224, 9, 'Carte 3M ', NULL, 'Chaine de Froid Projet', NULL, NULL, 0, 0, 'Pce - 150', 1704187969, NULL),
(225, 9, 'Freezetag ', NULL, 'Chaine de Froid Projet', NULL, NULL, 0, 0, 'Pce - 1', 1704187969, NULL),
(226, 9, 'Lecteur Logtag', NULL, 'Chaine de Froid Projet', NULL, NULL, 0, 0, 'Pce - 1', 1704187969, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `productsCategory`
--

CREATE TABLE `productsCategory` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `productsCategory`
--

INSERT INTO `productsCategory` (`idCategory`, `name`, `type`, `timestamp`) VALUES
(1, 'Approvisionnement', 'enter', 1703588960),
(2, 'Retour de Stock', 'enter', 1703588965),
(3, 'Vente', 'outlet', 1703588972),
(4, 'Perte', 'outlet', 1703588978),
(5, 'Donation', 'outlet', 1703704252);

-- --------------------------------------------------------

--
-- Structure de la table `productTransactions`
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

--
-- Déchargement des données de la table `productTransactions`
--

INSERT INTO `productTransactions` (`idTransaction`, `idProduct`, `idCategory`, `idUser`, `nameOfCategory`, `nameOfUser`, `nameOfProduct`, `stockAfter`, `enter`, `outlet`, `description`, `timestamp`) VALUES
(1, 2, 3, 4, 'Vente', 'Godwin Burume', 'Nystatine sirop', 4700, 0, 300, 'Vente numero facture 376', 1703704366),
(2, 2, 1, 4, 'Approvisionnement', 'Godwin Burume', 'Nystatine sirop', 5900, 1200, 0, 'Approvisionnement Bon de commande Numero 254', 1703704457);

-- --------------------------------------------------------

--
-- Structure de la table `productTypes`
--

CREATE TABLE `productTypes` (
  `idType` int(11) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `productTypes`
--

INSERT INTO `productTypes` (`idType`, `name`) VALUES
(1, 'Medicaments Oraux'),
(2, 'Produits à usage ophtalmique'),
(3, 'Medicamnts d\'Usages Externe ou Applications Locales'),
(4, 'Médicaments parenteraux'),
(5, 'Produits d\'Anesthesie'),
(6, 'Solutés de perfusions'),
(7, 'Reactifs Et Tests de Diagnostics Rapide'),
(8, 'Equipement de Laboratoire et Autre'),
(9, 'Chaine de Froid Projet'),
(10, 'Consommables medicaux');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 = admin; 2 = manager, 3 = seller',
  `password` varchar(500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idUser`, `name`, `pseudo`, `level`, `password`, `timestamp`) VALUES
(4, 'Godwin Burume', 'nodewin', 1, '$2a$12$P6jVFl7NtgENYub/hKs.lelrqLDPwPtF8PtBGLTjPnXsN7VL6G5e6', 1234),
(5, 'Dr Suzy', 'suzy', 1, '$2a$10$MNPiovMUGgbs/CSthsOlCeVOSxkP8185hkvWvtheS4lUOcZA0iFZS', 1704371713),
(6, 'Felly', 'felly', 1, '$2a$10$wMmhd5VtV1K4sk8jszgBIe0CHJSzzQhiNH.n2Hrd50EyfrnX3WO3u', 1704371713),
(7, 'Assistant en Pharmacie', 'assispharma', 1, '$2a$10$c/Edqkqt2fXUQzdjlWzWx.K0TzIyBTP7KChQHNkyVp9wOcVflQiSO', 1704371713),
(8, 'Pharmacien', 'pharma', 1, '$2a$10$lIIz42I7mqgG8m1FWc5cpOEu/m06HIEh9O4tE3U6aswVbhEShwo8y', 1704371713),
(9, 'Depot 1', 'depot1', 1, '$2a$10$JfaDiItfaYJbRJkCpM1vGuIIy7WnT31TjZz.BXC4UQWoojuMWhsXq', 1704371871),
(10, 'Depot 2', 'depot2', 1, '$2a$10$A0lLp66LE1u9Ll735RuYZeadcqPRHJFDwu3KWQ9YvkGeHx0IQMbVi', 1704371871);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `moneyCategory`
--
ALTER TABLE `moneyCategory`
  ADD PRIMARY KEY (`idCategory`);

--
-- Index pour la table `moneyTransactions`
--
ALTER TABLE `moneyTransactions`
  ADD PRIMARY KEY (`idTransaction`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idProduct`);

--
-- Index pour la table `productsCategory`
--
ALTER TABLE `productsCategory`
  ADD PRIMARY KEY (`idCategory`);

--
-- Index pour la table `productTransactions`
--
ALTER TABLE `productTransactions`
  ADD PRIMARY KEY (`idTransaction`);

--
-- Index pour la table `productTypes`
--
ALTER TABLE `productTypes`
  ADD PRIMARY KEY (`idType`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `moneyCategory`
--
ALTER TABLE `moneyCategory`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `moneyTransactions`
--
ALTER TABLE `moneyTransactions`
  MODIFY `idTransaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT pour la table `productsCategory`
--
ALTER TABLE `productsCategory`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `productTransactions`
--
ALTER TABLE `productTransactions`
  MODIFY `idTransaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `productTypes`
--
ALTER TABLE `productTypes`
  MODIFY `idType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
