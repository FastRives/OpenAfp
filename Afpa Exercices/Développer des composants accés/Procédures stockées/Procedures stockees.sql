DELIMITER /

CREATE PROCEDURE LastOrderOf(IN CompanyName VARCHAR(50)) 
	BEGIN 
    	SELECT MAX(Orders.OrderDate) AS "Date de dernière commande" FROM Orders JOIN Customers ON Customers.CustomerID = Orders.CustomerID WHERE customers.CompanyName = CompanyName;
    END/
    
DELIMITER ;

------

DELIMITER /

CREATE PROCEDURE AvgLiv()
	BEGIN
    	SELECT Round(avg(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jour" FROM orders;
    END/

DELIMITER ;

