DROP DATABASE triviaDB;

CREATE DATABASE IF NOT EXISTS triviaDB;
GRANT ALL PRIVILEGES ON triviaDB.* to 'tUser'@'localhost' 
identified by 'tPasswd';
USE triviaDB;

CREATE TABLE IF NOT EXISTS meme 
( 
  numId INT not null auto_increment,
  primary key (numId),
  imageLink BLOB,
  whenDate DATE,
  content BLOB not null
);

CREATE TABLE IF NOT EXISTS trivia
(
  numId INT not null auto_increment,
  primary key (numId),
  content BLOB not null
);

CREATE TABLE IF NOT EXISTS sayings
(
  numId INT not null auto_increment,
  primary key (numId),
  content BLOB not null,
  author varchar(50),
  genre varchar(25)
);
CREATE TABLE IF NOT EXISTS fortuneCookies
(
  numId INT not null auto_increment,
  primary key (numId),
  content BLOB not null 
);

CREATE TABLE IF NOT EXISTS laws
(
  numId INT not null auto_increment,
  primary key (numId),
  content BLOB not null,
  whenDate DATE,
  state varchar(25)
);

/*INSERT INTO laws (content, state) VALUES ('It is illegal to shoot any game other than whales from a moving automobile.', 'TN');
INSERT INTO laws (content, state) VALUES ('It is illegal to leave your house if you are not wearing underwear.', 'Thailand');
INSERT INTO laws (content, state) VALUES ('It is illegal to bungee jump.', 'Singapore');
INSERT INTO laws (content, state) VALUES ('It is illegal to tickle women.', 'VA');
INSERT INTO sayings (content) VALUES ('"Criminal lawyer" is a redundancy.');
INSERT INTO trivia (content) VALUES ('A "jiffy" is an actual unit of time for 1/100th of a second.');
INSERT INTO fortuneCookies (content) VALUES ('A man who goes to bed with itchy butt wakes up with smelly fingers.');*/

--
-- Initially fill trivia table
--

INSERT INTO `trivia` (`content`) VALUES
('A "jiffy" is an actual unit of time for 1/100th of a second.'),
('A dime has 118 ridges around the edge.'),
('A grasshopper has 100 more distinct muscles than a human.'),
('An average person laughs about 15 times a day.'),
('American car horns beep in the tone of F.'),
('A duck''s quack doesn''t echo and no one knows why.'),
('Mel Blanc (the voice of Bugs Bunny) was allergic to carrots.'),
('Ten percent of the Russian government''s income comes from the sale of vodka.'),
('In eighteenth-century English gambling dens, there was an employee whose only job was to swallow the dice if there was a police raid.'),
('For some time Frederic Chopin, the composer and pianist, wore a beard on only one side of his face, explaining: "It does not matter, my audience sees only my right side."'),
('Donald Duck''s middle name is Fauntleroy.'),
('Ostriches are used to guard sheep in Africa.'),
('Egyptians slept on pillows of rock.'),
('A group of frogs is called an army, and a group of toads is called a knot.'),
('The first copyrighted motion pictures was "Record of a Sneeze," a short film in 1894.'),
('One quarter of Canada''s population lives within 100 miles of Toronto.'),
('Ontario''s first license plates were made of leather.'),
('Kailash Singh, an Indian man, has not bathed since 1974.'),
('After making a donation to a large Detroit church, Iraq dictator Saddam Hussein was given the key to Detroit.'),
('A micromort is a tiny measure of of potential deadliness--one micromort equals a one-in-a-million possibility of death. '),
('Fossilized rose remnants have been found that date back 35 million years.'),
('The total number of LEGO bricks used in The LEGO Movie was 15,080,330--not counting the characters.'),
('Rupert Grint (Ron Weasley) owns an ice cream truck and drives around England to hand out free ice cream bars to children.'),
('"Wiki" is Hawaiian for "quick," and "pedia" from "encyclopedia." Wikipedia = quick encyclopedia.'),
('Rhinecanthus aculeatus, a lagoon trigger fish, is called Humuhumunukunukuapua''a in Hawaii.'),
('Canada has more lakes than all the other countries combined.'),
('Orchid comes from the Greek orchis, which literally translates as "testicle."'),
('Susan B. Anthony was fined $100 for voting for Ulysses S. Grant in the 1872 election--women did not get the right to vote in federal elections until 1920. She never paid the fine. '),
('Only two people remain who are fluent in Ayapaneco, but they refuse to talk to each other.'),
('"Strategic incompetence" is the art of avoiding certain tasks by pretending you don''t know how to do them.'),
('Alfred Hitchcock didn''t have a belly button.'),
('Frogs can''t swallow without blinking.'),
('At the Wife Carrying World Championships in Finland, the first prize is the wife''s weight in beer.'),
('There are no bears native to the continent of Australia (koalas are not bears).'),
('The Bible is the most shoplifted book in the world.');

--
-- Initially fill sayings table
--

INSERT INTO `sayings` (`content`, `author`) VALUES
('"Criminal lawyer" is a redundancy.','Unknown'),
('Youth is such a wonderful thing. What a crime to waste it on children.','George Bernard Shaw'),
('Base 8 is just like base 10, if you are missing two fingers.','Tom Lehrer'),
('A man is incomplete until he is married. After that, he is finished.','Zsa Zsa Gabor'),
('Beware of programmers who carry screwdrivers.','Leonard Brandwein'),
('A preposition is a terrible word to end a sentence with.','William Safire'),
('A witty saying proves nothing.','Voltaire'),
('A yawn is a silent shout.	G. K.','Chesterton'),
('All generalizations are dangerous, even this one.','Alexandre Dumas'),
('An empty man is full of himself.','Edward Abbey'),
('Flattery is like cologne: To be smelled, but not swallowed.','Josh Billings'),
('The whole world is a tuxedo and you are a pair of brown shoes.','George Gobel'),
('I spilled spot remover on my dog. He''s gone now.','Steven Wright'),
('When I said that I cleaned my room, I just meant I made a path from the doorway to my bed.','Unknown'),
('Friday is my second favorite F word.','Unknown'),
('I''m not clumsy! The floor just hates me, the table and chairs are bullies, and the walls get in my way.','Unknown'),
('When I die, I want to go peacefully like my grandfather did-in his sleep. Not yelling and screaming like the passengers in his car.','Bob Monkhouse'),
('Always borrow money from a pessimist. He won''t expect it back.','Oscar Wilde'),
('I love deadlines. I like the whooshing sound they make as they fly by.','Douglas Adams');

--
-- Initially fill fortune cookies table
--

INSERT INTO `fortuneCookies` (`content`) VALUES
('A man who goes to bed with itchy butt wakes up with smelly fingers.'),
('Does a man who eats multicolor beans have Technicolor farts?'),
('He who drop watch in whisky, wasting time.'),
('Man kicked in testicles, left holding bag.'),
('He who masturbate only screwing self.'),
('Man who walk through airport door sideways is going to Bangkok.'),
('She who put detergent on top shelf, jump for Joy.'),
('It takes many nails to build crib, but only one screw to fill it.'),
('He who jump off cliff, jump to conclusion!'),
('A backward poet writes inverse.'),
('A chicken crossing the road is poultry in motion.'),
('A clean tie attracts the soup of the day.'),
('A day without orange juice is like a day without orange juice.'),
('A Freudian slip is when you say one thing but mean your mother.'),
('A sadist is a masochist who follows the Golden Rule.'),
('Acupuncture is a jab well done.'),
('Adultery: Putting yourself in someone else''s position.'),
('Bacteria are the only culture some people have.'),
('"For example" is not proof. Yiddish proverb.'),
('A closed mouth gathers no foot.'),
('Anything is possible, unless it is not.'),
('A day for firm decisions!!!!!  Or is it?'),
('Bridge ahead.  Pay troll.'),
('Give thought to your reputation.  Consider changing name and moving to a new town.'),
('Go to a movie tonight.  Darkness becomes you.'),
('People are beginning to notice you.  Try dressing before you leave the house.'),
('Today is National Existential Ennui Awareness Day.'),
('Tomorrow will be cancelled due to lack of interest.'),
('When an agnostic dies, does he go to the "great perhaps"?'),
('Why is the time of day with the slowest traffic called rush hour?'),
('Atheism is a nonprophet organization.'),
('And whose cruel idea was it for the word "Lisp" to have an "S" in it?'),
('A journey of a thousand sites begins with a single click.'),
('The journey of a thousand hops of pain starts with a bare foot and a single LEGO block.');

--
-- Initially fill laws table
--

INSERT INTO `laws` (`state`, `content`) VALUES
('TN','It is illegal to shoot any game other than whales from a moving automobile.'),
('Thailand','It is illegal to leave your house if you are not wearing underwear.'),
('Philippines','Cars whose license plates end with a 1 or 2 are not allowed on the roads on Monday, 3 or 4 on Tuesday, 5 or 6 on Wednesday, 7 or 8 on Thursday, and 9 or 0 on Friday.'),
('Singapore','Bungee jumping is illegal.'),
('Singapore','Failure to flush a public toilet after use may result in very heft fines.'),
('UK','It is legal for a male to urinate in public, as long as it is on the rear wheel of his motor vehicle and his right hand is on the vehicle.'),
('UK','Placing a postage stamp that bears the Queen (or King) upside down is considered treason.'),
('VA','If one is not married, it is illegal for him to have sexual relations.'),
('VA','You may not have oral or anal sex.'),
('VA','It is illegal to tickle women.'),
('VA','No animal may be hunted for on Sunday with the exception of raccoons, which may be hunted until 2:00 AM.'),
('MD','Thistles may not grow in one''s yard. '),
('Baltimore, MD','It is illegal to take a lion to the movies.'),
('Baltimore, MD','It''s illegal to throw bales of hay from a second-story window within the city limits.'),
('WV','Whistling underwater is prohibited.'),
('PA','It it illegal to sleep on top of a refrigerator outdoors.'),
('PA','You may not catch a fish with your hands.'),
('PA','A special cleaning ordinance bans housewives from hiding dirt and dust under a rug in a dwelling.'),
('DE','It is illegal to fly over any body of water, unless one is carrying sufficient supplies of food and drink.'),
('Rehoboth Beach, DE','No person shall pretend to sleep on a bench on the boardwalk.'),
('Lewes, DE','It is illegal to wear pants that are ''firm fitting'' around the waist.'),
('NC','It is a felony to steal more than $1000 of grease.'),
('NC','It''s against the law to sing off key.'),
('Wilbur, WA','It''s illegal to ride an ugly horse in Wilbur, Washington.'),
('NC','Elephants may not be used to plow cotton fields.'),
('MI','It''s against the law to tie a crocodile to a fire hydrant.'),
('CO','A man cannot marry his wife''s grandmother.'),
('Memphis, TN','A woman is not allowed to drive a car unless a man is in front of the car waving a red flag to warn people and other cars.'),
('LA, CA','Pickles were outlawed because the smell might offend people.'),
('Whitesville, DE','Women could be charged with disorderly conduct if they propose marriage to a man.'),
('Lexington, KY','It is against the law to carry an ice cream cone in a pocket.');

--
-- Initially fill memes table
--
INSERT INTO `memes` (`imageLink`, `whenDate`,`content`) VALUES
('http://31.media.tumblr.com/652065496e46b017849f1672bb5e8e98/tumblr_mfnvfyduSK1rm7d3so1_500.gif','03/16/14','Everyone loves Nigel Thornberry~!');
('http://31.media.tumblr.com/4a2ffd08aee61761d15d94de86ccfc32/tumblr_mfugp0fe6P1r2iz18o1_500.gif', '03/16/14/','SMASHING!');