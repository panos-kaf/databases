import random

sql_lines = ["INSERT INTO `artist_performance` (`artist_id`, `performance_id`) VALUES"]
artists = range(1, 201)
performances = list(range(1, 901))  # make a list for sampling

rows = []

for artist_id in artists:
    unique_performances = random.sample(performances, 15)  # get 3 unique performances
    for performance_id in unique_performances:
        rows.append(f"({artist_id}, {performance_id})")

# Join all rows with ",\n" and append to SQL statement
sql_lines.append(",\n".join(rows) + ";")

with open("artist_performance.sql", "w") as f:
    f.write("\n".join(sql_lines))