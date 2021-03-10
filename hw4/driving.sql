CREATE TABLE InsuranceCo (
    name VARCHAR(100) PRIMARY KEY,
    phone INT
);

CREATE TABLE Person (
    ssn INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Vehicle (
    licensePlate VARCHAR(100) PRIMARY KEY,
    year INT,
    name VARCHAR(100) REFERENCES InsuranceCo(name),
    ssn INT REFERENCES Person(ssn),
    maxLiability REAL
);

CREATE TABLE Driver (
    driverID INT,
    ssn INT PRIMARY KEY, 
    FOREIGN KEY(ssn) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver (
    ssn INT PRIMARY KEY,
    FOREIGN KEY(ssn) REFERENCES Driver(ssn)
);

CREATE TABLE ProfessionalDriver (
    ssn INT PRIMARY KEY,
    FOREIGN KEY(ssn) REFERENCES Driver(ssn),
    medicalHistory VARCHAR(100)
);

CREATE TABLE Car (
    make varchar(100),
    licensePlate VARCHAR(100) PRIMARY KEY,
    FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE CarDriver (
    licensePlate VARCHAR(100) REFERENCES Car(licensePlate),
    ssn INT REFERENCES NonProfessionalDriver(ssn),
    PRIMARY KEY(licensePlate, ssn)
);

CREATE TABLE Truck (
    capacity INT,
    licensePlate VARCHAR(100) PRIMARY KEY,
    FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate),
    ssn INT REFERENCES ProfessionalDriver(ssn)
);

/*

b.  In order to represent the relation "insures", in my table Vehicle, I utilize the name 
    as a foreign key which references the InsuranceCo name. Since "insures" is a many to one relation,
    I could use a foreign key.

c.  "Drives" is a many to many relation and "Operate" is a many to one relation.  Thus for the many to many
    relation we could use another table to represent the relation which is the CarDriver table. And for the 
    many to one relation, we could use a foreign key reference to draw the relation between truck 
    and professional driver, which is the ssn of the professional driver.

*/