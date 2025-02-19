--1 
CREATE TABLE Staff (
StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
StaffName VARCHAR(20) NOT NULL,
StaffAddress VARCHAR(50) CHECK (StaffAddress LIKE '% Street') NOT NULL
)

--2
ALTER TABLE Sword
ADD SwordCreatedDate DATE

ALTER TABLE Sword
ADD CONSTRAINT SwordConstraint CHECK (SwordDamage between 0 AND 120)

SELECT * FROM Sword

--3
INSERT INTO Customer(CustomerID,CustomerName, CustomerGender, CustomerEmail, CustomerAddress,CustomerDOB)
VALUES ('CU011', 'William Thanus', 'Male', 'William.thanus@mail.com', '2 Hermina Park', '15 December 2020')

SELECT * FROM Customer

--4
SELECT SwordID, SwordName, SwordDamage
FROM Sword
WHERE SwordDamage between 50 AND 90

--5
BEGIN TRAN

UPDATE Sword
SET SwordDamage +=10
FROM Sword, DetailTransaction
WHERE Sword.SwordID = DetailTransaction.SwordID
AND Qty < 5

ROLLBACK

SELECT * FROM Sword