CREATE USER 'util1'@'%' IDENTIFIED BY 'testutil';
CREATE USER 'util2'@'%' IDENTIFIED BY 'testutil';
CREATE USER 'util3'@'%' IDENTIFIED BY 'testutil';

GRANT ALL PRIVILEGES ON Papyrus.* TO 'util1';
GRANT SELECT ON Papyrus.* TO 'util2';
GRANT SELECT ON Papyrus.fournis TO 'util3';