-- Database: ticketing

/* Queries Analysis section */

-- P1 - What are the titles, dates, and times of the shows registered in the database?
SELECT *
FROM   public.SHOW
LIMIT  5;

SELECT title,
       date,
       time
FROM   public.SHOW 

-- P2 - What are the categories and titles of the shows registered in the database?

SELECT show_type,
       title
FROM   PUBLIC.show 

-- P3) What are the names and birth dates of the registered singers? Sort the result by birth date in ascending order.

SELECT * 
FROM artist
LIMIT 5

SELECT NAME,
       birth_date
FROM   artist
ORDER  BY birth_date ASC 

-- P4) What are the emails and names of the spectators from Porto? Sort the result by email.
SELECT * 
FROM spectator
LIMIT 5

SELECT email,
       NAME
FROM   spectator
WHERE  1 = 1
       AND city = 'Porto'
ORDER  BY email 

-- P5) For each artist, list their name along with the date and title of the shows in which they were the main artist. Sort the result by artist name (ascending) and show date (descending).

SELECT a.NAME,
       COALESCE(s.date::text,'No date') as date, 
       COALESCE(s.title,'No title') as title
FROM   PUBLIC.artist a
       LEFT JOIN PUBLIC.show s
              ON s.nif = a.nif
ORDER  BY a.NAME ASC,
          s.date DESC 

-- COALESCE is used to handle NULL values and return a string for warning with info. in this case

-- P6) For each spectator, list their name along with the seat and the cost of the tickets they purchased. Sort the result by spectator name (ascending) and ticket cost (descending).

-- with coalesce
SELECT sp.name,
       Coalesce(t.seat :: text, 'No seat')          AS seat,
       Coalesce(t.actual_price :: text, 'No price') AS actual_price
FROM   public.spectator sp
       left join public.ticket t
              ON t.email = sp.email
ORDER  BY sp.name ASC,
          t.actual_price DESC 

-- without coalesce
SELECT sp.NAME,
       t.seat,
       t.actual_price
FROM   PUBLIC.spectator sp
       LEFT JOIN PUBLIC.ticket t
              ON t.email = sp.email
ORDER  BY sp.NAME ASC,
          t.actual_price DESC; 

-- P7) List, without duplicates, the names of the spectators who bought tickets for shows, along with the name of the artist.

SELECT DISTINCT sp.NAME AS spectator_name,
                a.NAME  AS artist_name
FROM   PUBLIC.spectator sp
       INNER JOIN PUBLIC.ticket t
               ON t.email = sp.email
       LEFT JOIN PUBLIC.show s
              ON s.id = t.id
       LEFT JOIN PUBLIC.artist a
              ON a.nif = s.nif 

-- P8) List the names of all people — both spectators and artists — as long as the spectators are from Porto and the artists are actors.

SELECT NAME
FROM   PUBLIC.spectator
WHERE  1 = 1
       AND city = 'Porto'
UNION
SELECT NAME
FROM   PUBLIC.artist
WHERE  1 = 1
       AND artist_type = 'ator' 


-- P9) List the names of all people who are not from Porto and who are not artist names.

SELECT NAME
FROM   PUBLIC.spectator
WHERE  1 = 1
       AND city != 'Porto'
       AND NAME NOT IN (SELECT NAME
                        FROM   PUBLIC.artist)  -- a subquery usage in WHERE (classic one)

-- P10) What is the total revenue per show? Show the show ID, title, and total ticket value.

SELECT s.id,
       s.title,
       COALESCE(Sum(t.actual_price), 0) AS total_actual_revenue
FROM   PUBLIC.show s
       LEFT JOIN PUBLIC.ticket t
              ON t.id = s.id
WHERE  s.date < CURRENT_DATE
GROUP  BY s.id,
          s.title
ORDER  BY s.id; 


-- P11) What is the total revenue per show category? Show the category and the total ticket value.

SELECT s.show_type,
       COALESCE(Sum(t.actual_price), 0) AS total_actual_revenue
FROM   PUBLIC.show s
       LEFT JOIN PUBLIC.ticket t
              ON t.id = s.id
WHERE  s.date < CURRENT_DATE
GROUP  BY 1
ORDER  BY 1;


-- P12) Which spectator(s) (email) attended all shows by Tony Carreira?

/* -- helper
SELECT COUNT(*) as TC_shows_number
FROM public.show s
INNER JOIN public.artist a on a.nif = s.nif
WHERE 1=1
AND a.name = 'Tony Carreira' */

-- subquery usage + having count
SELECT sp.email,
       sp.NAME,
       Count(*) AS TC_attendance_number
FROM   PUBLIC.spectator sp
       INNER JOIN PUBLIC.ticket t
               ON t.email = sp.email
       INNER JOIN PUBLIC.show s
               ON s.id = t.id
       INNER JOIN PUBLIC.artist a
               ON a.nif = s.nif
WHERE  1 = 1
       AND a.NAME = 'Tony Carreira'
GROUP  BY 1,
          2
HAVING Count(*) = (SELECT Count(*) AS TC_shows_number
                   FROM   PUBLIC.show s
                          INNER JOIN PUBLIC.artist a
                                  ON a.nif = s.nif
                   WHERE  1 = 1
                          AND a.NAME = 'Tony Carreira') 
-- with CTE expression

WITH tc_shows_count
     AS (SELECT Count(*) AS TC_shows_number
         FROM   PUBLIC.show s
                INNER JOIN PUBLIC.artist a
                        ON a.nif = s.nif
         WHERE  1 = 1
                AND a.NAME = 'Tony Carreira'),
     tc_attendance_track
     AS (SELECT sp.email,
                sp.NAME,
                Count(*) AS TC_attendance_number
         FROM   PUBLIC.spectator sp
                INNER JOIN PUBLIC.ticket t
                        ON t.email = sp.email
                INNER JOIN PUBLIC.show s
                        ON s.id = t.id
                INNER JOIN PUBLIC.artist a
                        ON a.nif = s.nif
         WHERE  1 = 1
                AND a.NAME = 'Tony Carreira'
         GROUP  BY 1,
                   2)
SELECT ta.email,
       ta.NAME
FROM   tc_attendance_track ta
       INNER JOIN tc_shows_count tc
               ON tc.tc_shows_number = ta.tc_attendance_number 