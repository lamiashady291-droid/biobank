CREATE DATABASE IF NOT EXISTS BiobankDB;
USE BiobankDB;

CREATE TABLE Donors (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Consent (
    consent_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    consent_date DATE NOT NULL,
    consent_type VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (donor_id) REFERENCES Donors(donor_id)
);

CREATE TABLE SampleTypes (
    sample_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200)
);

CREATE TABLE StorageLocations (
    storage_location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL,
    freezer_number VARCHAR(50),
    temperature DECIMAL(5,2) NOT NULL
);

CREATE TABLE CollectionEvents (
    collection_event_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    collection_date DATE NOT NULL,
    collection_method VARCHAR(100) NOT NULL,
    collector_name VARCHAR(100),
    FOREIGN KEY (donor_id) REFERENCES Donors(donor_id)
);

CREATE TABLE Samples (
    sample_id INT AUTO_INCREMENT PRIMARY KEY,
    collection_event_id INT NOT NULL,
    sample_type_id INT NOT NULL,
    storage_location_id INT NOT NULL,
    sample_code VARCHAR(50) NOT NULL UNIQUE,
    collection_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Available',
    FOREIGN KEY (collection_event_id) REFERENCES CollectionEvents(collection_event_id),
    FOREIGN KEY (sample_type_id) REFERENCES SampleTypes(sample_type_id),
    FOREIGN KEY (storage_location_id) REFERENCES StorageLocations(storage_location_id)
);

CREATE TABLE Researchers (
    researcher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(100)
);

CREATE TABLE TestRequests (
    test_request_id INT AUTO_INCREMENT PRIMARY KEY,
    researcher_id INT NOT NULL,
    request_date DATE NOT NULL,
    test_type VARCHAR(100) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id)
);

CREATE TABLE TestRequestSamples (
    test_request_id INT NOT NULL,
    sample_id INT NOT NULL,
    test_result VARCHAR(200),
    result_date DATE,
    PRIMARY KEY (test_request_id, sample_id),
    FOREIGN KEY (test_request_id) REFERENCES TestRequests(test_request_id),
    FOREIGN KEY (sample_id) REFERENCES Samples(sample_id)
);

CREATE TABLE SampleUsage (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    sample_id INT NOT NULL,
    researcher_id INT NOT NULL,
    usage_date DATE NOT NULL,
    quantity_used DECIMAL(10,2) NOT NULL,
    purpose VARCHAR(200),
    FOREIGN KEY (sample_id) REFERENCES Samples(sample_id),
    FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id)
);