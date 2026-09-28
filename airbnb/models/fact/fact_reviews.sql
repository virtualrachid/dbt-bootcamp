{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null

-- Incremental logic 
-- if the model is being run incrementally, only select reviews 
-- that are newer than the most recent review in the target table
{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}