-- custom generic test to check for positive values in a column

-- name: positive_values
-- description: "Test to ensure that a column has only positive values"
-- severity: ERROR
-- sql: |
{% test positive_values(model, column_name) %}
SELECT * FROM {{ model }} WHERE {{ column_name }} <= 0
{% endtest %}