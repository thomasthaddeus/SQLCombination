USE employeedatabase;

DROP PROCEDURE IF EXISTS UpdateEmployeeGrossPay;

DELIMITER //

CREATE PROCEDURE UpdateEmployeeGrossPay (IN ID INT, IN NewGrossPay DECIMAL(13,2))
BEGIN

UPDATE Employee 
SET GrossPay = NewGrossPay
WHERE EmployeeID = ID;

END//

DELIMITER ;

CALL UpdateEmployeeGrossPay(3, 99383.22);

SELECT * FROM Employee WHERE EmployeeID = 3;

 