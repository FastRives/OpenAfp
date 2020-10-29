CREATE database Exercice1; 

USE Exercice1;

CREATE TABLE Personne(
    per_num int AUTO_INCREMENT PRIMARY KEY,
    per_nom varchar(50), 
    per_prenom varchar(50), 
    per_adresse varchar(255),
    per_ville varchar(50));
    
CREATE TABLE Groupe(
    gro_num int AUTO_INCREMENT PRIMARY KEY, 
    gro_libelle varchar(50));
    
CREATE TABLE Appartient(
    per_num int,
    gro_num int,
    FOREIGN KEY (per_num) REFERENCES Personne(per_num),
    FOREIGN KEY (gro_num) REFERENCES Groupe(gro_num));