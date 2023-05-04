SELECT product_types.name AS product_name FROM applications
JOIN product_types ON product_types.id = applications.id_product_type
GROUP BY product_types.name HAVING
(SELECT COUNT(*) AS count_product FROM applications
JOIN product_types ON product_types.id = applications.id_product_type
WHERE YEAR(applications.date) = YEAR(NOW())
GROUP BY product_types.name ORDER BY count_product DESC LIMIT 1) =
(SELECT COUNT(*) AS count_product FROM applications
JOIN product_types ON product_types.id = applications.id_product_type
WHERE YEAR(applications.date) = YEAR(NOW()) AND product_types.name = product_name
GROUP BY product_types.name);