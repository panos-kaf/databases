import random

# Configuration
festivals = range(1, 11)  # Festival IDs from 1 to 10
events_per_festival = 15

# Output SQL
sql_lines = ["INSERT INTO `event` (`building_id`, `image_url`, `festival_id`) VALUES"]

values = []
for festival_id in festivals:
    for _ in range(events_per_festival):
        building_id = random.randint(1, 30)
        image_url = random_image_url()
        values.append(f"({building_id}, '{image_url}', {festival_id})")

# Join all values with commas and add semicolon at end
sql_lines.append(",\n".join(values) + ";")

# Write to file
with open("events", "w") as f:
    f.write("\n".join(sql_lines))
