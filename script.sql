-- V1.1.0

PROMPT "Création de la base de données IMMO";

-- **************************************************************************** Définition des données

PROMPT "Définition des données";

DROP TABLE PROPRIO CASCADE CONSTRAINTS PURGE;
DROP TABLE ESPACE CASCADE CONSTRAINTS PURGE;
DROP TABLE BIEN CASCADE CONSTRAINTS PURGE;

CREATE TABLE PROPRIO(
    IDP NUMBER(10,0),
    NOM VARCHAR2(20),
    PRENOM VARCHAR2(20),
    CONSTRAINT PK_PROPRIO PRIMARY KEY(IDP)
);

CREATE TABLE ESPACE(
    IDE NUMBER(10,0),
    DESIGNATION VARCHAR2(20),
    SUPERFICIE NUMBER(10,0),
    IDERATTACH NUMBER(10,0),
    CONSTRAINT PK_ESPACE PRIMARY KEY(IDE),
    CONSTRAINT FK_ESPACE_ESPACE FOREIGN KEY(IDERATTACH) REFERENCES ESPACE(IDE)
);

CREATE TABLE BIEN(
    IDEBIEN NUMBER(10,0),
    CATEGORIE VARCHAR2(20),
    TYPE VARCHAR2(10),
    IDP NUMBER(10,0),
    VILLE VARCHAR2(20),
    PRIX NUMBER(10),
    CONSTRAINT PK_BIEN PRIMARY KEY(IDEBIEN),
    CONSTRAINT FK_BIEN_ESPACE FOREIGN KEY(IDEBIEN) REFERENCES ESPACE(IDE),
    CONSTRAINT FK2_BIEN_PROPRIO FOREIGN KEY(IDP) REFERENCES PROPRIO(IDP),
    CONSTRAINT CH_BIEN_CATEGORIE CHECK (CATEGORIE IN ('APPARTEMENT','MAISON DE VILLE','VILLA','HLM','BIDONVILLE')),
    CONSTRAINT CH2_BIEN_TYPE CHECK (TYPE IN ('STUDIO','T1','T2','T3','T4','T5','T6'))
);

-- **************************************************************************** Insertions des données

PROMPT "Insertions des données";

PROMPT "Insertions des données de la table PROPRIO";

INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(1,'GRIGUER','NATHAN');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(2,'AMROUNE','AKIM');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(3,'GUL','FURKAN');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(4,'ZEGANNE','SOFIEN');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(5,'ORLANDI','LENNY');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(6,'DIAZ','GWENN');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(7,'CELESTINE','SAMUEL');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(8,'ANTOINE','THOMAS');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(9,'BAURENS-TORRENTE','VALENTIN');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(10,'BAGNIS','ENZO');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(11,'SISE','ABOUBAKAR');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(12,' RAPANAKIS-BOURG','MARIUS');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(13,'RADJOU','DINESH');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(14,'UYSUN','ALI');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(15,'ALLARD','LOAN');
INSERT INTO PROPRIO (IDP, NOM,PRENOM) VALUES(16,'RINALDI','ANTOINE');

PROMPT "Insertions des données de la table ESPACE";

INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(3247,'STUDIO',60,NULL);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(3248,'SALLE D''EAU',15,3247);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(3249,'PIECE A VIVRE',45,3248);

INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4400,'VILLA',320,NULL);

INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4401,'TERRASSE',200,4400);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4402,'INTERIEUR',120,4400);

INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4403,'PISCINE',35,4401);

INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4404,'COULOIR',20,4402);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4405,'SALLE DE BAIN',8,4402);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4406,'CHAMBRE',12,4402);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4407,'CHAMBRE',12,4402);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4408,'CHAMBRE',10,4402);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4409,'SALON',45,4402);

INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4410,'PLACARD',10,4404);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4411,'SALLE DE BAIN',10,4404);

INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4412,'CUISINE',12,4409);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4413,'SEJOUR',25,4409);
INSERT INTO ESPACE(IDE, DESIGNATION, SUPERFICIE, IDERATTACH) VALUES(4414,'SALLE A MANGER',8,4409);

PROMPT "Insertions des données de la table BIEN";

INSERT INTO BIEN(IDEBIEN,CATEGORIE, TYPE, IDP, VILLE, PRIX) VALUES(3247,'APPARTEMENT','STUDIO',1,'MARSEILLE',100000);
INSERT INTO BIEN(IDEBIEN,CATEGORIE, TYPE, IDP, VILLE, PRIX) VALUES(4400,'VILLA','T4',3,'MARSEILLE',10);
