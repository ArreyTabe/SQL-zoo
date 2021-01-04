/* The example uses a WHERE clause to show the population of 'France'.
 We modify it to show that of Togo
*/

SELECT population FROM world
  WHERE name = 'togo'

/*
Checking a list The word IN allows us to check if an item is in a list. 
The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
*/

SELECT name, population FROM world
  WHERE name IN ('Brazil', 'Russia', 'India', 'China', 'Sweden', 'Norway', 'Denmark');


  /*
  Which countries are not too small and not too big?
   BETWEEN allows range checking (range specified is inclusive of boundary values). 
   The example query shows countries with an area of 250,000-300,000 sq. km.

   Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
  */

  SELECT name, area FROM world
  WHERE area BETWEEN 2000000 AND 2500000



  /*
  SELECT from WORLD Tutorial
  */



  /*
  In this tutorial you will use the SELECT command on the table world:
  */

  /*
  Observe the result of running this SQL 
  command to show the name, continent and population of all countries.
  */

  SELECT name, continent, population FROM world


  /*
  How to use WHERE to filter records. Show the name for the countries 
  that have a population of at least 200 million. 
  200 million is 200000000, there are eight zeros.
  */

  SELECT name
  FROM world
 WHERE population > 1000000000

 /*

Give the name and the per capita GDP 
for those countries with a population of at least 200 million.
 */

 SELECT name, gdp/population FROM world
WHERE population >= 200000000;


/*South America In millions*/


/*Show the name and population in millions for the countries 
of the continent 'South America'.
Divide the population by 1000000 to get population in millions.*/

SELECT name, population/1000000 
FROM world
WHERE continent =  'South America';


/*France, Germany, Italy*/

/*Show the name and population for France, Germany, Italy*/

SELECT name, population 
FROM world 
WHERE name IN ('France', 'Germany', 'Italy')

/*United*/

/*
Show the countries which have a name that includes the word 'United'*/

SELECT name FROM world
WHERE name LIKE '%United%';


/*Two ways to be big*/

/*
Two ways to be big:
 A country is big if it has an area of more than 
 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.*/

SELECT name, population, area FROM world 
WHERE area > 3000000 OR population > 250000000;



/*One or the other (but not both)*/

/*
Exclusive OR (XOR). Show the countries 
that are big by area (more than 3 million) or 
big by population (more than 250 million) 
but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.*/


SELECT name, population, area FROM world
 WHERE
area > 3000000 XOR population > 250000000;


/*Rounding*/

/*
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.*/

SELECT name, ROUND(population/1000000,2), 
ROUND(gdp/1000000000,2)
FROM world

WHERE continent = 'South America';


/*Trillion dollar economies*/

/*
10.
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.*/

SELECT name, ROUND(gdp/population, -3) FROM world

WHERE gdp > 1000000000000;


/*Name and capital have the same length*/

/*
11.
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

You can use the LENGTH function to find the number of characters in a string*/

SELECT name,      LENGTH(name),
       continent, LENGTH(continent),
       capital, LENGTH(capital)
  FROM world
 WHERE name LIKE 'G%' AND  LENGTH(name) = LENGTH(capital);


 /*Matching name and capital*/

 /*
12.
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.*/

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1);

SELECT name
   FROM world

 WHERE 

name LIKE '%A%' AND
 name LIKE '%E%' AND 
name LIKE '%I%' AND 
name LIKE '%O%' AND 
name LIKE '%U%' AND 
name NOT LIKE '% %'




/*SELECT from Nobel Tutorial*/



/*nobel Nobel Laureates
We continue practicing simple SQL queries on a single table.

This tutorial is concerned with a table of Nobel prize winners:

nobel(yr, subject, winner)
Using the SELECT statement.



Winners from 1950*/

/*
1.
Change the query shown so that it displays Nobel prizes for 1950.*/

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950


 /*1962 Literature
2.
Show who won the 1962 prize for Literature.*/

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

/*Albert Einstein
3.
Show the year and subject that won 'Albert Einstein' his prize.*/

   SELECT yr, subject from nobel
WHERE 
winner = 'Albert Einstein'

/*Recent Peace Prizes
4.
Give the name of the 'Peace' winners since the year 2000, including 2000.*/

SELECT winner FROM nobel

WHERE  subject = 'peace' AND yr >= 2000;

/*Literature in the 1980's
5.
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.*/

 SELECT yr, subject, winner FROM nobel
WHERE 

subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

/*Only Presidents
6.
Show all details of the presidential winners:

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama*/

SELECT * FROM nobel
 WHERE

 winner IN ('Theodore Roosevelt',
               'Woodrow Wilson',
               'Jimmy Carter',
               'Barack Obama')


/*John
7.
Show the winners with first name John*/   

SELECT winner FROM nobel 

WHERE winner LIKE 'John%';


/*Chemistry and Physics from different years
8.
Show the year, subject, and name of Physics 
winners for 1980 together with the Chemistry winners for 1984.*/

SELECT * FROM nobel 

WHERE

        (subject = 'Physics'
        AND yr = 1980)
    
    OR (subject = 'Chemistry'
        AND yr = 1984);


/*Exclude Chemists and Medics
9.
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine*/

SELECT * FROM nobel

WHERE yr = 1980
AND subject NOT IN ('chemistry', 'medicine')


/*Early Medicine, Late Literature

10.
Show year, subject, and name of people who won a
 'Medicine' prize in an early year (before 1910, not including 1910)
 together with winners of a 'Literature' prize in 
 a later year (after 2004, including 2004)*/

 SELECT * FROM nobel 

WHERE 
      (subject = 'medicine'
       AND yr < 1910)
OR 
       (subject = 'Literature' 
         AND yr >= 2004)


/*Nobel Quiz
Harder Questions
Umlaut
11.
Find all details of the prize won by PETER GRÜNBERG*/

SELECT *  FROM nobel
WHERE 
winner = 'PETER GRÜNBERG';

/*Apostrophe
12.
Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes*/

SELECT *  FROM nobel
WHERE 
winner = 'EUGENE O''NEILL';



/*Knights of the realm
13.
Knights in order

List the winners, 
year and subject where the winner starts with Sir. 
Show the the most recent first, then by name order.*/

SELECT winner, yr, subject FROM nobel
WHERE 
winner LIKE 'Sir%' 
  ORDER BY yr DESC


  /*Chemistry and Physics last
14.
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject
 ordered by subject and winner name;
  but list Chemistry and Physics last.*/



  SELECT winner, subject 
  FROM nobel
 WHERE yr=1984
ORDER BY
    subject IN ('Physics', 'Chemistry'),
    subject,
    winner 




    /*SELECT within SELECT Tutorial
*/

/*Bigger than Russia
1.
List each country name where the population is larger than that of 'Russia'.

world(name, continent, area, population, gdp)*/

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

 /*Richer than UK
2.
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

Per Capita GDP*/     

SELECT name 
FROM world WHERE
continent = 'Europe' AND
gdp/population >
  (SELECT gdp/population FROM world WHERE  
  name = 'United Kingdom')


  /*Neighbours of Argentina and Australia
3.

List the name and continent 
of countries in the continents 
containing either Argentina or Australia.
 Order by name of the country.*/

 SELECT name, continent FROM world

WHERE continent IN (
SELECT continent FROM world 
WHERE name IN ('Argentina', 'Australia'))

ORDER BY name;


/*Between Canada and Poland
4.
Which country has a population that
 is more than Canada but less than Poland? 
 Show the name and the population.*/

 SELECT name, population FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland')



/*Percentages of Germany
5.
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:

name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	...
Decimal places
Percent symbol %*/

SELECT name, CONCAT(ROUND(100*population/(SELECT population  
                        FROM world WHERE name = 'Germany'))
                      , '%')

FROM world
                          

WHERE continent = 'Europe';

/*Bigger than every country in Europe
6.
Which countries have a GDP greater than 
every country in Europe? [Give the name only.] 
(Some countries may have NULL gdp values)*/

SELECT name 
FROM world 
WHERE gdp > ALL(SELECT gdp
                  FROM world
               WHERE continent = 'Europe' AND gdp > 0)

  /*Largest in each continent
7.
Find the largest country (by area) 
in each continent, show the continent, the name and the area:*/


SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area >0)

/*First country of each continent (alphabetically)
8.
List each continent and the name 
of the country that comes first alphabetically.*/

SELECT continent, name 
FROM world x
WHERE name <=
     ALL(SELECT name FROM world y
       WHERE x.continent = y.continent);

    
/*Difficult Questions That Utilize Techniques Not Covered In Prior Sections
9.
Find the continents where all countries have a population <= 25000000. Then find the names of 
the countries associated with 
these continents. Show name, continent and population.*/

SELECT  name, continent, population
FROM world 
WHERE continent IN (
   SELECT continent
     FROM world x 
     WHERE
     25000000 >= (
     SELECT MAX(population)
     FROM world y WHERE
   x.continent = y.continent))


/*10.
Some countries have populations more than three
 times that of any of their
  neighbours (in the same continent). Give the countries and continents.*/

  SELECT name, continent 
FROM world x
WHERE
    population > ALL(
        SELECT 3 * population
        FROM
            world y
        WHERE
            x.continent = y.continent
            AND x.name <> y.name
    ) 


/*1.
Show the total population of the world.

world(name, continent, area, population, gdp)*/

SELECT SUM(population)
FROM world

/*List of continents
2.
List all the continents - just once each.*/

SELECT DISTINCT continent 
FROM world

/*
GDP of Africa
3.
Give the total GDP of Africa*/

SELECT SUM(gdp) FROM world
WHERE continent = 'Africa';

/*Count the big countries
4.
How many countries have an area of at least 1000000*/

SELECT COUNT(name) FROM world
WHERE area >=1000000

/*Baltic states population
5.
What is the total population of 
('Estonia', 'Latvia', 'Lithuania')*/

SELECT SUM(population) FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

/*Using GROUP BY and HAVING*/

/*
You may want to look at these examples: Using GROUP BY and HAVING.

Counting the countries of each continent
6.
For each continent show the continent and number of countries.*/

SELECT continent, COUNT(name)  FROM world
GROUP BY continent

/*Counting big countries in each continent
7.
For each continent show the 
continent and number of countries 
with populations of at least 10 million.*/

SELECT continent, COUNT(name) FROM world
WHERE population >= 10000000

GROUP BY continent

/*Counting big continents
8.
List the continents that have a total population of at least 100 million*/

SELECT continent FROM world

GROUP BY continent

HAVING sum(population) >= 100000000