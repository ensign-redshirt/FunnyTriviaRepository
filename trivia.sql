DROP DATABASE triviaDB;

CREATE DATABASE IF NOT EXISTS triviaDB;
GRANT ALL PRIVILEGES ON triviaDB.* to 'tUser'@'localhost' 
identified by 'tPasswd';
USE triviaDB;

CREATE TABLE meme 
( 
  numId INT,
  imageLink BLOB,
  whenDate DATE,
  content BLOB
);

CREATE TABLE trivia
(
  numId INT,
  content BLOB
);

CREATE TABLE sayings
(
  numId INT,
  content BLOB,
  author varchar(50),
  genre varchar(25)
);

CREATE TABLE fortuneCookies
(
  numId INT,
  content BLOB
);

CREATE TABLE laws
(
  numId INT,
  content BLOB,
  whenDate DATE,
  state varchar(25)
);

INSERT INTO laws (content, state) VALUES ('It is illegal to shoot any game other than whales from a moving automobile.', 'TN');
INSERT INTO sayings (content) VALUES ('"Criminal lawyer" is a redundancy.');
INSERT INTO trivia (content) VALUES ('A "jiffy" is an actual unit of time for 1/100th of a second.');
INSERT INTO fortuneCookies (content) VALUES ('A man who goes to bed with itchy butt wakes up with smelly fingers.');