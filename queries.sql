-- write your queries here
-- Write the following SQL commands to produce the necessary output

-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id. Your output should look like this:
/*
id | first_name | last_name | id |  make  |  model  | year |  price  | owner_id
----+------------+-----------+----+--------+---------+------+---------+----------
  1 | Bob        | Hope      |  1 | Toyota | Corolla | 2002 | 2999.99 |        1
  1 | Bob        | Hope      |  2 | Honda  | Civic   | 2012 |   13000 |        1
  2 | Jane       | Smith     |  3 | Nissan | Altima  | 2016 |   24000 |        2
  2 | Jane       | Smith     |  4 | Subaru | Legacy  | 2006 | 5999.99 |        2
  3 | Melody     | Jones     |  5 | Ford   | F150    | 2012 | 2599.99 |        3
  3 | Melody     | Jones     |  6 | GMC    | Yukon   | 2016 |   13000 |        3
  4 | Sarah      | Palmer    |  7 | GMC    | Yukon   | 2014 |   23000 |        4
  4 | Sarah      | Palmer    |  8 | Toyota | Avalon  | 2009 |   13000 |        4
  4 | Sarah      | Palmer    |  9 | Toyota | Camry   | 2013 |   13000 |        4
  5 | Alex       | Miller    | 10 | Honda  | Civic   | 2001 | 7999.99 |        5
  6 | Shana      | Smith     | 11 | Nissan | Altima  | 1999 | 1899.99 |        6
  6 | Shana      | Smith     | 12 | Lexus  | ES350   | 1998 | 1599.99 |        6
  6 | Shana      | Smith     | 13 | BMW    | 300     | 2012 |   23000 |        6
  6 | Shana      | Smith     | 14 | BMW    | 700     | 2015 |   53000 |        6
  7 | Maya       | Malarkin  |    |        |         |      |         |
(15 rows)
*/

SELECT * 
FROM owners o 
FULL OUTER JOIN vehicles v 
ON o.id = v.owner_id 
ORDER BY o.id;

-- Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order. Your output should look like this:
/*
first_name | last_name | count
------------+-----------+-------
Alex       | Miller    |     1
Bob        | Hope      |     2
Jane       | Smith     |     2
Melody     | Jones     |     2
Sarah      | Palmer    |     3
Shana      | Smith     |     4
(6 rows)
*/

SELECT o.first_name, o.last_name, COUNT(*) AS count 
FROM owners o 
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY o.id
ORDER BY o.first_name ASC;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000. Your output should look like this:

/*
first_name | last_name | average_price | count
------------+-----------+---------------+-------
Shana      | Smith     |         19875 |     4
Sarah      | Palmer    |         16333 |     3
Jane       | Smith     |         15000 |     2
*/

SELECT o.first_name, o.last_name, 
ROUND(AVG(v.price)) AS average_price, 
COUNT(*) AS vehicle_count
FROM owners o
JOIN vehicles v 
ON o.id = v.owner_id
GROUP BY o.first_name, o.last_name 
HAVING ROUND(AVG(v.price)) > 10000 
AND COUNT(*) > 1
ORDER BY o.first_name DESC;

-- SQLZOO.net # 6 JOIN
1. SELECT matchid, player FROM goal WHERE teamid = 'GER';

2. SELECT id,stadium,team1,team2
  FROM game WHERE id=1012;

3. SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (game.id=goal.matchid)
 WHERE teamid='GER';

4. SELECT team1, team2, player FROM game JOIN goal ON game.id = goal.matchid WHERE player LIKE 'Mario%';

5. SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON goal.teamid = eteam.id
 WHERE gtime<=10

6. SELECT mdate, teamname 
FROM game 
JOIN eteam ON game.team1 = eteam.id
WHERE coach='Fernando Santos';

7. SELECT player FROM goal JOIN game ON goal.matchid = game.id
WHERE stadium='National Stadium, Warsaw';

8. SELECT DISTINCT player
   FROM game JOIN goal ON matchid = id 
   WHERE (team1='GER' OR team2='GER') AND teamid!='GER';

9. SELECT teamname, COUNT(*)
   FROM eteam JOIN goal ON goal.teamid = eteam.id
   GROUP BY teamname
   ORDER BY teamname

10. SELECT stadium, COUNT(*) AS goals_scored
    FROM game JOIN goal ON game.id = goal.matchid
    GROUP BY stadium
    ORDER BY stadium;

11. SELECT matchid, mdate, COUNT(*)
    FROM game JOIN goal ON game.id = goal.matchid 
    WHERE (team1 = 'POL' OR team2 = 'POL')
    GROUP BY matchid, mdate
    ORDER BY matchid;

12. SELECT matchid, mdate, COUNT(*)
    FROM game JOIN goal ON game.id = goal.matchid
    WHERE teamid='GER'
    GROUP BY matchid, mdate
    ORDER BY matchid;

-- WRONG ANSWER
13. SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game JOIN goal ON goal.matchid = game.id
  GROUP BY mdate, team1, team2, matchid
  ORDER BY mdate, matchid, team1, team2;

-- SQLZOO.net # 7 MORE JOIN
1. SELECT id, title
 FROM movie
 WHERE yr=1962

2. SELECT yr FROM movie WHERE title='Citizen Kane';

3. SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

4. SELECT id FROM actor WHERE name='Glenn Close';

5. SELECT id FROM movie WHERE title='Casablanca';

6. SELECT name FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE movieid=27;
-- or, WHERE title='Casablanca';

7. SELECT name FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE title='Alien';

8. SELECT title FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE name='Harrison Ford';

9. SELECT title FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE name='Harrison Ford' AND ord!=1;

10. SELECT title, name FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE ord=1 AND yr=1962;

11. SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1;

12. SELECT title, name 
FROM movie
JOIN casting ON (movie.id = casting.movieid AND ord=1)
JOIN actor ON actor.id = casting.actorid
WHERE movie.id IN (
    SELECT movieid FROM casting 
    WHERE actorid IN (
        SELECT id FROM actor 
        WHERE name='Julie Andrews'))

13. SELECT name FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE ord=1
GROUP BY name
HAVING COUNT(*) >= 15
ORDER BY name;

14. SELECT title, COUNT(*) FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE yr=1978
GROUP BY title
ORDER BY count(*) DESC, title;

15. SELECT name FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE name!='Art Garfunkel' AND movie.id IN (
    SELECT movieid FROM casting 
    WHERE actorid IN (
        SELECT id FROM actor 
        WHERE name='Art Garfunkel'))
ORDER BY name;