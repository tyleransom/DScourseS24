--(a)
CREATE TABLE insurance_data1 (
  policyID INT,
  statecode TEXT,
  county TEXT,
  eq_site_limit REAL,
  hu_site_limit REAL,
  fl_site_limit REAL,
  fr_site_limit REAL,
  tiv_2011 REAL,
  tiv_2012 REAL,
  eq_site_deductible REAL,
  hu_site_deductible REAL,
  fl_site_deductible REAL,
  fr_site_deductible REAL,
  point_latitude REAL,
  point_longitude REAL,
  line TEXT,
  construction TEXT,
  point_granularity INT
);

.mode csv
.import 'FL_insurance_sample.csv' insurance_data1

--(b)
SELECT *
  FROM insurance_data1
LIMIT 10;

--(c)
SELECT DISTINCT county
FROM insurance_data1;

--(d)
SELECT AVG(tiv_2012 - tiv_2011) AS average_appreciation
FROM insurance_data1;

--(e)
SELECT construction, COUNT(*) AS frequency, COUNT(*) * 1.0 / (SELECT COUNT(*) FROM insurance_data1) AS fraction
FROM insurance_data1
GROUP BY construction;

