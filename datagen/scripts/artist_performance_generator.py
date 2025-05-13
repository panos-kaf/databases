import random

sql_lines = ["INSERT INTO `artist_performance` (`artist_id`, `performance_id`) VALUES"]
artists = range(1, 201)
rows = []

# Divide performances into 10 blocks of 90
performance_blocks = [list(range(i, i + 90)) for i in range(1, 901, 90)]

for i, artist_id in enumerate(artists):
    # Alternate: even-indexed artists use even blocks, odd-indexed artists use odd blocks
    block_indices = range(0, 10, 2) if i % 2 == 0 else range(1, 10, 2)

    for block_index in block_indices:
        block = performance_blocks[block_index]
        performances = random.sample(block, 3)  # 3 performances per participating block
        for performance_id in performances:
            rows.append(f"({artist_id}, {performance_id})")

sql_lines.append(",\n".join(rows) + ";")

with open("artist_performance.sql", "w") as f:
    f.write("\n".join(sql_lines))

print("Generated artist_performance.sql with artists alternating block participation.")