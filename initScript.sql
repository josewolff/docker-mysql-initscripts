USE apiDB;
DELIMITER //
CREATE PROCEDURE initTables ()

BEGIN

	DECLARE ExistCountUsers INT;
    DECLARE ExistCountCompanies INT;

	CREATE TABLE IF NOT EXISTS users
	(id INT NOT NULL AUTO_INCREMENT,
	userName VARCHAR(32) NOT NULL,
	firstName VARCHAR(32),
	lastname VARCHAR(32),
	email VARCHAR(32),
	PRIMARY KEY (id)
	);

	CREATE TABLE IF NOT EXISTS companies
	(id INT NOT NULL AUTO_INCREMENT,
	companyName VARCHAR(32) NOT NULL,
	street VARCHAR(32),
	phoneName VARCHAR(10),
	PRIMARY KEY (id)
	);

	
	SET ExistCountUsers = (SELECT COUNT(1) FROM users);
    SET ExistCountCompanies = (SELECT COUNT(1) FROM companies);

	IF ExistCountUsers = 0 THEN
		INSERT INTO users (userName,firstName,lastname,email) VALUES ('UserName','FirstName','LastName','username@gmail.com');	
	END IF;

    IF ExistCountCompanies = 0 THEN	
		INSERT INTO companies (companyName, street,phoneName) VALUES ('TestAutomationCompany','Street','3105436789');	
	END IF;

	END //
DELIMITER ;


CALL initTables ()