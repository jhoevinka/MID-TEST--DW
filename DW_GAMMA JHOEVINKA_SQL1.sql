WITH ItemCounts AS (
    SELECT item, COUNT(*) AS count
    FROM buyer_item
    GROUP BY item
), MaxMinCounts AS (
    SELECT MAX(count) AS max_count, MIN(count) AS min_count
    FROM ItemCounts
)
SELECT item
FROM ItemCounts, MaxMinCounts
WHERE count != max_count AND count != min_count;