import duckdb
import json

# Create sample nested JSON data
sample_data = [
    {"user_id": 1, "profile": {"name": "John Doe", "active": True}},
    {"user_id": 2, "profile": {"name": "Jane Smith", "active": False}}
]

# Save to JSON file
with open('users.json', 'w') as f:
    json.dump(sample_data, f)

# Direct query with dot notation - no normalization needed
result = duckdb.sql("""
    SELECT
        user_id,
        profile.name,
        profile.active
    FROM read_json('users.json')
""").pl()

print("DuckDB result:")
print(result)