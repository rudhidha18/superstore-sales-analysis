-- Total profit by region
SELECT region, ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_profit ASC;

-- Total profit by sub-category — found Tables losing $64k overall
SELECT sub_category, ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 10;

-- Tables profit by discount band — testing if discounting drives the loss
SELECT
  CASE
    WHEN discount = 0 THEN '0%'
    WHEN discount <= 0.1 THEN '1-10%'
    WHEN discount <= 0.2 THEN '11-20%'
    WHEN discount <= 0.3 THEN '21-30%'
    ELSE '30%+'
  END AS discount_band,
  ROUND(SUM(profit), 2) AS total_profit,
  COUNT(*) AS num_orders
FROM orders
WHERE sub_category = 'Tables'
GROUP BY discount_band
ORDER BY discount_band;


-- Tables profit by discount band — CONFIRMED: profit collapses at 30%+ discount
-- (30%+ discount = -$120,580 loss across 351 orders — this is the main driver of Tables' overall loss)
