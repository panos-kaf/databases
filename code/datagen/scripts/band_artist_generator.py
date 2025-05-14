import random

TOTAL_ARTISTS = 200
band_ids = list(range(1, 21))
band_members = []

artist_id = 1  # start from artist 1

# Generate bands
for band_id in band_ids:
    band_size = random.randint(2, 5)

    # Avoid exceeding total number of artists
    if artist_id + band_size - 1 > TOTAL_ARTISTS:
        band_size = TOTAL_ARTISTS - artist_id + 1

    members = list(range(artist_id, artist_id + band_size))
    for aid in members:
        band_members.append((band_id, aid))

    artist_id += band_size

    if artist_id > TOTAL_ARTISTS:
        break

# Remaining artists (not assigned to any band)
solo_artist_ids = list(range(artist_id, TOTAL_ARTISTS + 1))

# Prepare band SQL
band_sql_lines = ["INSERT INTO `band_artist` (`band_id`, `artist_id`) VALUES"]
band_sql_lines += [f"({band_id}, {artist_id})" for band_id, artist_id in band_members]
band_sql_output = ",\n".join(band_sql_lines) + ";"

# Prepare solo artist SQL (optional, depends on your schema)
# For example, you might store them in a separate table or leave them out

# Write to file
with open("band_artist.sql", "w") as f:
    f.write(band_sql_output)

print(f"Generated band_artist.sql with {len(band_members)} band memberships.")
print(f"{len(solo_artist_ids)} artists remain as solo artists (not in any band).")