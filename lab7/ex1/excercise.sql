-- number of items and sum
SELECT bi."orderId", SUM(bi."quant") AS "items_count", SUM(bi."quant" * i."price") AS "sum" FROM "bucketItem" AS bi 
JOIN "item" AS i ON i."id" = bi."itemId"
GROUP BY bi."orderId";

-- the most "rich" customer
SELECT c.*, SUM(bi."quant" * i."price") FROM "customer" AS c
JOIN "order" AS o ON c."id" = o."customerId"
JOIN "bucketItem" AS bi ON c."id" = bi."orderId"
JOIN "item" AS i ON i."id" = bi."itemId"
GROUP BY c."id" ORDER BY SUM(bi."quant" * i."price") DESC LIMIT 1;
