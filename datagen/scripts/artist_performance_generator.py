import random

sql_lines = ["INSERT INTO `artist_performance` (`artist_id`, `performance_id`) VALUES"]
artists = range(1, 201)
rows = []

# Divide performances into 10 blocks of 90
festivals = [list(range(i, i + 90)) for i in range(1, 901, 90)]

for i, artist_id in enumerate(artists):
    groupings = range(0, 10, 2) if i % 20 < 10 else range(1, 10, 2)

    for grouping in groupings:
        festival = festivals[grouping]
        num_performances = random.randint(2, 15)
        performances = random.sample(festival, num_performances)
        for performance_id in performances:
            rows.append(f"({artist_id}, {performance_id})")

sql_lines.append(",\n".join(f"  {row}" for row in rows) + ";")

# Write to file
with open("artist_performance.sql", "w") as f:
    f.write("\n".join(sql_lines))