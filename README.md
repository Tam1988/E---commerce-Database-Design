#E-Commerce Database Design
##Introduction
This project is an e-commerce database schema built to manage products, brands, variations, and attributes for an online marketplace. It ensures data integrity, scalability, and supports diverse use cases for product management.

##Features
+Relational Database Design: Structured tables for brands, categories, products, and attributes.

+Scalability: Easily accommodates new products, variations, and additional features.

+Data Integrity: Implements primary and foreign keys with constraints for consistency.

+Sample Data: Includes African brands to highlight regional diversity.

##Schema Overview
###This database contains 12 tables:

*brand: Stores brand details.*

*product_category: Categorizes products.*

*product: Represents product details.*

*color: Manages available colors.*

*size_category: Groups size options into categories.*

*size_option: Lists specific sizes for products.*

*product_variation: Links products to size and color options.*

*product_item: Represents purchasable variations, stock, and pricing.*

*product_image: Stores image URLs for products.*

*attribute_category: Groups attributes into categories.*

*attribute_type: Defines attribute types.*

*product_attribute: Stores custom attributes of products.*

##Sample Data
###The database includes sample data for testing:

1. Brands: Dangote, Innoson Motors, Shoprite.

2. Categories: Clothing, Electronics, Food & Beverage, Footwear, Transport.

3. Colors: Black, Blue, Red, White, Green.

4. Products: Dangote Cement, Innoson Sedan, Shoprite Groceries.

5. Variations: Kente Cloth (Green, Small), Innoson Sedan (Red, Sedan).

##How to Use
*Clone the repository and navigate to your project folder.

*Import the SQL file (ecommerce.sql) into your database system.

*Execute provided sample queries to test functionality.

##Entity Relationship Diagram (ERD)
You can generate the ERD using the provided schema file on dbdiagram.io. It visually represents relationships among entities.

##Contributors
Ajaluwa Tamara https [Tam1988](://github.com/Tam1988)
