CREATE DATABASE Ecommerce_db;
USE Ecommerce_db;
 
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL UNIQUE,  
    brand_description TEXT 
);

CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL UNIQUE 
);

CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE  
);

CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_value VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE  
);

CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL,
    attribute_category_id INT NOT NULL,  
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    base_price DECIMAL(10,2) NOT NULL CHECK (base_price >= 0), 
    description TEXT,  
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),  
    quantity_in_stock INT NOT NULL CHECK (quantity_in_stock >= 0),  
    sku VARCHAR(100) UNIQUE,  
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_category_id INT NOT NULL,
    attribute_type_id INT NOT NULL,
    attribute_name VARCHAR(100) NOT NULL,
    attribute_value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,  
    email VARCHAR(255) UNIQUE,  
    password VARCHAR(255),  
    role VARCHAR(50) DEFAULT 'customer',  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    user_id INT NOT NULL,
    status ENUM('draft', 'published') DEFAULT 'draft',  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE follows (
    following_user_id INT NOT NULL,
    followed_user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (following_user_id, followed_user_id),
    FOREIGN KEY (following_user_id) REFERENCES users(id),
    FOREIGN KEY (followed_user_id) REFERENCES users(id)
);

-- Inserting into brand table
INSERT INTO brand (brand_name, brand_description)
VALUES 
('Dangote', 'Leading Nigerian conglomerate specializing in cement, sugar, and other products'),
('Innoson Motors', 'Nigeria’s first indigenous automobile manufacturing company'),
('Shoprite', 'Pan-African retail giant providing affordable goods across the continent'),
('Ethiopian Airlines', 'Africa’s largest airline connecting the continent and beyond'),
('Kente Cloth Ghana', 'Celebrating Ghanaian cultural heritage with traditional handcrafted textiles');

-- Inserting into product_category table
INSERT INTO product_category (category_name)
VALUES 
('Clothing'),
('Electronics'),
('Food & Beverage'),
('Footwear'),
('Transport');

-- Inserting into color table
INSERT INTO color (color_name)
VALUES 
('Black'),
('Blue'),
('Red'),
('White'),
('Green');

-- Inserting into size_category table
INSERT INTO size_category (category_name)
VALUES 
('Clothing Sizes'),
('Shoe Sizes'),
('Vehicle Models'),
('Bag Sizes');

-- Inserting into size_option table
INSERT INTO size_option (size_category_id, size_value)
VALUES 
(1, 'S'),
(1, 'M'),
(2, '42'),
(2, '44'),
(3, 'SUV'),
(3, 'Sedan');

-- Inserting into product table
INSERT INTO product (product_name, brand_id, category_id, base_price, description)
VALUES 
('Dangote Cement', 1, 3, 10.99, 'High-quality cement for construction'),
('Innoson Sedan', 2, 5, 12000.00, 'Reliable and affordable sedan for families'),
('Shoprite Groceries', 3, 3, 25.50, 'Affordable daily essentials'),
('Traditional Kente Cloth', 5, 1, 50.00, 'Beautifully handcrafted textile from Ghana'),
('Ethiopian Airlines Ticket', 4, 5, 500.00, 'Affordable flights within Africa and beyond');

-- Inserting into product_variation table
INSERT INTO product_variation (product_id, color_id, size_option_id)
VALUES 
(1, 1, NULL), 
(2, 3, 6),  
(4, 5, 1),  
(5, NULL, NULL);  

-- Inserting into product_item table
INSERT INTO product_item (variation_id, price, quantity_in_stock, sku)
VALUES 
(1, 10.99, 100, 'DC-BLK'),  
(2, 12000.00, 15, 'IS-RDSED'), 
(3, 50.00, 20, 'KC-GRN-SM'),  
(4, 500.00, 50, 'EA-FLIGHT');  

-- Inserting into product_image table
INSERT INTO product_image (product_id, image_url)
VALUES 
(1, 'https://example.com/images/dangote-cement.jpg'),
(2, 'https://example.com/images/innoson-sedan.jpg'),
(4, 'https://example.com/images/kente-cloth.jpg'),
(5, 'https://example.com/images/ethiopian-airlines.jpg');

-- Inserting into attribute_category table
INSERT INTO attribute_category (category_name)
VALUES 
('Physical Attributes'),
('Technical Specifications'),
('Service Details');

-- Inserting into attribute_type table
INSERT INTO attribute_type (type_name, attribute_category_id)
VALUES 
('Material', 1),
('Weight', 1),
('Engine Type', 2),
('Flight Duration', 3);

-- Inserting into product_attribute table
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, attribute_name, attribute_value)
VALUES 
(1, 1, 2, 'Weight', '50kg'), 
(2, 2, 3, 'Engine Type', 'Hybrid'),  
(5, 3, 4, 'Flight Duration', '5 hours');  
 