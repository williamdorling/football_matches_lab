-- 1) Find all the matches from 2017.

SELECT * FROM matches WHERE season = 2017;


-- 2) Find all the matches featuring Barcelona.

SELECT * FROM matches WHERE hometeam = 'Barcelona' OR awayteam = 'Barcelona';


-- 3) What are the names of the Scottish divisions included?

SELECT DISTINCT name FROM Divisions WHERE country = 'Scotland';

-- Scottish Championship, Scottish League One, Scottish Premiership


-- 4) Find the value of the `code` for the `Bundesliga` division. 
-- Use that code to find out how many matches Freiburg have played in that division. 
-- HINT: You will need to query both tables

SELECT code FROM Divisions WHERE name = 'Bundesliga';
SELECT COUNT(*) FROM matches WHERE (hometeam = 'Freiburg' OR awayteam = 'Freiburg') AND division_code = 'D1';

-- D1, 374


-- 5) Find the teams which include the word "City" in their name. 

SELECT DISTINCT hometeam FROM Matches WHERE hometeam LIKE '%City%';

-- Bath City, Man City, Edinburgh City, Bristol City


-- 6) How many different teams have played in matches recorded in a French division?

SELECT code FROM Divisions WHERE country = 'France';
SELECT COUNT(DISTINCT hometeam) FROM Matches WHERE division_code = 'F1' OR division_code = 'F2';

-- 61


-- 7) Have Huddersfield played Swansea in any of the recorded matches?

SELECT COUNT(*) FROM matches WHERE hometeam = 'Huddersfield' AND awayteam = 'Swansea'; 
SELECT COUNT(*) FROM matches WHERE awayteam = 'Huddersfield' AND hometeam = 'Swansea'; 

-- Yes, 6 times each home and away


-- 8) How many draws were there in the `Eredivisie` between 2010 and 2015?

SELECT COUNT(*) FROM Matches WHERE division_code = 'D1' AND ftr = 'D' AND season >= 2010 AND season <= 2015;

-- 452


-- 9) Select the matches played in the Premier League in order of total goals scored from highest to lowest. 
-- When two matches have the same total the match with more home goals should come first.

SELECT code FROM Divisions WHERE name = 'Premier League';
SELECT * FROM Matches WHERE division_code = 'E0' ORDER BY (ftag + fthg, fthg) DESC;


-- 10) In which division and which season were the most goals scored?

SELECT  (division_code, season), SUM(ftag + fthg) AS total_score FROM Matches GROUP BY division_code, season ORDER BY total_score DESC LIMIT 1;
SELECT name FROM Divisions WHERE code = 'EC';

-- NAtional League, 2013