WITH raw_reviews AS (
    SELECT 
        * 
    FROM 
        {{ source('airbnb', 'reviews') }}
)
SELECT
    listing_id, 
    DATE AS review_date, 
    REVIEWER_NAME, 
    COMMENTS AS review_text, 
    SENTIMENT AS review_sentiment
FROM raw_reviews