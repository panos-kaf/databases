import random

artist_ids = list(range(1, 201))
random.shuffle(artist_ids)

band_ids = list(range(1, 21))
band_members = []
assigned_artists = set()
artist_index = 0

for band_id in band_ids:
    band_size = random.randint(2, 5)

    # Ensure we don't run out of artists
    remaining = len(artist_ids) - artist_index
    if remaining < band_size:
        band_size = remaining

    # Assign artists to this band
    members = artist_ids[artist_index:artist_index + band_size]
    for artist_id in members:
        band_members.append((band_id, artist_id))
        assigned_artists.add(artist_id)

    artist_index += band_size

# Optional: Some artists stay unassigned (no band)

# Sort by band_id
band_members.sort()

# Prepare SQL
sql_lines = ["INSERT INTO `band_artist` (`band_id`, `artist_id`) VALUES"]
sql_lines += [f"({band_id}, {artist_id})" for band_id, artist_id in band_members]

sql_output = ",\n".join(sql_lines) + ";"

# Write to file
with open("band_artist.sql", "w") as f:
    f.write(sql_output)

print("Generated band_artist.sql with bands of random size 2–5, sorted by band_id.")