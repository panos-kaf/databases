import random
import csv
from datetime import datetime, timedelta

# Configuration
total_visitors = 89000
events = list(range(1, 181))
tickets_per_event = total_visitors // len(events)  # 500 per event

extra_ticket_count = 1000
extra_visitor_count = 50
extra_visitors = random.sample(range(1, total_visitors + 1), extra_visitor_count)

# Output holders
csv_rows = []
csv_header = ['cost', 'used', 'purchase_type_id', 'ticket_type_id', 'purchase_date', 'visitor_id', 'event_id', 'for_sale', 'ean-13']
sql_lines = ["INSERT INTO `ticket` (`cost`, `used`, `purchase_type_id`, `ticket_type_id`, `purchase_date`, `visitor_id`, `event_id`, `for_sale`, `ean-13`) VALUES"]
values = []

# Helper functions
def random_date():
    start = datetime.now() - timedelta(days=730)
    rand_date = start + timedelta(days=random.randint(0, 730))
    return rand_date.strftime('%Y-%m-%d')

def random_ean13():
    first_digit = str(random.randint(1, 9))
    other_digits = ''.join(str(random.randint(0, 9)) for _ in range(12))
    return first_digit + other_digits

def generate_ticket(visitor_id, event_id, used_pairs):
    if (visitor_id, event_id) in used_pairs:
        return None  # Skip duplicates

    used_pairs.add((visitor_id, event_id))

    cost = random.randint(10, 20) * 0.5
    ticket_type_id = random.choices([1, 2, 3], weights=[0.45, 0.1, 0.45])[0]
    final_cost = 2 * cost if ticket_type_id == 2 else cost

    used = random.randint(0, 1)
    for_sale = 0 if used else (1 if random.random() < 0.25 else 0)
    purchase_type_id = random.randint(1, 3)
    purchase_date = random_date()
    ean = random_ean13()

    # SQL
    sql_values = (
        final_cost,
        used,
        purchase_type_id,
        ticket_type_id,
        f"'{purchase_date}'",
        visitor_id,
        event_id,
        for_sale,
        f"'{ean}'"
    )
    values.append(f"({', '.join(map(str, sql_values))})")

    # CSV
    csv_rows.append([
        final_cost,
        used,
        purchase_type_id,
        ticket_type_id,
        purchase_date,
        visitor_id,
        event_id,
        for_sale,
        ean
    ])
    return True

# ----------------------
# Step 1: Generate 90,000 base tickets
# ----------------------
used_pairs = set()
visitor_id_counter = 1

for event_id in events:
    for _ in range(tickets_per_event):
        generate_ticket(visitor_id_counter, event_id, used_pairs)
        visitor_id_counter += 1

# ----------------------
# Step 2: Generate 1,000 extra tickets for 50 visitors
# ----------------------
while len(csv_rows) < 91000:
    visitor_id = random.choice(extra_visitors)
    event_id = random.choice(events)
    generate_ticket(visitor_id, event_id, used_pairs)

# ----------------------
# Write SQL and CSV
# ----------------------
with open("ticket.sql", "w") as f_sql:
    f_sql.write("\n".join(sql_lines + [",\n".join(values) + ";"]))

with open("ticket.csv", "w", newline='') as f_csv:
    writer = csv.writer(f_csv)
    writer.writerow(csv_header)
    writer.writerows(csv_rows)