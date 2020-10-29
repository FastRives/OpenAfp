CREATE DATABASE Hotel;

USE Hotel;

CREATE TABLE Station(
   num_station INT AUTO_INCREMENT,
   nom_station VARCHAR(50),
   PRIMARY KEY(num_station)
);

CREATE TABLE Client(
   num_client INT AUTO_INCREMENT,
   adresse_client VARCHAR(250),
   nom_client VARCHAR(50),
   prenom_client VARCHAR(50),
   PRIMARY KEY(num_client)
);

CREATE TABLE Hotel(
   num_hotel INT AUTO_INCREMENT,
   capacite_hotel INT NOT NULL,
   categorie_hotel VARCHAR(50) NOT NULL,
   nom_hotel VARCHAR(50) NOT NULL,
   adresse_hotel VARCHAR(250),
   num_station INT NOT NULL,
   PRIMARY KEY(num_hotel),
   FOREIGN KEY(num_station) REFERENCES Station(num_station)
);

CREATE TABLE Chambre(
   num_chambre INT AUTO_INCREMENT,
   capacite_chambre INT NOT NULL,
   degre_confort INT,
   exposition INT,
   type_chambre VARCHAR(50),
   num_hotel INT NOT NULL,
   PRIMARY KEY(num_chambre),
   FOREIGN KEY(num_hotel) REFERENCES Hotel(num_hotel)
);

CREATE TABLE Reservation(
   num_client INT,
   date_debut DATE,
   date_fin DATE,
   date_reservation DATE,
   montant_arrhes INT,
   prix_total INT,
   num_chambre INT NOT NULL,
   PRIMARY KEY(num_client),
   FOREIGN KEY(num_client) REFERENCES Client(num_client),
   FOREIGN KEY(num_chambre) REFERENCES Chambre(num_chambre)
);
