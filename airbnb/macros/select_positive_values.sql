-- This macro selects all rows from a given model where the specified column has positive values.
-- Parameters:
-- model: The name of the model to query.
-- column_name: The name of the column to check for positive values.

{% macro select_positive_values(model, column_name) %}
    SELECT *
    FROM {{ model }}
    WHERE {{ column_name }} > 0
{% endmacro %}
