import random
from faker import Faker

fake = Faker()

OUTPUT_FILE = "visitor.sql"
VISITOR_COUNT = 90000

def random_phone():
    return f"69{random.randint(10000000, 99999999)}"

sql_lines = ["INSERT INTO `visitor` (`name`, `email`, `birthdate`, `phone`) VALUES"]
values = []

for _ in range(VISITOR_COUNT):
    name = fake.name().replace("'", "''")  # Escape single quotes
    email = fake.email().replace("'", "''")
    birthdate = fake.date_of_birth(minimum_age=18, maximum_age=90).strftime('%Y-%m-%d')
    phone = random_phone()

    values.append(f"('{name}', '{email}', '{birthdate}', '{phone}')")

# Combine and write to file
sql_lines.append(",\n".join(values) + ";")
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    f.write("\n".join(sql_lines))

print(f"Generated {VISITOR_COUNT} visitors in '{OUTPUT_FILE}'")