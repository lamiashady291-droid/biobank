USE BiobankDB;

INSERT INTO Donors
(first_name, last_name, gender, date_of_birth, phone, email)
VALUES
('Ahmed', 'Ali', 'Male', '2000-05-12', '01011111111', 'ahmed.ali@email.com'),
('Mariam', 'Hassan', 'Female', '1999-08-20', '01022222222', 'mariam.hassan@email.com'),
('Omar', 'Khaled', 'Male', '2001-03-15', '01033333333', 'omar.khaled@email.com'),
('Sara', 'Mahmoud', 'Female', '2000-11-10', '01044444444', 'sara.mahmoud@email.com'),
('Youssef', 'Ibrahim', 'Male', '1998-07-25', '01055555555', 'youssef.ibrahim@email.com'),
('Nour', 'Samir', 'Female', '2002-01-18', '01066666666', 'nour.samir@email.com'),
('Karim', 'Adel', 'Male', '1999-12-03', '01077777777', 'karim.adel@email.com'),
('Hana', 'Tarek', 'Female', '2001-06-14', '01088888888', 'hana.tarek@email.com'),
('Mohamed', 'Fathy', 'Male', '2000-09-30', '01099999999', 'mohamed.fathy@email.com'),
('Laila', 'Mostafa', 'Female', '1998-04-22', '01100000000', 'laila.mostafa@email.com');

INSERT INTO Consent
(donor_id, consent_date, consent_type, status)
VALUES
(1, '2026-01-05', 'Sample Collection', 'Active'),
(2, '2026-01-06', 'Sample Collection', 'Active'),
(3, '2026-01-07', 'Research Use', 'Active'),
(4, '2026-01-08', 'Sample Collection', 'Active'),
(5, '2026-01-09', 'Research Use', 'Active'),
(6, '2026-01-10', 'Sample Collection', 'Active'),
(7, '2026-01-11', 'Research Use', 'Active'),
(8, '2026-01-12', 'Sample Collection', 'Active'),
(9, '2026-01-13', 'Research Use', 'Active'),
(10, '2026-01-14', 'Sample Collection', 'Active');

INSERT INTO SampleTypes
(type_name, description)
VALUES
('Blood', 'Whole blood sample'),
('Plasma', 'Blood plasma sample'),
('Serum', 'Blood serum sample'),
('DNA', 'Extracted DNA sample'),
('RNA', 'Extracted RNA sample'),
('Tissue', 'Biological tissue sample'),
('Urine', 'Urine sample'),
('Saliva', 'Saliva sample'),
('Cell Culture', 'Cultured cell sample'),
('Bone Marrow', 'Bone marrow sample');

INSERT INTO StorageLocations
(location_name, freezer_number, temperature)
VALUES
('Freezer Room A', 'FZ-01', -20.00),
('Freezer Room A', 'FZ-02', -20.00),
('Freezer Room B', 'FZ-03', -80.00),
('Freezer Room B', 'FZ-04', -80.00),
('Storage Room C', 'FZ-05', 4.00),
('Storage Room C', 'FZ-06', 4.00),
('Freezer Room D', 'FZ-07', -20.00),
('Freezer Room D', 'FZ-08', -80.00),
('Storage Room E', 'FZ-09', 4.00),
('Storage Room E', 'FZ-10', -20.00);

INSERT INTO CollectionEvents
(donor_id, collection_date, collection_method, collector_name)
VALUES
(1, '2026-02-01', 'Blood Draw', 'Dr. Ahmed Hassan'),
(2, '2026-02-02', 'Blood Draw', 'Dr. Sara Ali'),
(3, '2026-02-03', 'Saliva Collection', 'Dr. Mohamed Adel'),
(4, '2026-02-04', 'Blood Draw', 'Dr. Ahmed Hassan'),
(5, '2026-02-05', 'Urine Collection', 'Dr. Sara Ali'),
(6, '2026-02-06', 'Blood Draw', 'Dr. Mohamed Adel'),
(7, '2026-02-07', 'Tissue Collection', 'Dr. Ahmed Hassan'),
(8, '2026-02-08', 'Saliva Collection', 'Dr. Sara Ali'),
(9, '2026-02-09', 'Blood Draw', 'Dr. Mohamed Adel'),
(10, '2026-02-10', 'Urine Collection', 'Dr. Ahmed Hassan');

INSERT INTO Samples
(collection_event_id, sample_type_id, storage_location_id, sample_code, collection_date, status)
VALUES
(1, 1, 1, 'SMP-001', '2026-02-01', 'Available'),
(2, 2, 2, 'SMP-002', '2026-02-02', 'Available'),
(3, 3, 3, 'SMP-003', '2026-02-03', 'Available'),
(4, 4, 4, 'SMP-004', '2026-02-04', 'Available'),
(5, 5, 5, 'SMP-005', '2026-02-05', 'Available'),
(6, 6, 6, 'SMP-006', '2026-02-06', 'Available'),
(7, 7, 7, 'SMP-007', '2026-02-07', 'Available'),
(8, 8, 8, 'SMP-008', '2026-02-08', 'Available'),
(9, 9, 9, 'SMP-009', '2026-02-09', 'Available'),
(10, 10, 10, 'SMP-010', '2026-02-10', 'Available');

INSERT INTO Researchers
(first_name, last_name, email, department)
VALUES
('Ahmed', 'Hassan', 'ahmed.hassan@biobank.com', 'Genetics'),
('Sara', 'Ali', 'sara.ali@biobank.com', 'Molecular Biology'),
('Mohamed', 'Adel', 'mohamed.adel@biobank.com', 'Biotechnology'),
('Mona', 'Khalil', 'mona.khalil@biobank.com', 'Genetics'),
('Omar', 'Nabil', 'omar.nabil@biobank.com', 'Microbiology'),
('Nour', 'Fathy', 'nour.fathy@biobank.com', 'Molecular Biology'),
('Karim', 'Samir', 'karim.samir@biobank.com', 'Biochemistry'),
('Hana', 'Mahmoud', 'hana.mahmoud@biobank.com', 'Biotechnology'),
('Youssef', 'Tarek', 'youssef.tarek@biobank.com', 'Genetics'),
('Laila', 'Mostafa', 'laila.mostafa@biobank.com', 'Cell Biology');

INSERT INTO TestRequests
(researcher_id, request_date, test_type, status)
VALUES
(1, '2026-03-01', 'DNA Sequencing', 'Completed'),
(2, '2026-03-02', 'PCR Test', 'Completed'),
(3, '2026-03-03', 'Protein Analysis', 'Pending'),
(4, '2026-03-04', 'Genetic Screening', 'Completed'),
(5, '2026-03-05', 'Microbial Analysis', 'Pending'),
(6, '2026-03-06', 'RNA Analysis', 'Completed'),
(7, '2026-03-07', 'Biochemical Test', 'Completed'),
(8, '2026-03-08', 'Cell Analysis', 'Pending'),
(9, '2026-03-09', 'DNA Sequencing', 'Completed'),
(10, '2026-03-10', 'PCR Test', 'Pending');

INSERT INTO TestRequestSamples
(test_request_id, sample_id, test_result, result_date)
VALUES
(1, 1, 'Normal', '2026-03-11'),
(2, 2, 'Positive', '2026-03-12'),
(3, 3, 'Pending', NULL),
(4, 4, 'Negative', '2026-03-13'),
(5, 5, 'Pending', NULL),
(6, 6, 'Normal', '2026-03-14'),
(7, 7, 'Within Range', '2026-03-15'),
(8, 8, 'Pending', NULL),
(9, 9, 'Normal', '2026-03-16'),
(10, 10, 'Pending', NULL);

INSERT INTO SampleUsage
(sample_id, researcher_id, usage_date, quantity_used, purpose)
VALUES
(1, 1, '2026-03-12', 2.50, 'DNA extraction'),
(2, 2, '2026-03-13', 1.50, 'PCR analysis'),
(3, 3, '2026-03-14', 3.00, 'Protein analysis'),
(4, 4, '2026-03-15', 2.00, 'Genetic screening'),
(5, 5, '2026-03-16', 1.00, 'Microbial analysis'),
(6, 6, '2026-03-17', 2.50, 'RNA extraction'),
(7, 7, '2026-03-18', 1.50, 'Biochemical analysis'),
(8, 8, '2026-03-19', 3.00, 'Cell analysis'),
(9, 9, '2026-03-20', 2.00, 'DNA sequencing'),
(10, 10, '2026-03-21', 1.50, 'PCR analysis');