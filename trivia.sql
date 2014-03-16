DROP DATABASE triviaDB;

CREATE DATABASE IF NOT EXISTS triviaDB;
GRANT ALL PRIVILEGES ON triviaDB.* to 'tUser'@'localhost' 
identified by 'tPasswd';
USE triviaDB;

CREATE TABLE meme 
( 
  numId INT not null auto_increment,
  imageLink BLOB,
  whenDate DATE,
  content BLOB not null
);

CREATE TABLE trivia
(
  numId INT not null auto_increment,
  content BLOB not null
);

CREATE TABLE sayings
(
  numId INT not null auto_increment,
  content BLOB not null,
  author varchar(50),
  genre varchar(25)
);
CREATE TABLE fortuneCookies
(
  numId INT not null auto_increment,
  content BLOB not null 
);

CREATE TABLE laws
(
  numId INT not null auto_increment,
  content BLOB not null,
  whenDate DATE,
  state varchar(25)
);

INSERT INTO laws (content, state) VALUES ('It is illegal to shoot any game other than whales from a moving automobile.', 'TN');
INSERT INTO laws (content, state) VALUES ('It is illegal to leave your house if you are not wearing underwear.', 'Thailand');
INSERT INTO laws (content, state) VALUES ('It is illegal to bungee jump.', 'Singapore');
INSERT INTO laws (content, state) VALUES ('It is illegal to tickle women.', 'VA');
INSERT INTO sayings (content) VALUES ('"Criminal lawyer" is a redundancy.');
INSERT INTO trivia (content) VALUES ('A "jiffy" is an actual unit of time for 1/100th of a second.');
INSERT INTO fortuneCookies (content) VALUES ('A man who goes to bed with itchy butt wakes up with smelly fingers.');
