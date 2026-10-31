-- Xom Data · The category's flagship next to each item
-- Problem: https://xomdata.com/practice/medium-firstval-001
-- Solved: 2026-10-31


    select category,
        product_name,
        price,
        FIRST_VALUE(product_name) over(partition by category order by price desc, product_name) as top_product
    from catalog
    order by category, price desc, product_name
