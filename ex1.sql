SELECT bi."orderId", SUM(bi."quant") AS "items_count", SUM(bi."quant" * i."price") AS "sum" FROM "bucketItem" AS bi 
JOIN "item" AS i ON i."id" = bi."itemId"
GROUP BY bi."orderId";

