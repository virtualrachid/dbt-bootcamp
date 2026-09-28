-- This test checks that the review_date in fact_reviews is always
-- greater than or equal to the created_at date in dim_listings_cleansed for the same listing_id.

-- name: test_consistent_created_at
-- description: "Test to ensure that review_date is greater than or equal to created_at for the same listing_id"
-- severity: ERROR
-- sql: |

SELECT * FROM {{ ref('dim_listings_cleansed') }} l
INNER JOIN {{ ref('fact_reviews') }} r
USING (listing_id)
WHERE l.created_at > r.review_date
