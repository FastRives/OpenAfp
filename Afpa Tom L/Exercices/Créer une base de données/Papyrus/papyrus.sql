CREATE DATABASE Papyrus;
USE Papyrus;

CREATE TABLE `entcom` (
  `NUMCOM` int(11) NOT NULL,
  `OBSCOM` varchar(50) DEFAULT NULL,
  `DATCOM` date DEFAULT NULL,
  `NUMFOU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fournis`
--

CREATE TABLE `fournis` (
  `NUMFOU` int(11) NOT NULL,
  `NOMFOU` varchar(25) NOT NULL,
  `RUEFOU` varchar(50) NOT NULL,
  `POSFOU` char(5) NOT NULL,
  `VILFOU` varchar(50) NOT NULL,
  `CONFOU` varchar(15) NOT NULL,
  `Satisf` tinyint(3) CHECK (Satisf >=1 AND Satisf <=10)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ligcom`
--

CREATE TABLE `ligcom` (
  `Numlig` int(11) NOT NULL,
  `QTECDE` int(11) NOT NULL,
  `PRIUNI` varchar(50) NOT NULL,
  `QTELIV` int(11) DEFAULT NULL,
  `DERLIV` datetime NOT NULL,
  `NUMCOM` int(11) NOT NULL,
  `Codart` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `Codart` int(11) NOT NULL,
  `Libart` varchar(30) NOT NULL,
  `STKALE` int(11) NOT NULL,
  `STKPHY` int(11) NOT NULL,
  `QTEANN` int(11) NOT NULL,
  `UNIMES` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vente`
--

CREATE TABLE `vente` (
  `NUMFOU` int(11) NOT NULL,
  `Codart` int(11) NOT NULL,
  `DELLIV` smallint(6) NOT NULL,
  `QTE1` int(11) NOT NULL,
  `PRIX1` varchar(50) NOT NULL,
  `QTE2` int(11) DEFAULT NULL,
  `PRIX2` varchar(50) DEFAULT NULL,
  `QTE3` int(11) DEFAULT NULL,
  `PRIX3` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entcom`
--
ALTER TABLE `entcom`
  ADD PRIMARY KEY (`NUMCOM`),
  ADD KEY `NUMFOU_index` (`NUMFOU`);

--
-- Indexes for table `fournis`
--
ALTER TABLE `fournis`
  ADD PRIMARY KEY (`NUMFOU`),
  ADD KEY `NUMFOU_index` (`NUMFOU`);

--
-- Indexes for table `ligcom`
--
ALTER TABLE `ligcom`
  ADD PRIMARY KEY (`Numlig`),
  ADD KEY `ligcom_entcom_FK` (`NUMCOM`),
  ADD KEY `ligcom_Produit0_FK` (`Codart`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`Codart`);

--
-- Indexes for table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`NUMFOU`,`Codart`),
  ADD KEY `vente_Produit0_FK` (`Codart`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `entcom`
--
ALTER TABLE `entcom`
  MODIFY `NUMCOM` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fournis`
--
ALTER TABLE `fournis`
  MODIFY `NUMFOU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ligcom`
--
ALTER TABLE `ligcom`
  MODIFY `Numlig` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `Codart` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `entcom`
--
ALTER TABLE `entcom`
  ADD CONSTRAINT `entcom_fournis_FK` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`);

--
-- Constraints for table `ligcom`
--
ALTER TABLE `ligcom`
  ADD CONSTRAINT `ligcom_Produit0_FK` FOREIGN KEY (`Codart`) REFERENCES `produit` (`Codart`),
  ADD CONSTRAINT `ligcom_entcom_FK` FOREIGN KEY (`NUMCOM`) REFERENCES `entcom` (`NUMCOM`);

--
-- Constraints for table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_Produit0_FK` FOREIGN KEY (`Codart`) REFERENCES `produit` (`Codart`),
  ADD CONSTRAINT `vente_fournis_FK` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`);
COMMIT;
