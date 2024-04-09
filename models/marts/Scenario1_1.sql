/*Scenario 1*/
select 
    SUM(NB_EMPLOYEES) as Nombre_total_employes,
from {{ source("source_restaurants", "RESTAURANTS") }}
