-- This script reports the first date when Quebec reported a covid case.

--load the data from HDFS and define the schema
coviddata = LOAD '/data/Covid19Canada.csv' USING PigStorage(',') AS (prname:CHARARRAY, idate:CHARARRAY, newcases:INT, newdeaths:INT, tests:INT, recoveries:INT);

coviddataByProvince = GROUP coviddata BY prname;

-- Read the attributes we are interested in.
death = FOREACH coviddataByProvince GENERATE ($0), SUM(coviddata.newdeaths) AS sum_deaths;

-- Filter to get only 2.0+
proj = FILTER death BY sum_deaths >= 100;

-- Order that by the date
orderDeaths = ORDER proj BY sum_deaths DESC;

-- output
DUMP orderDeaths;
