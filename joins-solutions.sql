-- 1 Get customers & addresses
SELECT * FROM customers
JOIN addresses ON
addresses.customer_id = customers.id;

-- 2 Get orders and line items
SELECT * FROM orders
JOIN line_items ON
line_items.order_id = orders.id;

-- 3 Where the cheetos at?!?
SELECT * FROM warehouse
JOIN warehouse_product ON
warehouse_product.warehouse_id = warehouse.id
JOIN products ON
warehouse_product.product_id = products.id
WHERE products.description = 'cheetos';

-- 4 Where the diet pepsi at?!?
SELECT * FROM warehouse
JOIN warehouse_product ON
warehouse_product.warehouse_id = warehouse.id
JOIN products ON
warehouse_product.product_id = products.id
WHERE products.description ILIKE 'diet%';

-- 5 Number of orders for each customer
SELECT customers.*, count(orders) FROM addresses
JOIN customers ON
customers.id = addresses.customer_id
JOIN orders ON
addresses.id = orders.address_id
GROUP BY customers.id;

-- 6 How many customers
 SELECT COUNT(*) FROM customers;

 -- 7 How many products
  SELECT COUNT(*) FROM products;

  -- 8 How much Diet Pepsi on-hand?
  SELECT products.description, SUM(warehouse_product.on_hand) as "Total DP on-hand" FROM products
JOIN warehouse_product ON
warehouse_product.product_id = products.id
WHERE products.description ILIKE 'diet%'
GROUP BY products.description;
