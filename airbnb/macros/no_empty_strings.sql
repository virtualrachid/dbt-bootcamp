-- This macro checks that all string columns in a given model have non-empty values.
-- Parameters:
-- model: The name of the model to query.
-- Returns: A boolean expression that can be used in a WHERE clause to filter out rows with empty string values.

{% macro no_empty_strings(model) %}
    {%- for col in adapter.get_columns_in_relation(model) -%}
        {%- if col.is_string() %}
            {{ col.name }} IS NOT NULL AND {{ col.name }} <> '' AND
        {%- endif %}
    {%- endfor %}
    TRUE
{% endmacro %}
