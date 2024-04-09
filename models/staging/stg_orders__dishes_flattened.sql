SELECT
    o.*,
    d.value AS dishes_id
FROM 
    {{ ref('base_orders') }} AS o,
    TABLE(flatten(input => parse_json(o.dishes_ids), outer => true)) AS d