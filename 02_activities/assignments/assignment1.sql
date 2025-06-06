/* ASSIGNMENT 1 */
/* SECTION 2 */


--SELECT
/* 1. Write a query that returns everything in the customer table. */
SELECT *
FROM customer;


/* 2. Write a query that displays all of the columns and 10 rows from the cus- tomer table, 
sorted by customer_last_name, then customer_first_ name. */
SELECT *
FROM customer
LIMIT 10
ORDER BY customer_last_name,customer_first_name;


--WHERE
/* 1. Write a query that returns all customer purchases of product IDs 4 and 9. */
-- option 1
SELECT *
FROM customer_purchases
WHERE product_id=4
AND product_id=9;

-- option 2
SELECT *
FROM customer_purchases
WHERE product_id>=3
AND product_id<=10;


/*2. Write a query that returns all customer purchases and a new calculated column 'price' (quantity * cost_to_customer_per_qty), 
filtered by vendor IDs between 8 and 10 (inclusive) using either:
	1.  two conditions using AND
	2.  one condition using BETWEEN
*/
-- option 1
SELECT cp.*quantitycost_to_customer_per_qty
AS price
FROM customer_purchases cp
WHERE vendor_id>=8 
AND vendor_id<=10;

-- option 2
SELECT cp.*quantitycost_to_customer_per_qty
AS price
FROM customer_purchases cp
BETWEEN vendor_id>=8 
AND vendor_id<=10;


--CASE
/* 1. Products can be sold by the individual unit or by bulk measures like lbs. or oz. 
Using the product table, write a query that outputs the product_id and product_name
columns and add a column called prod_qty_type_condensed that displays the word “unit” 
if the product_qty_type is “unit,” and otherwise displays the word “bulk.” */
SELECT *
FROM product_id,product_name
CASE
WHEN (product_id OR product_name = 'unit' or 'bulk')
THEN(
	AS prod_qty_type);


/* 2. We want to flag all of the different types of pepper products that are sold at the market. 
add a column to the previous query called pepper_flag that outputs a 1 if the product_name 
contains the word “pepper” (regardless of capitalization), and otherwise outputs 0. */
SELECT *
FROM product_id,product_name
CASE
WHEN (product_id OR product_name = 'unit' or 'bulk')
THEN (
	AS prod_qty_type)
WHEN (product_name = 'pepper')
THEN (=1
	AS pepper_flag)
ELSE (=0);


--JOIN
/* 1. Write a query that INNER JOINs the vendor table to the vendor_booth_assignments table on the 
vendor_id field they both have in common, and sorts the result by vendor_name, then market_date. */
SELECT vendor, vendor_booth_assignments
FROM vendor_id
INNER JOIN vendor_booth_assignments 
ON vendor_id=vendor_id
ORDER BY vendor_name,market_date;



/* SECTION 3 */

-- AGGREGATE
/* 1. Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id. */
SELECT vendor, vendor_booth_assignments
sum (vedor*vendor_booth_assignments) as total_rent
GROUP BY vendor_id



/* 2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper 
sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list 
of customers for them to give stickers to, sorted by last name, then first name. 

HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword. */
SELECT c.customer_id, c.customer_first_name, c.customer_last_name, 
sum(cp.quantity*cp.cost_to_customer_per_qty) as total_spent
FROM customer c
INNER JOIN customer_purchases cp on c.customer_id=cp.customer_id
GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name
ORDER BY c.customer_last_name,c.customer_first_name;


--Temp Table
/* 1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: 
Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal

HINT: This is two total queries -- first create the table from the original, then insert the new 10th vendor. 
When inserting the new vendor, you need to appropriately align the columns to be inserted 
(there are five columns to be inserted, I've given you the details, but not the syntax) 

-> To insert the new row use VALUES, specifying the value you want for each column:
VALUES(col1,col2,col3,col4,col5) 
*/
CREATE TABLE temp.new_new_vendor_inventory AS
select * as vendor

from temp.new_vendor_inventory;

INSERT INTO temp.new_vendor (col1,col2,col3,col4,col5)
VALUES (id, Thomass Superfood Store, Fresh Focused Store, Thomas, Rosenthal)

-- Date
/*1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.

HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month 
and year are! */



/* 2. Using the previous query as a base, determine how much money each customer spent in April 2022. 
Remember that money spent is quantity*cost_to_customer_per_qty. 

HINTS: you will need to AGGREGATE, GROUP BY, and filter...
but remember, STRFTIME returns a STRING for your WHERE statement!! */

