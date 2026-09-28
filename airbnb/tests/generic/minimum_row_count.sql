-- custom generic test to check for minimum row count in a model

-- name: minimum_row_count
-- description: "Test to ensure that a model has at least a minimum number of rows"
-- severity: WARNING
-- sql: |
{% test minimum_row_count(model, min_row_count) %}
{{ config( severity='warn') }}

SELECT 
    COUNT(*) AS cnt
FROM 
    {{ model }}
HAVING 
    COUNT(*) < {{ min_row_count }}
    
{% endtest %}