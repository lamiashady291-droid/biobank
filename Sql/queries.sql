USE BiobankDB;

-- 1. Display all donors
SELECT * FROM Donors;

-- 2. Display selected donor information
SELECT first_name, last_name, gender
FROM Donors;

-- 3. Display female donors
SELECT *
FROM Donors
WHERE gender = 'Female';

-- 4. Sort donors alphabetically
SELECT first_name, last_name, email
FROM Donors
ORDER BY first_name ASC;

-- 5. JOIN Donors with CollectionEvents
SELECT 
    Donors.first_name,
    Donors.last_name,
    CollectionEvents.collection_date,
    CollectionEvents.collection_method
FROM Donors
JOIN CollectionEvents
    ON Donors.donor_id = CollectionEvents.donor_id;

-- 6. Multiple-table JOIN
SELECT
    Donors.first_name,
    Donors.last_name,
    Samples.sample_code,
    SampleTypes.type_name,
    StorageLocations.location_name,
    StorageLocations.temperature
FROM Donors
JOIN CollectionEvents
    ON Donors.donor_id = CollectionEvents.donor_id
JOIN Samples
    ON CollectionEvents.collection_event_id = Samples.collection_event_id
JOIN SampleTypes
    ON Samples.sample_type_id = SampleTypes.sample_type_id
JOIN StorageLocations
    ON Samples.storage_location_id = StorageLocations.storage_location_id;

-- 7. Aggregation
SELECT
    SampleTypes.type_name,
    COUNT(Samples.sample_id) AS number_of_samples
FROM SampleTypes
LEFT JOIN Samples
    ON SampleTypes.sample_type_id = Samples.sample_type_id
GROUP BY SampleTypes.type_name;

-- 8. Subquery
SELECT first_name, last_name
FROM Donors
WHERE donor_id IN (
    SELECT donor_id
    FROM CollectionEvents
);

-- 9. UPDATE
UPDATE Samples
SET status = 'Used'
WHERE sample_id = 1;

-- 10. Check updated sample
SELECT *
FROM Samples
WHERE sample_id = 1;

-- 11. INSERT test record
INSERT INTO Researchers
(first_name, last_name, email, department)
VALUES
('Test', 'Researcher', 'test.researcher@biobank.com', 'Testing');

-- 12. DELETE test record
DELETE FROM Researchers
WHERE email = 'test.researcher@biobank.com';