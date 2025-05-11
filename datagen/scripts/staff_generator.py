import random
from datetime import datetime, timedelta

# Lists of more diverse and varied names
first_names = [
    "Avery", "Jordan", "Morgan", "Casey", "Riley", "Dakota", "Emerson", "Skyler", "Reese", "Alex",
    "Taylor", "Jamie", "Peyton", "Quinn", "Rowan", "Sage", "Tatum", "Blake", "Cameron", "Elliot",
    "Harper", "Kai", "Lennon", "Micah", "Phoenix", "Remy", "Sawyer", "Spencer", "Winter", "Zion",
    "Finley", "Ari", "Luca", "Sasha", "Hayden", "Kendall", "Logan", "Marley", "Nico", "River",
    "Robin", "Sam", "Toby", "Wren", "Ash", "Beau", "Charlie", "Drew", "Ellis", "Frankie"
]

last_names = [
    "Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez",
    "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson", "Thomas", "Taylor",
    "Moore", "Jackson", "Martin", "Lee", "Perez", "Thompson", "White", "Harris", "Sanchez",
    "Clark", "Ramirez", "Lewis", "Robinson", "Walker", "Young", "Allen", "King", "Wright",
    "Scott", "Torres", "Nguyen", "Hill", "Flores", "Green", "Adams", "Nelson", "Baker",
    "Hall", "Rivera", "Campbell", "Mitchell", "Carter", "Roberts"
]

# Generate random dates between 1965 and 2005
def random_birthdate(start_year=1965, end_year=2005):
    start_date = datetime(start_year, 1, 1)
    end_date = datetime(end_year, 12, 31)
    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    return (start_date + timedelta(days=random_days)).strftime("%Y-%m-%d")

# Generate 500 tuples
entries = []
for _ in range(500):
    fname = random.choice(first_names)
    lname = random.choice(last_names)
    birthdate = random_birthdate()
    experience = random.randint(1, 5)
    role = random.randint(1, 4)
    entries.append(f"('{fname}', '{lname}', '{birthdate}', {experience}, {role})")


for entry in entries:
	print(entry)
