DROP DATABASE IF EXISTS joins_exercise;

CREATE DATABASE joins_exercise;

\c joins_exercise

CREATE TABLE owners (id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT);

CREATE TABLE vehicles (id SERIAL PRIMARY KEY, make TEXT, model TEXT, year INTEGER, price REAL, owner_id INTEGER REFERENCES owners (id));

INSERT INTO owners (first_name, last_name) VALUES ('Bob', 'Hope');
INSERT INTO owners (first_name, last_name) VALUES ('Jane', 'Smith');
INSERT INTO owners (first_name, last_name) VALUES ('Melody', 'Jones');
INSERT INTO owners (first_name, last_name) VALUES ('Sarah', 'Palmer');
INSERT INTO owners (first_name, last_name) VALUES ('Alex', 'Miller');
INSERT INTO owners (first_name, last_name) VALUES ('Shana', 'Smith');
INSERT INTO owners (first_name, last_name) VALUES ('Maya', 'Malarkin');

INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Corolla', 2002, 2999.99, 1);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Honda', 'Civic', 2012, 12999.99, 1);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Nissan', 'Altima', 2016, 23999.99, 2);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Subaru', 'Legacy', 2006, 5999.99, 2);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Ford', 'F150', 2012, 2599.99, 3);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('GMC', 'Yukon', 2016, 12999.99, 3);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('GMC', 'Yukon', 2014, 22999.99, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Avalon', 2009, 12999.99, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Camry', 2013, 12999.99, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Honda', 'Civic', 2001, 7999.99, 5);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Nissan', 'Altima', 1999, 1899.99, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Lexus', 'ES350', 1998, 1599.99, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('BMW', '300', 2012, 22999.99, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('BMW', '700', 2015, 52999.99, 6);



game
id	    mdate	        stadium	                    team1	team2
1001	8 June 2012	    National Stadium, Warsaw	POL	    GRE
1002	8 June 2012	    Stadion Miejski (Wroclaw)	RUS	    CZE
1003	12 June 2012	Stadion Miejski (Wroclaw)	GRE	    CZE
1004	12 June 2012	National Stadium, Warsaw	POL	    RUS
...

goal
matchid	   teamid	player	                gtime
1001	   POL	    Robert Lewandowski 	    17
1001	   GRE	    Dimitris Salpingidis	51
1002	   RUS	    Alan Dzagoev	        15
1002	   RUS	    Roman Pavlyuchenko	    82
...

eteam
id	    teamname	    coach
POL	    Poland	        Franciszek Smuda
RUS	    Russia	        Dick Advocaat
CZE	    Czech Republic	Michal Bilek
GRE	    Greece	        Fernando Santos
...


XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

movie
id	    title	                yr	    director	    budget	    gross
10003	"Crocodile" Dundee II	1988	38	            15800000	239606210
10004	'Til There Was You	    1997	49	            10000000	


actor
id	    name
20	    Paul Hogan
50	    Jeanne Tripplehorn

casting
movieid	    actorid	    ord
10003	    20	        4
10004	    50	        1