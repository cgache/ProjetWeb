#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: RESPONSABLE
#------------------------------------------------------------

CREATE TABLE RESPONSABLE(
        ID_Responsable     Int  Auto_increment  NOT NULL ,
        User_Responsable   Varchar (50) NOT NULL ,
        Pass_Responsable   Varchar (50) NOT NULL ,
        Prenom_Responsable Varchar (50) NOT NULL ,
        Nom_Responsable    Varchar (50) NOT NULL
	,CONSTRAINT RESPONSABLE_PK PRIMARY KEY (ID_Responsable)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ETUDIANT
#------------------------------------------------------------

CREATE TABLE ETUDIANT(
        ID_Etudiant     Int  Auto_increment NOT NULL ,
        Prenom_Etudiant Varchar (50) NOT NULL ,
        Nom_Etudiant    Varchar (50) NOT NULL ,
        User_Etudiant   Varchar (50) NOT NULL ,
        Pass_Etudiant   Varchar (50) NOT NULL ,
        ID_Responsable  Int
	,CONSTRAINT ETUDIANT_PK PRIMARY KEY (ID_Etudiant,Prenom_Etudiant,Nom_Etudiant)

	,CONSTRAINT ETUDIANT_RESPONSABLE_FK FOREIGN KEY (ID_Responsable) REFERENCES RESPONSABLE(ID_Responsable)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MATERIEL
#------------------------------------------------------------

CREATE TABLE MATERIEL(
        ID_Materiel  Int  Auto_increment  NOT NULL ,
        CodeBarre    Varchar (50) NOT NULL ,
        Nom_Materiel Varchar (50) NOT NULL ,
        Description  Varchar (100) NOT NULL ,
        Fournisseur  Varchar (50) NOT NULL ,
        DateAchat    Date NOT NULL ,
        Prix         Int NOT NULL
	,CONSTRAINT MATERIEL_PK PRIMARY KEY (ID_Materiel)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PRET
#------------------------------------------------------------

CREATE TABLE PRET(
        ID_Etudiant     Int NOT NULL ,
        Prenom_Etudiant Varchar (50) NOT NULL ,
        Nom_Etudiant    Varchar (50) NOT NULL ,
        ID_Materiel     Int NOT NULL ,
        Debut_Pret      Date NOT NULL ,
        Fin_Pret        Date NOT NULL
	,CONSTRAINT PRET_PK PRIMARY KEY (ID_Etudiant,Prenom_Etudiant,Nom_Etudiant,ID_Materiel)

	,CONSTRAINT PRET_ETUDIANT_FK FOREIGN KEY (ID_Etudiant,Prenom_Etudiant,Nom_Etudiant) REFERENCES ETUDIANT(ID_Etudiant,Prenom_Etudiant,Nom_Etudiant)
	,CONSTRAINT PRET_MATERIEL0_FK FOREIGN KEY (ID_Materiel) REFERENCES MATERIEL(ID_Materiel)
)ENGINE=InnoDB;

