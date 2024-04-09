{% set payment_methods = ["cash", "card","meal_ticket","cheque"] %}


with base_orders as (

    select restaurant_identifier, 
    {% for payment_method in payment_methods %} 
    sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
    {% endfor %}
     sum(amount) as turnover
    
    from {{ ref('base_orders') }}

    group by restaurant_identifier

  
),
base_restaurants as (

select name as Restaurant_name , identifier, address

from {{ ref('base_restaurants') }}

)

select 
base_restaurants.identifier as Identifier, 
base_restaurants.Restaurant_name as Name ,
base_restaurants.address as Address ,
base_orders.turnover as Turnover,

{% for payment_method in payment_methods %}
    {{payment_method}}_amount
    {% if not loop.last %}, 
    {% endif %}
    {% endfor %}

from base_restaurants
join base_orders
on base_orders.restaurant_identifier = base_restaurants.identifier