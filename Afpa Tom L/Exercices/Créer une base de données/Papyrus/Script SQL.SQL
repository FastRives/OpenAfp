CREATE DATABASE Papyrus;

USE Papyrus;

CREATE TABLE Produit(
        Codart Int  Auto_increment  NOT NULL ,
        Libart Varchar (30) NOT NULL ,
        STKALE Int NOT NULL ,
        STKPHY Int NOT NULL ,
        QTEANN Int NOT NULL ,
        UNIMES Char (5) NOT NULL
	,CONSTRAINT Produit_PK PRIMARY KEY (Codart)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournis
#------------------------------------------------------------

CREATE TABLE fournis(
        NUMFOU Int  Auto_increment  NOT NULL ,
        NOMFOU Varchar (25) NOT NULL ,
        RUEFOU Varchar (50) NOT NULL ,
        POSFOU Char (5) NOT NULL ,
        VILFOU Varchar (50) NOT NULL ,
        CONFOU Varchar (15) NOT NULL ,
    	Satisf TinyINT NULL, 
    CONSTRAINT CheckSatisf CHECK (Satisf BETWEEN 1 AND 10),
    CONSTRAINT fournis_PK PRIMARY KEY (NUMFOU)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: entcom
#------------------------------------------------------------

CREATE TABLE entcom(
        NUMCOM Int  Auto_increment  NOT NULL ,
        OBSCOM Varchar (50) ,
        DATCOM Date ,
        NUMFOU Int DEFAULT NULL
	,CONSTRAINT entcom_PK PRIMARY KEY (NUMCOM)

	,CONSTRAINT entcom_fournis_FK FOREIGN KEY (NUMFOU) REFERENCES fournis(NUMFOU)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ligcom
#------------------------------------------------------------

CREATE TABLE ligcom(
        Numlig Int  Auto_increment  NOT NULL ,
        QTECDE Int NOT NULL ,
        PRIUNI Varchar (50) NOT NULL ,
        QTELIV Int ,
        DERLIV Datetime NOT NULL ,
        NUMCOM Int NOT NULL ,
        Codart Int NOT NULL
	,CONSTRAINT ligcom_PK PRIMARY KEY (Numlig)

	,CONSTRAINT ligcom_entcom_FK FOREIGN KEY (NUMCOM) REFERENCES entcom(NUMCOM)
	,CONSTRAINT ligcom_Produit0_FK FOREIGN KEY (Codart) REFERENCES Produit(Codart)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: vente
#------------------------------------------------------------

CREATE TABLE vente(
        NUMFOU Int NOT NULL ,
        Codart Int NOT NULL ,
        DELLIV Smallint NOT NULL ,
        QTE1   Int NOT NULL ,
        PRIX1  Varchar (50) NOT NULL ,
        QTE2   Int ,
        PRIX2  Varchar (50) ,
        QTE3   Int ,
        PRIX3  Varchar (10)
	,CONSTRAINT vente_PK PRIMARY KEY (NUMFOU,Codart)

	,CONSTRAINT vente_fournis_FK FOREIGN KEY (NUMFOU) REFERENCES fournis(NUMFOU)
	,CONSTRAINT vente_Produit0_FK FOREIGN KEY (Codart) REFERENCES Produit(Codart)
)ENGINE=InnoDB;