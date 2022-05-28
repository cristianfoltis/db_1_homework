CREATE DATABASE homework;
USE homework;

CREATE TABLE Owners (
OwnerId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
FullName varchar(50) NOT NULL,
Email varchar(100) NOT NULL,
Pswd varchar(80),
Cnp varchar(13),
PhoneNumber int(10),
Address varchar(255)
);

CREATE TABLE Pets (
PetId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
NameOfPet varchar(50) NOT NULL,
PetType varchar(20),
DateOfBirth date,
Color varchar(20),
Weight float,
Owner_Id int not null,
FOREIGN KEY (Owner_Id) references owners(OwnerId) 
);

INSERT INTO Owners (FullName, Email, Pswd, Cnp, PhoneNumber, Address) 
VALUES ('Cristian Foltis', 'cristian.foltis@gmail.com', 'qwerty', '1940419322134',
0756885501, 'str.Dealul de Jos, nr.13, Cluj-Napoca');

INSERT INTO Owners (FullName, Email, Pswd, Cnp, PhoneNumber, Address) 
VALUES ('Adriana Manu', 'adriana.manu@gmail.com', 'qwertyui', '2940419432345',
0756543234, 'str.Dealul de Jos, nr.12, Cluj-Napoca');

INSERT INTO Owners (FullName, Email, Pswd, Cnp, PhoneNumber, Address) 
VALUES ('Diana Toma', 'diana.toma@gmail.com', 'qwertyuiq', '2930565423456',
0753456123, 'str.Avram Iancu, nr.264, Cluj-Napoca');

INSERT INTO Owners (FullName, Email, Pswd, Cnp, PhoneNumber, Address) 
VALUES ('Dan Mihai', 'dan.mihai@gmail.com', 'qwerty123', '1900412322123',
0756334401, 'str.Maramuresului, nr.155, Baia-Mare');

INSERT INTO Owners (FullName, Email, Pswd, Cnp, PhoneNumber, Address) 
VALUES ('Bogdan Mos', 'bogdan.mos@gmail.com', 'qwerty123456', '1900312334567',
0756334401, 'str.Maramuresului, nr.120, Baia-Mare');

INSERT INTO Owners (FullName, Email, Pswd, Cnp, PhoneNumber, Address) 
VALUES ('Muresan Denisa', 'muresan.denisa@gmail.com', 'qwertyqwe', '2900312787823',
0756334401, 'str.Cernei, nr.5, Cluj-Napoca');

INSERT INTO Pets (NameOfPet, PetType, DateOfBirth, Color, Weight, Owner_Id)
VALUES ('Bessie', 'dog','2015-03-22', 'brown', 20.22, 2);

INSERT INTO Pets (NameOfPet, PetType, DateOfBirth, Color, Weight, Owner_Id)
VALUES ('Lisa', 'dog','2018-03-12', 'black', 13.54, 1);

INSERT INTO Pets (NameOfPet, PetType, DateOfBirth, Color, Weight, Owner_Id)
VALUES ('Hulk', 'tiger','2013-02-12', 'brown', 64.22, 4);

INSERT INTO Pets (NameOfPet, PetType, DateOfBirth, Color, Weight, Owner_Id)
VALUES ('Woofy', 'dog','2020-01-22', 'black', 30.22, 1);

INSERT INTO Pets (NameOfPet, PetType, DateOfBirth, Color, Weight, Owner_Id)
VALUES ('Lea', 'cat','2018-01-25', 'white', 7.4, 5);

INSERT INTO Pets (NameOfPet, PetType, DateOfBirth, Color, Weight, Owner_Id)
VALUES ('Shelly', 'turtle','2016-10-12', 'green', 2.4, 4);



SELECT * FROM Pets WHERE MONTH(DateOfBirth) = 1;



SELECT  FullName, NameOfPet, PetType
FROM Owners
INNER JOIN Pets
ON Owners.OwnerId = Pets.Owner_Id
WHERE Pets.PetType = 'dog';



SELECT FullName, Cnp 
FROM Owners
HAVING SUBSTRING(Owners.Cnp,4,2) = '03';



SELECT FullName, Address
FROM Owners
WHERE Address LIKE '%Cluj-Napoca%';



SELECT FullName, Address
FROM Owners
WHERE EXISTS (
SELECT COUNT(*)
FROM    Pets
WHERE Owners.Ownerid = Pets.Owner_Id
GROUP BY OwnerId
HAVING  COUNT(*) > 1);


SELECT  FullName, PetType
FROM Owners
INNER JOIN Pets
ON Owners.OwnerId = Pets.Owner_Id
WHERE Pets.PetType = 'dog'
GROUP BY Owners.OwnerId
HAVING COUNT(*) = 2;

SELECT COUNT(*) AS PeopleHavingLabrador
FROM(
SELECT FullName, NameOfPet, PetType, Weight
FROM Owners
INNER JOIN Pets
ON Owners.OwnerId = Pets.Owner_Id
WHERE Pets.PetType = 'labrador') Owners;

SELECT COUNT(*) AS DogsOver30KG FROM(
SELECT  FullName, NameOfPet, PetType, Weight
FROM Owners
INNER JOIN Pets
ON Owners.OwnerId = Pets.Owner_Id
WHERE Pets.Weight > 30) Owners;

   