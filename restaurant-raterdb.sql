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

CREATE TABLE Restaurant
(
 	RestaurantID INTEGER PRIMARY KEY,
	Name VARCHAR,
	Type VARCHAR,
	URL VARCHAR
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
	name VARCHAR,
	type VARCHAR(20),
	category VARCHAR(20),
	description VARCHAR,
	price decimal(3,1),
	RestaurantID INTEGER,
	FOREIGN KEY (RestaurantID) REFERENCES Restaurant
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

INSERT INTO Restaurant VALUES
  (0,'McDonald''s', 'American', 'mcdonalds.com/ca/en-ca.html'),
	(1,'Pizza Pizza', 'American', 'pizzapizza.ca'),
	(2,'Ng''s Cuisine', 'Chinese', 'ngscuisine.com'),
	(3,'Red Lobster', 'American', 'redlobster.ca'),
	(4, '168 Sushi Japanese Buffet', 'Japanese', '168sushibuffet.com'),
	(5, 'Cozmos Souvlaki', 'Greek', 'cozmossouvlaki.com'),
	(6,'Popeyes', 'American', 'popeyeschicken.ca'),
	(7,'3 Brothers Shawarma', 'Middle Eastern', 'www.3brothersshawarma.com'),
	(8,'The Fry', 'Korean', 'thefry.ca'),
	(9,'Mandarin', 'Chinese', 'mandarinrestaurant.com'),
	(10,'Harvey''s', 'American', 'harveys.ca'),
	(11,'Chako', 'Korean', 'chakobbq.com');

INSERT INTO MenuItem VALUES
	(0, 'Montreal Steak Spice BBQ Angus', 'food', 'main', '100% Angus beef with BBQ sauce, crispy onions, and natural Mozzarella cheese.', 9.99,0),
	(1, 'Big Mac', 'food', 'main', '100% Canadian beef, processed cheddar cheese, with famous Big Mac sauce.', 6.99, 0),
	(2, 'Oreo McFlurry', 'food', 'dessert', 'Creamy vanilla soft served mixed with Oreo', 2.39, 0),
	(3, '8 Jalapeno Poppers', 'food', 'starter', 'Stuffed jalapeno peppers with cream cheese then deep-fried.', 5.99, 1),
	(4, 'Chocolate Milk', 'beverage', 'main', 'Classic chocolate milk from the cow.', 2.09, 1),
	(5, 'Fresco - Chicken Bruschetta', 'food', 'main', '10" whole grain, thin crust with grilled chicken, roasted garlic, bruschetta, parmesan cheese and mozzarella cheese.', 5.00, 1),
	(6, '20 Chicken Wings', 'food', 'main', 'Classic or crispy breaded wings.', 18.99, 1),
	(7, 'Dry Scallop Seafood Soup', 'food', 'starter', 'With delicious fresh scallops.', 15.95, 2),
	(8, 'BBQ Pork Fried Rice', 'food', 'main', 'Sweet BBQ Pork with tender fried rice.', 8.95, 2),
	(9, 'Spicy Crispy Beef', 'food', 'main', 'Nice and spicy.', 12.55, 2),
	(10, 'Shirmp Linguine Alfredo', 'food', 'main', 'With our creamy Alfredo sauce.', 19.99, 3),
	(11, 'Key Lime Pie', 'food', 'dessert', 'A slice of our cool, tangy, creamy classic with a graham cracker crust.', 7.99, 3)
	(12, 'Mojito', 'beverage', 'main', 'We take Bacardi Superior rum, muddle it with fresh-squeezed lime, mint, pure cane sugar and top with club soda.', 4.99, 3)
	(13, 'Edamame', 'food', 'starter', 'Steamed Soy Bean with Lightly Salt.', 3.95, 4),
	(14, 'Banana Tempura (4pcs)', 'food', 'starter', 'Deep Fried Banana with sweet chocolate sauce.', 3.95, 4),
	(15, 'California', 'food', 'main', 'Crap meat, cucumber.', 4.95, 4),
	(16, 'Beef Souvlaki', 'food', 'main', 'Beef with Tzatzikiand soft peta bread.', 8.30, 5),
	(17, 'Chicken Souvlaki', 'food', 'main', 'Chicken with Tzatziki and soft peta bread.', 8.30, 5),
	(18, 'Poutine', 'food', 'main', 'Fries with fresh beef gravy and cheese curds.', 6.99, 5),
	(19, 'Greek Salad', 'main', 'With fresh feta cheese and olives.', 4.99, 5),
	(20, 'Bonafide Chicken', 'food', 'main', 'Our freshly prepared chicken, marinated in Popeyes spicy chicken marinade,', 6.99, 6),
	(21, 'Mashed Potatoes', 'food', 'starter', 'Smooth, creamy mashed potatoes covered with our flavourful cajun gravy.', 2.99, 6),
	(22, 'Soda', 'beverage', 'main', 'Cold beverage of your choice.', 1.99, 6),
	(23, 'Popcorn Shrimp', 'food', 'main', 'Tender crispy shrimp seasoned in Louisiana herbs.', 7.99, 6),
	(24, 'Onion Rings', 'food', 'main', 'Crispy battered onion rings', 7.99, 6),
	(25, 'Beef Poutine', 'food', 'main', 'Poutine served with beef.', 11.99, 7),
	(26, 'Shawarma', 'food', 'main', 'A wrap filled with vegetable and meat of your choosing.', 7.99, 7),
	(27, 'Soda', 'beverage', 'main', 'Cold beverage of your choice!', 1.99, 7),
	(28, 'BBQ Chicken', 'food', 'main', 'Half chicken marinated in BBQ sauce.', 12.99, 8),
	(29, 'Caesar salad', 'food', 'starter', 'A healthy caesar salad served with salad dressing.', 4.99, 8),
	(30, 'Milkshake', 'beverage', 'main', 'Cold milkshake of your choice!', 3.99, 8),
	(31, 'Sushi', 'food', 'main', 'A tray of any type of sushi of your choosing, freshly made.', 12.99, 9),
	(32, 'Ice Cream', 'food', 'dessert', 'A bowl of any flavour of ice cream.', 2.99, 9),
	(33, 'Beer', 'beverage', 'main', 'Cool brew of beer.', 3.99, 9),
	(34, 'Grilled Veggie Burger', 'food', 'main', 'Harvey''s signature Veggie Burger.', 8.99, 10),
	(35, 'Grilled Hot Dog', 'food', 'main', 'Our signature hot dog is flame-grilled to perfection and served on a fresh, lightly toasted bun.', 4.99, 10),
	(36, 'Slushie', 'beverage', 'main', 'Custom slushie with secret flavour.', 1.99, 10),
	(37, 'Beef', 'food', 'main', 'A tray of raw beef served to be grilled.', 12.99, 11),
	(38, 'Ice Cream', 'food', 'dessert','Mango or Pistachio flavour served fresh!', 2.99, 11),
	(39, 'Beer', 'beverage', 'main', 'Cool brew of beer.', 3.99, 11);
