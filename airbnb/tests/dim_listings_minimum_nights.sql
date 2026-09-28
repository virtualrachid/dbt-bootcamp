-- name: test_minimum_nights
-- description: "Test to ensure that minimum_nights is greater than or equal to 1"
-- severity: ERROR
-- sql: |

SELECT
    *
FROM
    {{ ref('dim_listings_cleansed') }}
WHERE minimum_nights < 1
LIMIT 10