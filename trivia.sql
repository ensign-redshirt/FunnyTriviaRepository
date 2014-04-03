DROP DATABASE triviaDB;

CREATE DATABASE IF NOT EXISTS triviaDB;
GRANT ALL PRIVILEGES ON triviaDB.* to 'tUser'@'localhost' 
identified by 'tPasswd';
USE triviaDB;

CREATE TABLE IF NOT EXISTS genre
(
  numId INT not null auto_increment,
  primary key (numId),
  genreName varchar(25)
);

CREATE TABLE IF NOT EXISTS meme 
( 
  numId INT not null auto_increment,
  primary key (numId),
  imageLink VARCHAR(2500) not null,
  content BLOB not null,
  genreId INT
);

CREATE TABLE IF NOT EXISTS trivia
(
  numId INT not null auto_increment,
  primary key (numId),
  content BLOB not null,
  genreId INT
);

CREATE TABLE IF NOT EXISTS sayings
(
  numId INT not null auto_increment,
  primary key (numId),
  content BLOB not null,
  author varchar(50),
  genreId INT
);


CREATE TABLE IF NOT EXISTS fortuneCookies
(
  numId INT not null auto_increment,
  primary key (numId),
  content BLOB not null,
  genreId INT
);

CREATE TABLE IF NOT EXISTS laws
(
  numId INT not null auto_increment,
  primary key (numId),
  content BLOB not null,
  state varchar(25),
  genreId INT
);


CREATE VIEW genreView AS SELECT numId, genreName FROM genre;
CREATE VIEW memeView AS SELECT numId, content, imageLink, genreId FROM meme;
CREATE VIEW sayingsView AS SELECT numId, content, author, genreId FROM sayings;
CREATE VIEW fortuneView AS SELECT numId, content, genreId FROM fortuneCookies;
CREATE VIEW triviaView AS SELECT numId, content, genreId FROM trivia;
CREATE VIEW lawView AS SELECT numId, content, state FROM laws;

/*INSERT INTO laws (content, state) VALUES ('It is illegal to shoot any game other than whales from a moving automobile.', 'TN');
INSERT INTO laws (content, state) VALUES ('It is illegal to leave your house if you are not wearing underwear.', 'Thailand');
INSERT INTO laws (content, state) VALUES ('It is illegal to bungee jump.', 'Singapore');
INSERT INTO laws (content, state) VALUES ('It is illegal to tickle women.', 'VA');
INSERT INTO sayings (content) VALUES ('"Criminal lawyer" is a redundancy.');
INSERT INTO trivia (content) VALUES ('A "jiffy" is an actual unit of time for 1/100th of a second.');
INSERT INTO fortuneCookies (content) VALUES ('A man who goes to bed with itchy butt wakes up with smelly fingers.');*/

INSERT INTO `genre` (`numId`, `genreName`) VALUES
(1, 'boring'),
(2, 'historical'),
(3,'humorous'),
(4, 'sexual'),
(5, 'wtf');
--
-- Initially fill trivia table
--

INSERT INTO `trivia` (`content`,`genreId`) VALUES
('A "jiffy" is an actual unit of time for 1/100th of a second.', 1),
('A dime has 118 ridges around the edge.',1),
('A grasshopper has 100 more distinct muscles than a human.',1),
('An average person laughs about 15 times a day.',1),
('American car horns beep in the tone of F.',1),
('A duck''s quack doesn''t echo and no one knows why.',5),
('Mel Blanc (the voice of Bugs Bunny) was allergic to carrots.',3),
('Ten percent of the Russian government''s income comes from the sale of vodka.',5),
('In eighteenth-century English gambling dens, there was an employee whose only job was to swallow the dice if there was a police raid.',2),
('For some time Frederic Chopin, the composer and pianist, wore a beard on only one side of his face, explaining: "It does not matter, my audience sees only my right side."',2),
('Donald Duck''s middle name is Fauntleroy.',3),
('Ostriches are used to guard sheep in Africa.',5),
('Egyptians slept on pillows of rock.',1),
('A group of frogs is called an army, and a group of toads is called a knot.',1),
('The first copyrighted motion picture was "Record of a Sneeze," a short film in 1894.',2),
('One quarter of Canada''s population lives within 100 miles of Toronto.',1),
('Ontario''s first license plates were made of leather.',2),
('Kailash Singh, an Indian man, has not bathed since 1974.',5),
('After making a donation to a large Detroit church, Iraq dictator Saddam Hussein was given the key to Detroit.',2),
('A micromort is a tiny measure of of potential deadliness--one micromort equals a one-in-a-million possibility of death. ',5),
('Fossilized rose remnants have been found that date back 35 million years.',2),
('The total number of LEGO bricks used in The LEGO Movie was 15,080,330--not counting the characters.',5),
('Rupert Grint (Ron Weasley) owns an ice cream truck and drives around England to hand out free ice cream bars to children.',3),
('"Wiki" is Hawaiian for "quick," and "pedia" from "encyclopedia." Wikipedia = quick encyclopedia.',1),
('Rhinecanthus aculeatus, a lagoon trigger fish, is called Humuhumunukunukuapua''a in Hawaii.',1),
('Canada has more lakes than all the other countries combined.',1),
('Orchid comes from the Greek orchis, which literally translates as "testicle."',4),
('Susan B. Anthony was fined $100 for voting for Ulysses S. Grant in the 1872 election--women did not get the right to vote in federal elections until 1920. She never paid the fine. ',2),
('Only two people remain who are fluent in Ayapaneco, but they refuse to talk to each other.',5),
('"Strategic incompetence" is the art of avoiding certain tasks by pretending you don''t know how to do them.',3),
('Alfred Hitchcock didn''t have a belly button.',1),
('Frogs can''t swallow without blinking.',1),
('At the Wife Carrying World Championships in Finland, the first prize is the wife''s weight in beer.',3),
('There are no bears native to the continent of Australia (koalas are not bears).',1),
('The Bible is the most shoplifted book in the world.',5);

--
-- Initially fill sayings table
--

INSERT INTO `sayings` (`content`, `author`, `genreId`) VALUES
('"Criminal lawyer" is a redundancy.','Unknown',3),
('Youth is such a wonderful thing. What a crime to waste it on children.','George Bernard Shaw',3),
('Base 8 is just like base 10, if you are missing two fingers.','Tom Lehrer',3),
('A man is incomplete until he is married. After that, he is finished.','Zsa Zsa Gabor',3),
('Beware of programmers who carry screwdrivers.','Leonard Brandwein',3),
('A preposition is a terrible word to end a sentence with.','William Safire',3),
('A witty saying proves nothing.','Voltaire',2),
('A yawn is a silent shout.	G. K.','Chesterton',3),
('All generalizations are dangerous, even this one.','Alexandre Dumas',3),
('An empty man is full of himself.','Edward Abbey',3),
('Flattery is like cologne: To be smelled, but not swallowed.','Josh Billings',1),
('The whole world is a tuxedo and you are a pair of brown shoes.','George Gobel',3),
('I spilled spot remover on my dog. He''s gone now.','Steven Wright',5),
('When I said that I cleaned my room, I just meant I made a path from the doorway to my bed.','Unknown',3),
('Friday is my second favorite F word.','Unknown',3),
('I''m not clumsy! The floor just hates me, the table and chairs are bullies, and the walls get in my way.','Unknown',3),
('When I die, I want to go peacefully like my grandfather did-in his sleep. Not yelling and screaming like the passengers in his car.','Bob Monkhouse',5),
('Always borrow money from a pessimist. He won''t expect it back.','Oscar Wilde',2),
('I love deadlines. I like the whooshing sound they make as they fly by.','Douglas Adams',3);

--
-- Initially fill fortune cookies table
--

INSERT INTO `fortuneCookies` (`content`,`genreId`) VALUES
('A man who goes to bed with itchy butt wakes up with smelly fingers.',3),
('Does a man who eats multicolor beans have Technicolor farts?',3),
('He who drop watch in whisky, wasting time.',3),
('Man kicked in testicles, left holding bag.',5),
('He who masturbate only screwing self.',4),
('Man who walk through airport door sideways is going to Bangkok.',3),
('She who put detergent on top shelf, jump for Joy.',3),
('It takes many nails to build crib, but only one screw to fill it.',4),
('He who jump off cliff, jump to conclusion!',3),
('A backward poet writes inverse.',3),
('A chicken crossing the road is poultry in motion.',3),
('A clean tie attracts the soup of the day.',3),
('A day without orange juice is like a day without orange juice.',3),
('A Freudian slip is when you say one thing but mean your mother.',4),
('A sadist is a masochist who follows the Golden Rule.',3),
('Acupuncture is a jab well done.',3),
('Adultery: Putting yourself in someone else''s position.',4),
('Bacteria are the only culture some people have.',3),
('"For example" is not proof. Yiddish proverb.',3),
('A closed mouth gathers no foot.',3),
('Anything is possible, unless it is not.'),
('A day for firm decisions!!!!!  Or is it?',3),
('Bridge ahead.  Pay troll.',5),
('Give thought to your reputation.  Consider changing name and moving to a new town.',3),
('Go to a movie tonight.  Darkness becomes you.',3),
('People are beginning to notice you.  Try dressing before you leave the house.',3),
('Today is National Existential Ennui Awareness Day.',3),
('Tomorrow will be cancelled due to lack of interest.',3),
('When an agnostic dies, does he go to the "great perhaps"?',3),
('Why is the time of day with the slowest traffic called rush hour?',3),
('Atheism is a nonprophet organization.',3),
('And whose cruel idea was it for the word "Lisp" to have an "S" in it?',3),
('A journey of a thousand sites begins with a single click.',3),
('The journey of a thousand hops of pain starts with a bare foot and a single LEGO block.',3);

--
-- Initially fill laws table
--

INSERT INTO `laws` (`state`, `content`,`genreId`) VALUES
('TN','It is illegal to shoot any game other than whales from a moving automobile.',5),
('Thailand','It is illegal to leave your house if you are not wearing underwear.',5),
('Philippines','Cars whose license plates end with a 1 or 2 are not allowed on the roads on Monday, 3 or 4 on Tuesday, 5 or 6 on Wednesday, 7 or 8 on Thursday, and 9 or 0 on Friday.',5),
('Singapore','Bungee jumping is illegal.',5),
('Singapore','Failure to flush a public toilet after use may result in very heft fines.',5),
('UK','It is legal for a male to urinate in public, as long as it is on the rear wheel of his motor vehicle and his right hand is on the vehicle.',5),
('UK','Placing a postage stamp that bears the Queen (or King) upside down is considered treason.',5),
('VA','If one is not married, it is illegal for him to have sexual relations.',4),
('VA','You may not have oral or anal sex.',4),
('VA','It is illegal to tickle women.',5),
('VA','No animal may be hunted for on Sunday with the exception of raccoons, which may be hunted until 2:00 AM.',5),
('MD','Thistles may not grow in one''s yard. ',5),
('Baltimore, MD','It is illegal to take a lion to the movies.',5),
('Baltimore, MD','It''s illegal to throw bales of hay from a second-story window within the city limits.',2),
('WV','Whistling underwater is prohibited.',5),
('PA','It it illegal to sleep on top of a refrigerator outdoors.',5),
('PA','You may not catch a fish with your hands.',5),
('PA','A special cleaning ordinance bans housewives from hiding dirt and dust under a rug in a dwelling.',5),
('DE','It is illegal to fly over any body of water, unless one is carrying sufficient supplies of food and drink.',5),
('Rehoboth Beach, DE','No person shall pretend to sleep on a bench on the boardwalk.',5),
('Lewes, DE','It is illegal to wear pants that are ''firm fitting'' around the waist.',4),
('NC','It is a felony to steal more than $1000 of grease.',5),
('NC','It''s against the law to sing off key.',3),
('Wilbur, WA','It''s illegal to ride an ugly horse in Wilbur, Washington.',3),
('NC','Elephants may not be used to plow cotton fields.',5),
('MI','It''s against the law to tie a crocodile to a fire hydrant.',5),
('CO','A man cannot marry his wife''s grandmother.',5),
('Memphis, TN','A woman is not allowed to drive a car unless a man is in front of the car waving a red flag to warn people and other cars.',2),
('LA, CA','Pickles were outlawed because the smell might offend people.',3),
('Whitesville, DE','Women could be charged with disorderly conduct if they propose marriage to a man.',2),
('Lexington, KY','It is against the law to carry an ice cream cone in a pocket.',5);

--
-- Initially fill memes table
--
INSERT INTO `meme` (`imageLink`,`content`, `genreId`) VALUES
('http://31.media.tumblr.com/652065496e46b017849f1672bb5e8e98/tumblr_mfnvfyduSK1rm7d3so1_500.gif','Everyone loves Nigel Thornberry~!',5),
('http://31.media.tumblr.com/4a2ffd08aee61761d15d94de86ccfc32/tumblr_mfugp0fe6P1r2iz18o1_500.gif', 'SMASHING!',5),
('http://i2.kym-cdn.com/photos/images/original/000/661/145/819.jpg', 'DOGE',3),
('http://i2.kym-cdn.com/photos/images/newsfeed/000/581/977/856.png', 'Your world sucks.',3),
('https://i.chzbgr.com/maxW500/8124358912/h3CCDC83A/', '2014 in a nutshell.', 3),
('https://i.chzbgr.com/maxW500/8123137280/h91F71B33/', 'Bad feather day.', 3),
('https://i.chzbgr.com/maxW500/5277904384/hA070BD5D/', 'GERMAN WEAPONS ARE APTLY NAMED.', 2),
('https://i.chzbgr.com/maxW500/4999225856/h6977B797/', 'Ye olde keyboard cat.', 5),
('https://i.chzbgr.com/maxW500/5540807424/hCAA9905B/', 'Ben Franklin: Pickup artist.', 2),
('https://i.chzbgr.com/maxW500/4668269312/h01F14E2E/', 'RUN AND TELL THAT.', 2),
('https://i.chzbgr.com/maxW500/5558334976/hE532DA80/', 'Can''t read my, can''t read my, can''t read my poker face.', 3),
('http://i.imgur.com/cUAF75O.gif', 'Oppa gangnam style!', 5),
('http://i.imgur.com/MjJkXb8.gif', 'Hey sexy lady.', 3),
('http://i.imgur.com/os8EEkh.gif', 'Play any music--he seems to dance along with anything.', 3),
('http://i.imgur.com/JjQtqWI.gif', 'LOL.', 3),
('http://i.imgur.com/ZjeZOVr.gif', 'NEVER GONNA GIVE YOU UP.', 3),
('http://i.imgur.com/engUhe1.gif', 'Horror movie of the year.', 3),
('http://i.imgur.com/DPl35Sr.gif', 'Ian Malcom: Captain Obvious.', 3),
('http://i.imgur.com/kwDk0zT.gif', 'What.', 5),
('http://i.imgur.com/vFytR1r.gif', 'Amy Pond.', 3),
('http://i.imgur.com/AKUHBoY.gif', 'Bah dum chhhhhh.', 3);

