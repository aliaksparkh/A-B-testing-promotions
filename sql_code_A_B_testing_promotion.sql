WITH aggreg_data AS ( --aggregated data by promotion and location
  SELECT
    promotion,
    location_id,
    ROUND(SUM(sales_in_thousands),3) AS total_sales,--sales for 4 weeks in 1 location
    ROUND(AVG(sales_in_thousands),3) AS avg_sales -- average weekly sales in each location
  FROM `turing_data_analytics.wa_marketing_campaign`
  GROUP BY promotion, location_id
  ORDER BY promotion, location_id
)
SELECT
  promotion,
  COUNT(promotion) AS number_of_obs,
  ROUND(AVG(total_sales),3) AS mean_total_sales,
  ROUND(STDDEV(total_sales),3) AS stddev_total_sales,
  ROUND(AVG(avg_sales),3) AS mean_avg_sales,
  ROUND(STDDEV(avg_sales),3) AS stddev_avg_sales,
FROM
  aggreg_data
GROUP BY
  promotion;