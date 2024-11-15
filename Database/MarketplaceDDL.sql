-- Student Marketplace

-- Create the new database if it does not exist already
CREATE DATABASE IF NOT EXISTS Marketplace;
USE Marketplace;

CREATE TABLE UserDetails (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(255) UNIQUE NOT NULL,
    is_student BIT,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user',
    is_archived BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Ads (
    ad_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    image LONGTEXT,
    phone_number VARCHAR(15),
    location_lat DECIMAL(10, 8),
    location_lon DECIMAL(11, 8),
    is_archived BOOLEAN DEFAULT FALSE,
    category_type VARCHAR(50) NOT NULL,
    category_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES UserDetails(user_id)
);

-- Creating the child tables of Ads
-- Creating child tables

CREATE TABLE Vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    year INT,
    mileage INT
);

CREATE TABLE Accommodation (
    accommodation_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    bedrooms INT,
    bathrooms INT,
    available_date DATE,
    parking BOOLEAN,
    smoking BOOLEAN,
    furnished BOOLEAN,
    pets BOOLEAN
);

CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    provider VARCHAR(255),
    opening_hours VARCHAR(255)
);

CREATE TABLE Electronics (
    electronic_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    `condition` VARCHAR(255) NOT NULL
);

CREATE TABLE Furniture (
    furniture_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    material VARCHAR(255),
    `condition` VARCHAR(255) NOT NULL
);

CREATE TABLE Appliances (
    appliance_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    `condition` VARCHAR(255) NOT NULL
);