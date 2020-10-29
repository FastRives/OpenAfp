SELECT hot_nom, hot_ville FROM hotel;
SELECT cli_nom, cli_prenom, cli_adresse FROM client WHERE cli_nom = "White";
SELECT sta_nom, sta_altitude FROM station WHERE sta_altitude < 1000;
SELECT cha_numero, cha_capacite FROM chambre WHERE cha_capacite > 1;
SELECT cli_nom, cli_adresse FROM client WHERE cli_ville != "Londre";
SELECT hot_nom, hot_ville, hot_categorie FROM hotel WHERE hot_ville = "Bretou" AND hot_categorie > 3;

SELECT station.sta_nom, hotel.hot_nom, hotel.hot_categorie, hotel.hot_ville FROM station JOIN hotel ON station.sta_id = hotel.hot_sta_id;
SELECT hotel.hot_nom, hotel.hot_categorie, hotel.hot_ville, chambre.cha_numero FROM hotel JOIN chambre ON hotel.hot_id = chambre.cha_hot_id;
SELECT hotel.hot_nom, hotel.hot_categorie, hotel.hot_ville, chambre.cha_numero, chambre.cha_capacite FROM hotel JOIN chambre ON hotel.hot_id = chambre.cha_hot_id WHERE cha_capacite > 1 AND hot_ville = "Bretou";
SELECT reservation.res_id, reservation.res_date, client.cli_nom FROM reservation JOIN client ON reservation.res_cli_id = client.cli_id;
SELECT station.sta_nom, hotel.hot_nom, chambre.cha_numero, chambre.cha_capacite FROM station JOIN hotel ON station.sta_id = hotel.hot_sta_id JOIN chambre ON chambre.cha_hot_id = hotel.hot_id;
SELECT reservation.res_id, client.cli_nom, hotel.hot_nom, reservation.res_date_debut, reservation.res_date_fin - reservation.res_date_debut AS "Durée du séjour" FROM client JOIN reservation ON client.cli_id = reservation.res_cli_id JOIN chambre ON reservation.res_cha_id = chambre.cha_id JOIN hotel ON chambre.cha_hot_id = hotel.hot_id;

SELECT station.sta_nom, count(hotel.hot_id) AS "Nombre d'hotel dans la station" FROM station JOIN hotel ON station.sta_id = hotel.hot_sta_id GROUP BY station.sta_nom;
SELECT station.sta_nom, count(chambre.cha_id) FROM station JOIN hotel ON hotel.hot_sta_id = station.sta_id JOIN chambre ON hotel.hot_id = chambre.cha_hot_id GROUP BY station.sta_nom; 
SELECT station.sta_nom, count(chambre.cha_id) FROM station JOIN hotel ON hotel.hot_sta_id = station.sta_id JOIN chambre ON hotel.hot_id = chambre.cha_hot_id WHERE chambre.cha_capacite > 1 GROUP BY station.sta_nom
SELECT client.cli_nom, reservation.res_id, hotel.hot_nom FROM client JOIN reservation ON reservation.res_cli_id = client.cli_id JOIN chambre ON chambre.cha_id = reservation.res_cha_id JOIN hotel on hotel.hot_id = chambre.cha_hot_id WHERE cli_nom = "Squire"; 
SELECT station.sta_nom, avg(reservation.res_date_fin - reservation.res_date_debut) FROM station JOIN hotel ON station.sta_id = hotel.hot_sta_id JOIN chambre ON chambre.cha_hot_id = hotel.hot_id JOIN reservation ON reservation.res_cha_id = chambre.cha_id GROUP BY station.sta_nom;