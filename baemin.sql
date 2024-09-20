-- -------------------------------------------------------------
-- TablePlus 6.1.6(570)
--
-- https://tableplus.com/
--
-- Database: baemin
-- Generation Time: 2024-09-20 2:56:14.0220 PM
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS category_category_id_seq;

-- Table Definition
CREATE TABLE "public"."category" (
    "category_id" int4 NOT NULL DEFAULT nextval('category_category_id_seq'::regclass),
    "category_name" varchar(255),
    "deleted" bool DEFAULT false,
    PRIMARY KEY ("category_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS order_cart_order_cart_id_seq;

-- Table Definition
CREATE TABLE "public"."order_cart" (
    "order_cart_id" int4 NOT NULL DEFAULT nextval('order_cart_order_cart_id_seq'::regclass),
    "product_id" int4,
    "quantity" int4,
    "order_id" varchar(255),
    PRIMARY KEY ("order_cart_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS order_tracking_order_tracking_id_seq;

-- Table Definition
CREATE TABLE "public"."order_tracking" (
    "order_tracking_id" int4 NOT NULL DEFAULT nextval('order_tracking_order_tracking_id_seq'::regclass),
    "order_id" varchar(255),
    "tracking_id" int4,
    "active" bool,
    PRIMARY KEY ("order_tracking_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."orders" (
    "order_id" varchar(255) NOT NULL,
    "date" date,
    "store_id" int4,
    "user_id" int4,
    "payment" varchar(255),
    "address" varchar(255),
    "note" varchar(255),
    "fee" int4,
    "discount" int4,
    "tracking_id" int4,
    "deleted" bool DEFAULT false,
    PRIMARY KEY ("order_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS product_product_id_seq;

-- Table Definition
CREATE TABLE "public"."product" (
    "product_id" int4 NOT NULL DEFAULT nextval('product_product_id_seq'::regclass),
    "product_name" varchar(255),
    "price" int4,
    "description" varchar(255),
    "stock" int4,
    "store_id" int4,
    "img" varchar(255),
    "category_id" int4,
    PRIMARY KEY ("product_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS store_store_id_seq;

-- Table Definition
CREATE TABLE "public"."store" (
    "store_id" int4 NOT NULL DEFAULT nextval('store_store_id_seq'::regclass),
    "store_name" varchar(255),
    "store_address" varchar(255),
    "category_id" int4,
    "img" varchar(255),
    "deleted" bool DEFAULT false,
    PRIMARY KEY ("store_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS tracking_tracking_id_seq;

-- Table Definition
CREATE TABLE "public"."tracking" (
    "tracking_id" int4 NOT NULL DEFAULT nextval('tracking_tracking_id_seq'::regclass),
    "tracking_status" varchar(255),
    PRIMARY KEY ("tracking_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_user_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "user_id" int4 NOT NULL DEFAULT nextval('users_user_id_seq'::regclass),
    "user_name" varchar(255),
    "phone_number" varchar(255),
    "email" varchar(255),
    "password" varchar(255),
    "user_role" varchar(255),
    PRIMARY KEY ("user_id")
);

INSERT INTO "public"."category" ("category_id", "category_name", "deleted") VALUES
(1, 'Fast Food', 'f'),
(2, 'Vietnamese Food', 'f'),
(3, 'Asian Cuisine', 'f');

INSERT INTO "public"."order_cart" ("order_cart_id", "product_id", "quantity", "order_id") VALUES
(1, 4, 3, 'cedb2a66-96c3-4f37-9d23-705cef8557c1'),
(2, 5, 1, 'cedb2a66-96c3-4f37-9d23-705cef8557c1'),
(3, 1, 2, 'afb7e680-229b-42d7-bc8e-edac43d8724c'),
(4, 3, 1, 'afb7e680-229b-42d7-bc8e-edac43d8724c'),
(5, 1, 2, 'f704095f-dafa-43de-8a54-c42047ce7a92'),
(6, 3, 1, 'f704095f-dafa-43de-8a54-c42047ce7a92'),
(7, 4, 3, '032eba0c-34b8-40f3-8b6e-88b427799dba'),
(8, 5, 1, '032eba0c-34b8-40f3-8b6e-88b427799dba'),
(9, 2, 1, '032eba0c-34b8-40f3-8b6e-88b427799dba'),
(10, 9, 1, '032eba0c-34b8-40f3-8b6e-88b427799dba'),
(11, 4, 3, 'b55915d6-528d-4fab-991e-0699ec1895c2'),
(12, 5, 1, 'b55915d6-528d-4fab-991e-0699ec1895c2'),
(13, 2, 1, 'b55915d6-528d-4fab-991e-0699ec1895c2'),
(14, 9, 1, 'b55915d6-528d-4fab-991e-0699ec1895c2'),
(15, 4, 3, '9fddf2db-2c1b-4e9c-bf49-223ff81edda1'),
(16, 5, 1, '9fddf2db-2c1b-4e9c-bf49-223ff81edda1'),
(17, 2, 1, '9fddf2db-2c1b-4e9c-bf49-223ff81edda1'),
(18, 9, 1, '9fddf2db-2c1b-4e9c-bf49-223ff81edda1'),
(19, 4, 3, 'a4b79097-01b3-4c22-9d2b-237f53d27423'),
(20, 5, 1, 'a4b79097-01b3-4c22-9d2b-237f53d27423'),
(21, 2, 1, 'a4b79097-01b3-4c22-9d2b-237f53d27423'),
(22, 9, 1, 'a4b79097-01b3-4c22-9d2b-237f53d27423'),
(23, 4, 3, '71c8784b-4927-4ee9-8cc3-884761d9106a'),
(24, 5, 1, '71c8784b-4927-4ee9-8cc3-884761d9106a'),
(25, 2, 1, '71c8784b-4927-4ee9-8cc3-884761d9106a'),
(26, 9, 1, '71c8784b-4927-4ee9-8cc3-884761d9106a'),
(27, 4, 3, 'fd5bd4d4-80c0-4751-9bd8-a3437dbd60e8'),
(28, 5, 1, 'fd5bd4d4-80c0-4751-9bd8-a3437dbd60e8'),
(29, 2, 1, 'fd5bd4d4-80c0-4751-9bd8-a3437dbd60e8'),
(30, 9, 1, 'fd5bd4d4-80c0-4751-9bd8-a3437dbd60e8'),
(31, 4, 3, 'c00c7010-4a3e-4251-8604-8fd1c34502b0'),
(32, 5, 1, 'c00c7010-4a3e-4251-8604-8fd1c34502b0'),
(33, 2, 1, 'c00c7010-4a3e-4251-8604-8fd1c34502b0'),
(34, 9, 1, 'c00c7010-4a3e-4251-8604-8fd1c34502b0'),
(35, 4, 3, 'fad1f3c4-b6fc-489c-b6c6-81631ce10dd7'),
(36, 5, 1, 'fad1f3c4-b6fc-489c-b6c6-81631ce10dd7'),
(37, 2, 1, 'fad1f3c4-b6fc-489c-b6c6-81631ce10dd7'),
(38, 9, 1, 'fad1f3c4-b6fc-489c-b6c6-81631ce10dd7'),
(39, 6, 1, '6a8872eb-9432-481f-99de-01dbc7b515a9'),
(40, 16, 1, '6a8872eb-9432-481f-99de-01dbc7b515a9'),
(41, 6, 1, '98175243-e87f-4b9b-81a9-77fc045c02f0'),
(42, 16, 1, '98175243-e87f-4b9b-81a9-77fc045c02f0'),
(43, 6, 1, '358f7336-3705-4921-8afc-f7e30a743c1b'),
(44, 16, 1, '358f7336-3705-4921-8afc-f7e30a743c1b'),
(45, 13, 1, '358f7336-3705-4921-8afc-f7e30a743c1b'),
(46, 4, 3, 'fecb2b40-11b2-4e43-a60b-a33f332d67cf'),
(47, 5, 1, 'fecb2b40-11b2-4e43-a60b-a33f332d67cf'),
(48, 2, 1, 'fecb2b40-11b2-4e43-a60b-a33f332d67cf'),
(49, 9, 1, 'fecb2b40-11b2-4e43-a60b-a33f332d67cf'),
(50, 6, 1, 'd556746a-d74c-40db-9cd7-774f1351da7e'),
(51, 16, 1, 'd556746a-d74c-40db-9cd7-774f1351da7e'),
(52, 13, 1, 'd556746a-d74c-40db-9cd7-774f1351da7e'),
(53, 21, 1, 'd556746a-d74c-40db-9cd7-774f1351da7e'),
(54, 22, 1, 'd556746a-d74c-40db-9cd7-774f1351da7e'),
(55, 9, 1, 'ca2ba9b6-61ea-4f7d-a5fa-77e792b103e9'),
(56, 13, 1, 'ca2ba9b6-61ea-4f7d-a5fa-77e792b103e9'),
(57, 6, 1, 'ca2ba9b6-61ea-4f7d-a5fa-77e792b103e9'),
(58, 16, 2, '0870efc1-8fee-4cd3-9fdb-12aa2577d099'),
(59, 6, 1, '0870efc1-8fee-4cd3-9fdb-12aa2577d099');

INSERT INTO "public"."order_tracking" ("order_tracking_id", "order_id", "tracking_id", "active") VALUES
(1, 'afb7e680-229b-42d7-bc8e-edac43d8724c', 2, 't'),
(2, 'f704095f-dafa-43de-8a54-c42047ce7a92', 2, 't'),
(3, '032eba0c-34b8-40f3-8b6e-88b427799dba', 2, 't'),
(4, 'b55915d6-528d-4fab-991e-0699ec1895c2', 1, 't'),
(5, '9fddf2db-2c1b-4e9c-bf49-223ff81edda1', 1, 't'),
(6, 'a4b79097-01b3-4c22-9d2b-237f53d27423', 1, 't'),
(7, '71c8784b-4927-4ee9-8cc3-884761d9106a', 1, 't'),
(8, 'fd5bd4d4-80c0-4751-9bd8-a3437dbd60e8', 1, 't'),
(9, 'c00c7010-4a3e-4251-8604-8fd1c34502b0', 2, 't'),
(10, 'fad1f3c4-b6fc-489c-b6c6-81631ce10dd7', 5, 't'),
(11, '6a8872eb-9432-481f-99de-01dbc7b515a9', 1, 't'),
(12, '98175243-e87f-4b9b-81a9-77fc045c02f0', 1, 't'),
(13, '358f7336-3705-4921-8afc-f7e30a743c1b', 2, 't'),
(14, 'fecb2b40-11b2-4e43-a60b-a33f332d67cf', 1, 't'),
(15, 'd556746a-d74c-40db-9cd7-774f1351da7e', 3, 't'),
(16, 'ca2ba9b6-61ea-4f7d-a5fa-77e792b103e9', 3, 't'),
(17, '0870efc1-8fee-4cd3-9fdb-12aa2577d099', 1, 't');

INSERT INTO "public"."orders" ("order_id", "date", "store_id", "user_id", "payment", "address", "note", "fee", "discount", "tracking_id", "deleted") VALUES
('032eba0c-34b8-40f3-8b6e-88b427799dba', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('0870efc1-8fee-4cd3-9fdb-12aa2577d099', '2024-09-20', NULL, 0, 'cash', 'q3', 'Leave at the door', 5000, 1000, 1, 'f'),
('358f7336-3705-4921-8afc-f7e30a743c1b', '2024-09-19', NULL, 0, 'cash', 'q3', 'Leave at the door', 5000, 1000, 1, 'f'),
('6a8872eb-9432-481f-99de-01dbc7b515a9', '2024-09-19', NULL, 0, 'cash', 'q3', 'Leave at the door', 5000, 1000, 1, 'f'),
('71c8784b-4927-4ee9-8cc3-884761d9106a', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('98175243-e87f-4b9b-81a9-77fc045c02f0', '2024-09-19', NULL, 0, 'cash', 'q3', 'Leave at the door', 5000, 1000, 1, 'f'),
('9fddf2db-2c1b-4e9c-bf49-223ff81edda1', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('a4b79097-01b3-4c22-9d2b-237f53d27423', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('afb7e680-229b-42d7-bc8e-edac43d8724c', '2024-09-19', 1, 1, 'Credit Card', '123 Example Street', 'Leave at the door ee', 5000, 1000, 1, 'f'),
('b55915d6-528d-4fab-991e-0699ec1895c2', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('c00c7010-4a3e-4251-8604-8fd1c34502b0', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('ca2ba9b6-61ea-4f7d-a5fa-77e792b103e9', '2024-09-19', NULL, 0, 'cash', 'q3', 'Leave at the door', 5000, 1000, 1, 'f'),
('cedb2a66-96c3-4f37-9d23-705cef8557c1', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('d556746a-d74c-40db-9cd7-774f1351da7e', '2024-09-19', NULL, 0, 'cash', 'q3', 'Leave at the door', 5000, 1000, 1, 'f'),
('f704095f-dafa-43de-8a54-c42047ce7a92', '2024-09-19', 1, 1, 'Credit Card', '123 Example Street', 'Leave at the door ee', 5000, 1000, 1, 'f'),
('fad1f3c4-b6fc-489c-b6c6-81631ce10dd7', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('fd5bd4d4-80c0-4751-9bd8-a3437dbd60e8', '2024-09-19', NULL, 0, 'Credit Card', '123 Example Street', 'Leave at the door', 5000, 1000, 1, 'f'),
('fecb2b40-11b2-4e43-a60b-a33f332d67cf', '2024-09-19', NULL, 0, 'cash', 'q3', 'Leave at the door', 5000, 1000, 1, 'f');

INSERT INTO "public"."product" ("product_id", "product_name", "price", "description", "stock", "store_id", "img", "category_id") VALUES
(1, 'Fried Chicken', 50000, 'Crispy fried chicken', 96, 1, 'https://s.net.vn/s0dv', 1),
(2, 'Hamburger', 40000, 'Beef burger with vegetables', 191, 1, 'https://s.net.vn/r2Lq', 1),
(3, 'Cheeseburger', 45000, 'Burger with cheese', 148, 2, 'https://s.net.vn/r2Lq', 1),
(4, 'Pho Tai', 60000, 'Traditional Vietnamese noodle soup with rare beef', 20, 3, 'https://s.net.vn/16UN', 2),
(5, 'Pho Nam', 60000, 'Vietnamese noodle soup with brisket', 40, 3, 'https://s.net.vn/16UN', 2),
(6, 'Whopper', 50000, 'Large burger with beef patty', 114, 4, 'https://s.net.vn/r2Lq', 1),
(7, 'Pepperoni Pizza', 80000, 'Pizza with pepperoni toppings', 70, 5, 'https://s.net.vn/16y7', 1),
(8, 'Veggie Pizza', 75000, 'Pizza with vegetables', 60, 5, 'https://s.net.vn/16y7', 1),
(9, 'Grilled Chicken', 55000, 'Grilled chicken with spices', 90, 1, 'https://s.net.vn/s0dv', 1),
(10, 'Fish Fillet', 48000, 'Fried fish fillet sandwich', 90, 2, 'https://s.net.vn/r2Lq', 1),
(11, 'Chicken Pho', 60000, 'Vietnamese noodle soup with chicken', 40, 3, 'https://s.net.vn/16UN', 2),
(12, 'Bacon Burger', 52000, 'Burger with bacon and cheese', 130, 2, 'https://s.net.vn/16y7', 1),
(13, 'Spicy Chicken Burger', 45000, 'Spicy fried chicken burger', 107, 1, 'https://s.net.vn/16y7', 1),
(14, 'Shrimp Pho', 70000, 'Vietnamese noodle soup with shrimp', 30, 3, 'https://s.net.vn/16UN', 2),
(15, 'Meat Lover Pizza', 85000, 'Pizza with various meats', 50, 5, 'https://s.net.vn/16y7', 1),
(16, 'Cheesy Fries', 30000, 'Fries topped with melted cheese', 194, 4, 'https://s.net.vn/s0dv', 1),
(17, 'Chicken Wings', 45000, 'Spicy chicken wings', 150, 1, 'https://s.net.vn/s0dv', 1),
(18, 'Beef Steak', 120000, 'Grilled beef steak', 80, 2, 'https://s.net.vn/16y7', 1),
(19, 'Vegetarian Pho', 60000, 'Vietnamese noodle soup with vegetables', 35, 3, 'https://s.net.vn/16UN', 2),
(20, 'Double Cheeseburger', 48000, 'Burger with double cheese', 140, 4, 'https://s.net.vn/16y7', 1),
(21, 'Hawaiian Pizza', 82000, 'Pizza with ham and pineapple', 44, 5, 'https://s.net.vn/16y7', 1),
(22, 'BBQ Chicken Pizza', 85000, 'Pizza with BBQ chicken', 54, 5, 'https://s.net.vn/16y7', 1),
(23, 'Spicy Pho', 65000, 'Spicy Vietnamese noodle soup', 40, 3, 'https://s.net.vn/16UN', 2),
(24, 'Caesar Salad', 35000, 'Salad with chicken and Caesar dressing', 100, 1, 'https://s.net.vn/16y7', 1),
(25, 'Chicken Nuggets', 32000, 'Fried chicken nuggets', 180, 1, 'https://s.net.vn/16y7', 1),
(26, 'Double Whopper', 60000, 'Double patty burger', 110, 4, 'https://s.net.vn/16y7', 1),
(27, 'Supreme Pizza', 87000, 'Pizza with supreme toppings', 50, 5, 'https://s.net.vn/16y7', 1),
(28, 'Beef Burrito', 55000, 'Burrito with beef and vegetables', 100, 2, 'https://s.net.vn/16y7', 1),
(29, 'Spaghetti Bolognese', 70000, 'Spaghetti with meat sauce', 80, 1, 'https://s.net.vn/16y7', 1),
(30, 'French Fries', 20000, 'Crispy French fries', 300, 1, 'https://s.net.vn/r2Lq', 3);

INSERT INTO "public"."store" ("store_id", "store_name", "store_address", "category_id", "img", "deleted") VALUES
(1, 'KFC', 'q1', 1, 'https://s.net.vn/PNCs', 'f'),
(2, 'McDonalds', 'q2', 1, 'https://s.net.vn/QO09', 'f'),
(3, 'Pho 24', 'q3', 2, 'https://s.net.vn/arxr', 'f'),
(4, 'Burger King', 'q4', 1, 'https://s.net.vn/ZRkb', 'f'),
(5, 'Pizza Hut', 'q5', 1, 'https://s.net.vn/OF9G', 'f');

INSERT INTO "public"."tracking" ("tracking_id", "tracking_status") VALUES
(1, 'Nhà hàng đã nhận đơn'),
(2, 'Shipper đã nhận đơn'),
(3, 'Shipper đang đến nhà hàng'),
(4, 'Shipper đã đến nhà hàng'),
(5, 'Shipper đang giao hàng'),
(6, 'Đơn hàng hoàn tất');

INSERT INTO "public"."users" ("user_id", "user_name", "phone_number", "email", "password", "user_role") VALUES
(0, 'koi', '12123', '0302211421@caothang.edu.vn', '$2b$10$wviPtY68YIoCrE6BpFJI4Os/wFCfb8V3SqD0tUQOyyOoAEnCW84a6', 'user'),
(1, 'John Doe', '0123456789', 'johndoe@gmail.com', 'password123', 'customer'),
(2, 'Jane Smith', '0987654321', 'janesmith@gmail.com', 'password456', 'customer'),
(3, 'Admin User', '0112233445', 'admin@restaurant.com', 'adminpass', 'admin'),
(69, 'hatran', '1231233', 'adda@caothang.edu.vn', '$2b$10$sASyrJ/hTX6W7xP3czx/hOBdRTDv5mth09VwaYbNqMipkpmAxDFAC', 'user');

ALTER TABLE "public"."order_cart" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id");
ALTER TABLE "public"."order_cart" ADD FOREIGN KEY ("product_id") REFERENCES "public"."product"("product_id");
ALTER TABLE "public"."order_tracking" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id");
ALTER TABLE "public"."order_tracking" ADD FOREIGN KEY ("tracking_id") REFERENCES "public"."tracking"("tracking_id");
ALTER TABLE "public"."orders" ADD FOREIGN KEY ("store_id") REFERENCES "public"."store"("store_id");
ALTER TABLE "public"."orders" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."orders" ADD FOREIGN KEY ("tracking_id") REFERENCES "public"."tracking"("tracking_id");
ALTER TABLE "public"."product" ADD FOREIGN KEY ("store_id") REFERENCES "public"."store"("store_id");
ALTER TABLE "public"."product" ADD FOREIGN KEY ("category_id") REFERENCES "public"."category"("category_id");
ALTER TABLE "public"."store" ADD FOREIGN KEY ("category_id") REFERENCES "public"."category"("category_id");
