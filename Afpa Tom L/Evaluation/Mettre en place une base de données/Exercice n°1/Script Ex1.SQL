CREATE DATABASE HotelExo;
USE HotelExo;

CREATE TABLE Client(
        cli_num     Int  Auto_increment  NOT NULL ,
        cli_nom     Varchar (50) NOT NULL ,
        cli_adresse Varchar (200) NOT NULL ,
        cli_tel     Varchar (200) NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (cli_num)
)ENGINE=InnoDB;


CREATE TABLE Commande(
        com_num  Int  Auto_increment  NOT NULL ,
        com_date Datetime NOT NULL ,
        com_obs  Varchar (200) NOT NULL ,
        cli_num  Int NOT NULL
	,CONSTRAINT Commande_PK PRIMARY KEY (com_num)

	,CONSTRAINT Commande_Client_FK FOREIGN KEY (cli_num) REFERENCES Client(cli_num)
)ENGINE=InnoDB;


CREATE TABLE Produit(
        pro_num         Int  Auto_increment  NOT NULL ,
        pro_libelle     Varchar (200) NOT NULL ,
        pro_description Varchar (200) NOT NULL
	,CONSTRAINT Produit_PK PRIMARY KEY (pro_num)
)ENGINE=InnoDB;


CREATE TABLE est_compose(
        pro_num Int NOT NULL ,
        com_num Int NOT NULL ,
        est_qte Int NOT NULL
	,CONSTRAINT est_compose_PK PRIMARY KEY (pro_num,com_num)

	,CONSTRAINT est_compose_Produit_FK FOREIGN KEY (pro_num) REFERENCES Produit(pro_num)
	,CONSTRAINT est_compose_Commande0_FK FOREIGN KEY (com_num) REFERENCES Commande(com_num)
)ENGINE=InnoDB;

CREATE INDEX index_cli_nom ON Client(cli_nom);