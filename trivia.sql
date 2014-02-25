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
