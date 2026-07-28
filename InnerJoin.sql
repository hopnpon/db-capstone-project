SELECT Customers.CustomerID, Customers.FullName, Orders.OrderID, Orders.TotalCost, Menus.MenuName, MenuItems.ItemName, MenuItems.ItemType 
FROM Customers INNER JOIN 
Orders ON Customers.CustomerID=Orders.CustomerID
INNER JOIN Menus ON Orders.MenuID=Menus.MenuID
INNER JOIN MenuItems ON Menus.ItemID=MenuItems.ItemID
WHERE Orders.TotalCost <150;
