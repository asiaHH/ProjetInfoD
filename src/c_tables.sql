CREATE TABLE Reviews (
    idReviews INT PRIMARY KEY,
    Review_count INT,
    Tips_count INT,
    Checkin_count INT
);

CREATE TABLE Localisation (
    idLoc INT PRIMARY KEY,
    adress VARCHAR2(100),
    state VARCHAR2(100),
    city VARCHAR2(100),
    postal_code VARCHAR2(100),
    latitude VARCHAR2(100),
    longitude VARCHAR2(100),
    country VARCHAR2(100)
);

CREATE TABLE Hours (
    idHours INT PRIMARY KEY,
    monday VARCHAR2(100),
    thuesday VARCHAR2(100),
    wednesday VARCHAR2(100),
    thursday VARCHAR2(100),
    friday VARCHAR2(100),
    saturday VARCHAR2(100),
    sunday VARCHAR2(100)
);

CREATE TABLE Year (
    idYears INT PRIMARY KEY,
    year INT
);

CREATE TABLE Business (
    idBusiness INT PRIMARY KEY, -- On met un id pour chaque entité
    idInfo INT REFERENCES BusinessInfo(idInfo),
    idCat INT REFERENCES Categories(idCat),
    idReviews INT REFERENCES Reviews(idReviews),
    idAtt INT REFERENCES Attributes(idAtt),
    idLoc INT REFERENCES Localisation(idLoc),
    idHours INT REFERENCES Hours(idHours),
    idYears INT REFERENCES Year(idYears),
    Stars NUMBER(2,1),
    Evolution NUMBER(5,2),
);

CREATE TABLE Categories (
    idCat INT PRIMARY KEY,
);

CREATE TABLE Attributes (
    idAtt INT PRIMARY KEY,
);

CREATE TABLE CategoriesList (
    idCat INT REFERENCES Categories(idCat),
    nom VARCHAR2(100)
);

CREATE TABLE AttributesList (
    idAtt INT REFERENCES Attributes(idAtt),
    nom VARCHAR2(100)
);

ALTER TABLE Business ADD CONSTRAINT unicite UNIQUE (idInfo, idCat, idReviews, idAtt, idLoc, idHours, idYears);
