SET search_path = "restaurant-rater";

CREATE TABLE Rater
(
	UserID INTEGER PRIMARY KEY,
	email VARCHAR(20),
	name VARCHAR(20),
	join_date DATE,
	type VARCHAR(20),
	reputation INTEGER DEFAULT 1,
	CHECK (reputation < 6 AND reputation > 0)

);



CREATE TABLE Rating
(
	UserID INTEGER,
	Date DATE PRIMARY KEY,
	Price INTEGER,
	Food INTEGER,
	Mood INTEGER,
	Staff INTEGER,
	Comments VARCHAR,
	RestaurantID INTEGER,
	CHECK (Price < 6 AND  Price > 0),
	CHECK (Food < 6 AND  Food > 0),
	CHECK (Mood < 6 AND  Mood > 0),
	CHECK (Staff < 6 AND Staff > 0),
	FOREIGN KEY(UserID) REFERENCES Rater,
	FOREIGN KEY(RestaurantId) REFERENCES Restaurant


);


CREATE TABLE Restaurant
(
 	RestaurantID INTEGER PRIMARY KEY,
	Name VARCHAR(20),
	Type VARCHAR(20),
	URL VARCHAR
);

CREATE TABLE Location
(
	LocationID INTEGER PRIMARY KEY,
	first_open_date DATE,
	manager_name VARCHAR(20),
	phone_number VARCHAR(20),
	street_address VARCHAR(20),
	hour_open decimal(2,1),
	hour_close decimal(2,1),
	RestaurantID INTEGER
	CHECK( hour_open < hour_close),
	CHECK( hour_open < 24.0 AND hour_open >= 0.0),
	CHECK( hour_close < 24.0 AND hour_close >= 0.0),
	FOREIGN KEY(RestaurantID) REFERENCES Restaurant
);

CREATE TABLE MenuItem
(
	ItemID INTEGER PRIMARY KEY,
	name VARCHAR(20),
	type VARCHAR(20),
	category VARCHAR(20),
	description VARCHAR,
	price decimal(3,1),
	hour_close decimal(3,1),
	RestaurantID INTEGER,
	FOREIGN KEY (ItemID) REFERENCES Restaurant
);

CREATE TABLE RatingItem
(
	UserID INTEGER,
	ItemID INTEGER,
	Date DATE,
	rating INTEGER,
	comment VARCHAR,
	CHECK (rating < 6 AND rating > 0),
	FOREIGN KEY (UserID) REFERENCES Rater,
	FOREIGN KEY (ItemID) REFERENCES MenuItem,
	FOREIGN KEY (Date) REFERENCES Rating

);

INSERT INTO Restaurant
VALUES(0,'McDonald''s', 'American', 'mcdonalds.com/ca/en-ca.html');
VALUES(1,'Pizza Pizza', 'American', 'pizzapizza.ca');
VALUES(2,'Ng''s Cuisine', 'Chinese', 'ngscuisine.com');
VALUES(3,'Red Lobster', 'American', 'redlobster.ca');
VALUES(4, '168 Sushi Japanese Buffet', 'Japanese', '168sushibuffet.com');
VALUES(5, 'Cozmos Souvlaki', 'Greek', 'cozmossouvlaki.com');
VALUES(6,'Popeyes', 'American', 'popeyeschicken.ca');
VALUES(7,'3 Brothers Shawarma', 'Middle Eastern', 'www.3brothersshawarma.com');
VALUES(8,'The Fry', 'Korean', 'thefry.ca');
VALUES(9,'Mandarin', 'Chinese', 'mandarinrestaurant.com');
VALUES(10,'Harvey''s', 'American', 'harveys.ca');
VALUES(11,'Chako', 'Korean', 'chakobbq.com');
