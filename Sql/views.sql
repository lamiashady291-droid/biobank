USE BiobankDB;

CREATE VIEW DonorSampleView AS
SELECT
    d.donor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS donor_name,
    s.sample_code,
    st.type_name AS sample_type,
    sl.location_name,
    sl.temperature,
    s.status
FROM Donors d
JOIN CollectionEvents ce
    ON d.donor_id = ce.donor_id
JOIN Samples s
    ON ce.collection_event_id = s.collection_event_id
JOIN SampleTypes st
    ON s.sample_type_id = st.sample_type_id
JOIN StorageLocations sl
    ON s.storage_location_id = sl.storage_location_id;

CREATE VIEW ResearchTestView AS
SELECT
    tr.test_request_id,
    CONCAT(r.first_name, ' ', r.last_name) AS researcher_name,
    r.department,
    tr.request_date,
    tr.test_type,
    tr.status
FROM TestRequests tr
JOIN Researchers r
    ON tr.researcher_id = r.researcher_id;

-- Test View 1
SELECT * FROM DonorSampleView;

-- Test View 2
SELECT * FROM ResearchTestView;