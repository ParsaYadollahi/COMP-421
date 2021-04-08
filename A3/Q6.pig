-- This script reports the first date when Quebec reported a covid case.

--load the data from HDFS and define the schema
coviddata = LOAD '/data/Covid19Canada.csv' USING PigStorage(',') AS (prname:CHARARRAY, idate:CHARARRAY, newcases:INT, newdeaths:INT, tests:INT, recoveries:INT);

--Get all the cases for Quebec province
qcCases = FILTER coviddata BY prname == 'Quebec';

--Projection of all the fields we need
projQcCases = FOREACH qcCases GENERATE prname, newdeaths, idate;

--Group by province
groupQcCases = GROUP projQcCases BY prname;

--Sum up the deaths for the provinces to get the total number of deaths
sumDeathsQc = FOREACH groupQcCases GENERATE group AS province, SUM(projQcCases.newdeaths) AS sumDeaths;

--Join on province name
JoinedProvince = JOIN qcCases BY prname, sumDeathsQc BY province;

--Calculate mortality rate
MortalityRate = FOREACH JoinedProvince GENERATE qcCases::idate, qcCases::newdeaths, (((1.0 * qcCases::newdeaths) / (1.0 * sumDeathsQc::sumDeaths))*100) AS MortalityRate;

--Filter mortality rate by those > 1%
filgerMortRate = FILTER MortalityRate BY MortalityRate >= 1.0;

--Order mortality rates in descending order
orderedRes = ORDER filgerMortRate BY idate;

DUMP orderedRes;
