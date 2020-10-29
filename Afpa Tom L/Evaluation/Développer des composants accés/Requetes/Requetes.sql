SELECT CompanyName AS "société", ContactName AS "contact", ContactTitle AS "Fonction", Phone AS "Téléphone" FROM Customers WHERE country = "France" ORDER BY CompanyName;

SELECT products.ProductName AS "Produit", products.UnitPrice AS "Prix" FROM products JOIN Suppliers ON products.SupplierID = Suppliers.SupplierID WHERE suppliers.CompanyName = "Exotic Liquids";

SELECT Suppliers.CompanyName AS "Fournisseur", count(products.ProductID) AS "Nbre produits" FROM Suppliers JOIN products ON products.SupplierID = suppliers.SupplierID WHERE suppliers.Country = "France" GROUP BY suppliers.CompanyName ORDER BY count(products.ProductID) DESC;

SELECT customers.CompanyName AS "Client", count(orders.OrderID) AS "Nbre commandes" FROM customers JOIN orders ON Orders.CustomerID = customers.CustomerID WHERE customers.country = "France" GROUP BY customers.CompanyName HAVING count(orders.OrderID) > 10

SELECT customers.CompanyName AS "Client", sum(`order details`.unitPrice * `order details`.Quantity) AS "CA", customers.Country AS "Pays" FROM customers JOIN Orders ON orders.CustomerID = customers.CustomerID JOIN `order details` ON `order details`.OrderID = orders.OrderID GROUP BY customers.CompanyName HAVING sum(`order details`.unitPrice * `order details`.Quantity) > 30000 ORDER BY sum(`order details`.unitPrice * `order details`.Quantity) DESC;

SELECT customers.country AS "Pays" FROM customers JOIN Orders ON Orders.customerID = customers.CustomerID JOIN `order details` ON `order details`.OrderID = Orders.OrderID JOIN products ON products.ProductID = `order details`.`ProductID` JOIN Suppliers ON suppliers.SupplierID = products.SupplierID WHERE suppliers.CompanyName = "Exotic Liquids" GROUP BY customers.Country HAVING count(`order details`.OrderID) > 0 ORDER BY Pays;

SELECT sum(`order details`.UnitPrice * `order details`.Quantity) AS "Montant Ventes 97" FROM `order details` JOIN orders ON orders.OrderID = `order details`.OrderID WHERE Orders.OrderDate LIKE "%1997%";

SELECT MONTH(orders.OrderDate) AS "Mois 97", sum(`order details`.UnitPrice * `order details`.Quantity) AS "Montant Ventes 97" FROM `order details` JOIN orders ON orders.OrderID = `order details`.OrderID WHERE Orders.OrderDate LIKE "%1997%" GROUP BY `Mois 97`;

SELECT MAX(Orders.OrderDate) AS "Date de dernière commande" FROM Orders JOIN Customers ON Customers.CustomerID = Orders.CustomerID WHERE customers.CompanyName = "Du monde entier";

SELECT Round(avg(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jour" FROM orders;