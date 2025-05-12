import random
from faker import Faker

fake = Faker()

def generate_artist_entry():
    name = fake.name()
    stage_name = fake.user_name()
    birthdate = fake.date_of_birth(minimum_age=18, maximum_age=80).isoformat()
    site = fake.url()
    instagram = f"https://instagram.com/{stage_name}"
    image_url = fake.image_url(width=random.randint(100, 1024), height=random.randint(100, 1024))
    return f"('{name}', '{stage_name}', '{birthdate}', '{site}', '{instagram}', '{image_url}')"

# Generate 200 entries
artists = [generate_artist_entry() for _ in range(200)]

# Combine into a SQL INSERT statement
insert_statement = (
    "INSERT INTO `artist` "
    "(`name`, `stage_name`, `birthdate`, `site`, `instagram_profile`, `image_url`) VALUES\n"
    + ",\n".join(artists) + ";"
)

with open("artist.sql", "w") as f:
    f.write("\n".join(insert_statement.splitlines()))