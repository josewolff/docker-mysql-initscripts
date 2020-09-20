USE apiDB;
DELIMITER //
CREATE PROCEDURE initTables ()

BEGIN

	DECLARE ExistCountUsers INT;
    DECLARE ExistCountCompanies INT;

	CREATE TABLE IF NOT EXISTS users
	(id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(32) NOT NULL,
	firstname VARCHAR(32),
	lastname VARCHAR(32),
	email VARCHAR(32),
	PRIMARY KEY (id)
	);

	CREATE TABLE IF NOT EXISTS companies
	(id INT NOT NULL AUTO_INCREMENT,
	companyname VARCHAR(32) NOT NULL,
	street VARCHAR(32),
	phonenumber VARCHAR(10),
	PRIMARY KEY (id)
	);

	
	SET ExistCountUsers = (SELECT COUNT(1) FROM users);
    SET ExistCountCompanies = (SELECT COUNT(1) FROM companies);

	IF ExistCountUsers = 0 THEN
		INSERT INTO users (username,firstname,lastname,email) VALUES ('UserName','FirstName','LastName','username@gmail.com');	
	END IF;

    IF ExistCountCompanies = 0 THEN	
		INSERT INTO companies (companyname, street,phonenumber) VALUES ('TestAutomationCompany','Street','3105436789');	
	END IF;

	END //
DELIMITER ;


CALL initTables ()