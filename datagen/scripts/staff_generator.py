import random
from faker import Faker

fake = Faker()

entries = []

for building_id in range(1, 31):

    for _ in range(10):
        fname = fake.first_name().replace("'", "''")
        lname = fake.last_name().replace("'", "''")
        birthdate = fake.date_of_birth(minimum_age=18, maximum_age=65).strftime('%Y-%m-%d')
        experience = random.randint(1, 5)
        role = 4  # guides
        entries.append(f"('{fname}', '{lname}', '{birthdate}', {experience}, {role}, {building_id})")

    for _ in range(25):
        fname = fake.first_name().replace("'", "''")
        lname = fake.last_name().replace("'", "''")
        birthdate = fake.date_of_birth(minimum_age=18, maximum_age=65).strftime('%Y-%m-%d')
        experience = random.randint(1, 5)
        role = 1  # security
        entries.append(f"('{fname}', '{lname}', '{birthdate}', {experience}, {role}, {building_id})")

    for _ in range(50):
        fname = fake.first_name().replace("'", "''")
        lname = fake.last_name().replace("'", "''")
        birthdate = fake.date_of_birth(minimum_age=18, maximum_age=65).strftime('%Y-%m-%d')
        experience = random.randint(1, 5)
        role = random.randint(1, 4)
        # Note: No building_id for these entries, so we use NULL
        entries.append(f"('{fname}', '{lname}', '{birthdate}', {experience}, {role}, {building_id})")

# Compose full INSERT statement
sql = (
    "INSERT INTO staff (first_name, last_name, birthdate, experience, role_id, building_id)\nVALUES\n"
    + ",\n".join(entries) + ";"
)

# Write to file
with open('staff.sql', "w", encoding="utf-8") as f:
    f.write(sql)