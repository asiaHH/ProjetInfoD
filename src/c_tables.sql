

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
    idBusiness INT PRIMARY KEY,
    businessIdentifier VARCHAR2(50) 
);
    -- Une chaine de caractère de peut pas être identifiant
    --  Donc on déporte l'identifiant dans une autre table 

CREATE TABLE Entity (
    idE INT PRIMARY KEY, -- On met un id pour chaque entité
    idBusiness INT REFERENCES Business(idBusiness),
    --idCat INT REFERENCES Categories(idCat),
    idReviews INT REFERENCES Reviews(idReviews),
    --idAtt INT REFERENCES Attributes(idAtt),
    idLoc INT REFERENCES Localisation(idLoc),
    idHours INT REFERENCES Hours(idHours),
    idYears INT REFERENCES Year(idYears),
    Stars NUMBER(2,1),
    Evolution NUMBER(5,2)
);
