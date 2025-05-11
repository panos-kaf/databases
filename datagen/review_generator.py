import random

# Configuration
performances = range(1, 900)  # Festival IDs from 1 to 10
reviews_per_performance = 5

# Output SQL
sql_lines = ["INSERT INTO `event` (`score`, `criteria_id`, `visitor_id`, `performance_id`) VALUES"]

values = []
for performance_id in performances:
    for _ in range(reviews_per_performance):
        for criteria in range(1, 6):
            if random.random() < 0.5:
                score = random.randint(1, 5)
                values.append(f"({score}, '{criteria}', {visitor_id}, {performance_id})")

# Join all values with commas and add semicolon at end
sql_lines.append(",\n".join(values) + ";")

# Write to file
with open("events", "w") as f:
    f.write("\n".join(sql_lines))
