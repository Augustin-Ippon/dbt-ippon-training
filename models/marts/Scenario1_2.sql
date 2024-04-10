/*Scenario 1_2*/
SELECT * 
    FROM {{ source("source_restaurants", "RESTAURANTS") }}
WHERE OPEN_ON_SUNDAY::boolean