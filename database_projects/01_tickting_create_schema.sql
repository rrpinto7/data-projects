-- Database: ticketing

/*
DROP DATABASE IF EXISTS ticketing;
*/

-- for reruns
DROP TABLE IF EXISTS public.ticket;
DROP TABLE IF EXISTS public.spectator;
DROP TABLE IF EXISTS public.show;
DROP TABLE IF EXISTS public.artist;


/* TABLES CREATION */

-- Table: artist
CREATE TABLE PUBLIC.artist
  (
     nif         CHARACTER VARYING (20) PRIMARY KEY,
     -- since it won't be used for for mathematical operations, decided to treat it as string
     NAME        CHARACTER VARYING(100) NOT NULL,
     birth_date  DATE,
     artist_type CHARACTER VARYING (20)
  ); 

-- Table: show
CREATE TABLE PUBLIC.show
  (
     id              SERIAL PRIMARY KEY, -- didnt use numeric since we dont need decimal-like
     title           CHARACTER VARYING(100) NOT NULL,
     date            DATE NOT NULL,
     time            INTEGER NOT NULL,-- integer to allow import 
     reference_price NUMERIC (10, 2) NOT NULL,
     show_type       CHARACTER VARYING (20),
     nif             CHARACTER VARYING (20) REFERENCES PUBLIC.artist(nif) -- or nif serial and \n FOREIGN KEY (nif) REFERENCES public.artist(nif)
  ); 

    /*
    -> This last column nif will store values that must exist in public.artist(nif).
    
    So PostgreSQL:
    
    - Enforces referential integrity
    
    - Will block inserts/updates, if the nif value doesn't exist in public.artist(nif)
  */

-- Table: spectator
CREATE TABLE PUBLIC.spectator
  (
     email VARCHAR(20) PRIMARY KEY,
     NAME  CHARACTER VARYING (100) NOT NULL,
     city  CHARACTER VARYING (20)
  ); 
  
-- Table: ticket
CREATE TABLE PUBLIC.ticket
  (
     id           INTEGER,
          FOREIGN KEY (id) REFERENCES PUBLIC.show(id),
          seat         INTEGER NOT NULL,
          email        VARCHAR(20),
          FOREIGN KEY (email) REFERENCES PUBLIC.spectator(email),
          -- it shouldn't be and email on PK conception as good pratice... self-note
          actual_price NUMERIC (10, 2) NOT NULL,
     PRIMARY KEY (id, seat)
  -- to ensure the same seat in that show isn't booked more than once; they are FK, so nothin is stoping there two attibutes to repeat...
  -- uniqueness of seats per show // composite key concept
  ); 
