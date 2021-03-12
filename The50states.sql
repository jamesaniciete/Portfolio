DROP TABLE states;
/
CREATE TABLE states
(st_id_no   number(3),
 st_name    varchar(30),
 st_cap     Varchar(30),
 st_tree    varchar(30),
 st_bird    varchar(30),
 st_flower  varchar(30),
 st_order_us number (3),
 st_song    varchar(50),
 CONSTRAINT states_st_id_no_pk PRIMARY KEY (ST_ID_NO));
/

INSERT INTO states
VALUES (1,'Alabama', 'Montgomery','Longleaf Pine','Yellowhammer','Camelia', 22, 'Alabama')
/
INSERT INTO states
VALUES (2,'Alaska', 'Juneau','Sitka spruce','Willow Ptarmigan','Forget Me Not', 49, 'Alaska''s Flag')
/
INSERT INTO states
VALUES (3,'Arizona', 'Phoenix','Yellow Pale verde','Cactus Wren','Saguaro cactus blossom', 48, 'Arizona')
/
INSERT INTO states
VALUES (4,'Arkansas', 'Little Rock','Loblolly Pine','Mockingbird','Apple Blossom', 25, 'Arkansas Oh, Arkansas')
/
INSERT INTO states
VALUES (5,'California', 'Sacramento','Redwood','California Valley Quail','California Poppy', 31, 'I Love You, California')
/
INSERT INTO states
VALUES (6,'Colorado', 'Denver','Blue Spruce','Lark Bunting','Rocky Mountain Columbine', 38, 'Where the Columbines Grow')
/
INSERT INTO states
VALUES (7,'Connecticut', 'Hartford','White Oak','Robin','Mountain laurel', 5, 'Yankee Doodle')
/
INSERT INTO states
VALUES (8,'Delaware', 'Dover','American Holly','Blue Hen Chicken','Peach Blossom', 1, 'Our Delaware')
/
INSERT INTO states
VALUES (9,'Florida', 'Tallahasse','Cabbage Palmetto','Mockingbird','Orange Blossom', 27, 'Swanee River')
/
INSERT INTO states
VALUES (10,'Georgia', 'Atlanta','Live Oak','Brown Thrasher','Cherokee Rose', 4, 'Georgia on My Mind')
/
INSERT INTO states
VALUES (11,'Hawaii', 'Honolulu','Kukui-Candlenut','Nene','Hibiscus or Pua Aloalo', 50, 'Hawaii Ponoi')
/
INSERT INTO states
VALUES (12,'Idaho', 'Boise','Western White Pine','Mountain Bluebird','Syringa', 43, 'Here We Have Idaho')
/
INSERT INTO states
VALUES (13,'Illinois', 'Springfield','White Oak','Cardinal','Viola', 21, 'Illinois')
/
INSERT INTO states
VALUES (14,'Indiana', 'Indianapolis','Yellow-poplar','Cardinal','Peony', 19, 'On the Banks of the Wabash')
/
INSERT INTO states
VALUES (15,'Iowa', 'Des Moines','Oak Northern red oak','Eastern Goldfinch','Wild Praire Rose', 29, 'The Song of Iowa')
/
INSERT INTO states
VALUES (16,'Kansas', 'Topeka','Cottonwood','Western Meadowlark','Sunflower', 34, 'Home on the Range')
/
INSERT INTO states
VALUES (17,'Kentucky', 'Frankfort','Yellow-poplar','Cardinal','Goldenrod', 15, 'My Old Kentucky Home')
/
INSERT INTO states
VALUES (18,'Louisiana', 'Baton Rouge','Bald Cypress','Eastern Brown Pelican','Magnolia', 18, 'Give Me Louisiana')
/
INSERT INTO states
VALUES (19,'Maine', 'Augusta','Eastern White Pine','Chickadee','White Pine COne and tassel', 23, 'State Song of Maine')
/
INSERT INTO states
VALUES (20,'Maryland', 'Annapolis','White Oak','Baltimore Oriole','Black-eyed susan', 7, 'Maryland My Maryland')
/
INSERT INTO states
VALUES (21,'Massachusetts', 'Boston','American Elm','Chickadee','Mayflower', 6, 'Hail Massachusetts')
/
INSERT INTO states
VALUES (22,'Michigan', 'Lansing','Eastern White Pine','Robin','Apple Blossom', 26, 'Michigan My Michigan')
/
INSERT INTO states
VALUES (23,'Minnesota', 'St Paul','Red Oak','Common Loon','Pink and white lady''s slipper', 32, 'Hail Minnesota')
/
INSERT INTO states
VALUES (24,'Mississippi', 'Jackson','Southern Magnolia','Mockingbird','Magnolia', 20, 'Go Mis-sis-sip-pi')
/
INSERT INTO states
VALUES (25,'Missouri', 'Jefferson City','Flowering Dogwood','Bluebird','Hawthorn', 24, 'Missouri Waltz')
/
INSERT INTO states
VALUES (26,'Montana', 'Helena','Ponderosa Pine','Western Meadowlark','Bitterroot', 41, 'Montana')
/
INSERT INTO states
VALUES (27,'Nebraska', 'Lincoln','Cottonwood','Western Meadowlark','Goldenrod', 37, 'Beautiful Nebraska')
/
INSERT INTO states
VALUES (28,'Nevada', 'Carson City','Bristlecone Pine','Mountain Bluebird','Sagebrush', 36, 'Home Means Nevada')
/
INSERT INTO states
VALUES (29,'New Hampshire', 'Concord','Paper birch','Purple Finch','Purple Lilac', 9, 'Old New Hampshire')
/
INSERT INTO states
VALUES (30,'New Jersey', 'Trenton','Northern Red Oak','Eastern Goldfinch','Violet', 3, 'I''m From New Jersey')
/
INSERT INTO states
VALUES (31,'New Mexico', 'Sante Fe','Pinyon Pine','Roadrunner','Yucca flower', 47, 'O, Fair New Mexico')
/
INSERT INTO states
VALUES (32,'New York', 'Albany','Sugar Maple','Bluebird','Rose', 11, 'I Love New York')
/
INSERT INTO states
VALUES (33,'North Carolina', 'Raleigh','Longleaf Pine','Cardinal','Dogwood', 12, 'The Old North State')
/
INSERT INTO states
VALUES (34,'North Dakota', 'Bismarck','American Elm','Western Meadowlark','Wild Praire Rose', 39, 'North Dakota Hymn')
/
INSERT INTO states
VALUES (35,'Ohio', 'Columbus','Ohio Buckeye','Cardinal','Scarlet Carnation', 17, 'Beautiful Ohio')
/
INSERT INTO states
VALUES (36,'Oklahoma', 'Oklahoma City','Redbud','Scissor-tailed Flycatcher','Mistletoe', 46, 'Oklahoma')
/
INSERT INTO states
VALUES (37,'Oregon', 'Salem','Douglas Fir','Western Meadowlark','Oregon Grape', 33, 'Oregon, My Oregon')
/
INSERT INTO states
VALUES (38,'Pennsylvania', 'Harrisburg','Eastern Hemlock','Ruffed Grouse','Mountain laurel', 2, 'Pennsylvania')
/
INSERT INTO states
VALUES (39,'Rhode Island', 'Providence','Red Maple','Rhode Island Red','Violet', 13, 'Rhode Island It''s for me')
/
INSERT INTO states
VALUES (40,'South Carolina', 'Columbia','Cabbage Palmetto','Great Carolina Wren','Yellow Jassamine', 8, 'Carolina')
/
INSERT INTO states
VALUES (41,'South Dakato', 'Pierre','White Spruce','Ring-necked Pheasant','Pasque Flower', 40, 'Hail, South Dakota')
/
INSERT INTO states
VALUES (42,'Tennessee', 'Nashville','Yellow-poplar','Mockingbird','Iris', 16, 'My Homeland Tennessee')
/
INSERT INTO states
VALUES (43,'Texas', 'Austin','Pecan','Mockingbird','Bluebonnet', 28, 'Texas, Our Texas')
/
INSERT INTO states
VALUES (44,'Utah', 'Salt Lake City','Blue Spruce','California Seagull','Sego lily', 45, 'Utah, We Love Thee')
/
INSERT INTO states
VALUES (45,'Vermont', 'Montpelier','Sugar Maple','Hermit Thrush','Red Clover', 14, 'Hail, Vermont')
/
INSERT INTO states
VALUES (46,'Virginia', 'Richmond','Flowering Dogwood','Cardinal','Dogwood', 10, 'Carry Me Back to Old Virginia')
/
INSERT INTO states
VALUES (47,'Washington', 'Olympia','Western Hemlock','Willow Goldfinch','Pink Rhododendron', 42, 'Washington, My Home')
/
INSERT INTO states
VALUES (48,'West Virginia', 'Charleston','Sugar Maple','Cardinal','Rhododendron', 35, 'The West Virgina Hills')
/
INSERT INTO states
VALUES (49,'Wisconsin', 'Madison','Sugar Maple','Robin','Wood Violet', 30, 'On Wisconsin')
/
INSERT INTO states
VALUES (50,'Wyoming', 'Cheyenne','Cottonwood','Western Meadowlark','Indian Paintbrush', 44, 'Wyoming')
/