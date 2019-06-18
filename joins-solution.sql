--Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";
--Get all orders and their line items (orders, quantity and product).
SELECT "orders"."id", "orders"."order_date", "line_items"."quantity", "products"."description" FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "products"."id" = "line_items"."product_id";

--Which warehouses have cheetos?
SELECT "warehouse"."warehouse", "products"."description" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos' AND "warehouse_product"."on_hand" <> 0;

--Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse", "products"."description" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi' AND "warehouse_product"."on_hand" <> 0;

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."id", "customers"."first_name", "customers"."last_name", COUNT("orders"."id") FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
GROUP BY "customers"."id";

--How many customers do we have?
SELECT COUNT("id") FROM "customers";

--How many products do we carry?
SELECT COUNT("id") FROM "products";

--What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") FROM "products"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';