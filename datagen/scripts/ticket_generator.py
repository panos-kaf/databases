import random
import csv
from datetime import datetime, timedelta

# Configuration
events = range(1, 181)  # event_id from 1 to 180
tickets_per_event = 500

# Output SQL
sql_lines = ["INSERT INTO `ticket` (`cost`, `used`, `purchase_type_id`, `ticket_type_id`, `purchase_date`, `visitor_id`, `event_id`, `for_sale`, `ean-13`) VALUES"]
values = []

# Output CSV
csv_rows = []
csv_header = ['cost', 'used', 'purchase_type_id', 'ticket_type_id', 'purchase_date', 'visitor_id', 'event_id', 'for_sale', 'ean-13']

# Helper to generate random purchase date in past 2 years
def random_date():
    start = datetime.now() - timedelta(days=730)
    end = datetime.now()
    rand_date = start + timedelta(days=random.randint(0, 730))
    return rand_date.strftime('%Y-%m-%d')

# Helper to generate random EAN-13 barcode (13 digits, valid prefix)
def random_ean13():
    first_digit = str(random.randint(1, 9))
    other_digits = ''.join(str(random.randint(0, 9)) for _ in range(12))
    return first_digit + other_digits

# Generate tickets
for event_id in events:
    vip_count = 0

    cost = random.randint(10, 20) * 0.5
    
    for _ in range(tickets_per_event):
        ticket_type_id = 1
        vipcost = None

        # Choose ticket type
        if vip_count < 50: 
            ticket_type_id = 2
            vip_count += 1
            vipcost = 2 * cost  # VIP is double
        else:
            ticket_type_id = random.choice([1, 3])  # Non-VIP

        # Usage and for_sale logic
        used = random.randint(0, 1)
        if used == 1:
            for_sale = 0

        # Determine NULLs or values
        if used == 0:
            if random.random() < 0.25:
                purchase_type_id = None
                visitor_id = None
                purchase_date = None
                for_sale = 0
            else:
                purchase_type_id = random.randint(1, 3)
                visitor_id = random.randint(tickets_per_event * (event_id-1), tickets_per_event * event_id)
                purchase_date = random_date()
                for_sale = 1 if random.random() < 0.25 else 0
        else:
            purchase_type_id = random.randint(1, 3)
            visitor_id = random.randint(tickets_per_event * (event_id-1), tickets_per_event * event_id)
            purchase_date = random_date()

        ean = random_ean13()

        final_cost = vipcost if ticket_type_id == 2 else cost

        # Append to SQL
        sql_values = (
            final_cost,
            used,
            "NULL" if purchase_type_id is None else purchase_type_id,
            ticket_type_id,
            "NULL" if purchase_date is None else f"'{purchase_date}'",
            "NULL" if visitor_id is None else visitor_id,
            event_id,
            for_sale,
            f"'{ean}'"
        )
        values.append(f"({', '.join(map(str, sql_values))})")

        # Append to CSV (explicitly replace None with "NULL")
        csv_rows.append([
            final_cost if final_cost is not None else "NULL",
            used,
            purchase_type_id if purchase_type_id is not None else "NULL",
            ticket_type_id,
            purchase_date if purchase_date is not None else "NULL",
            visitor_id if visitor_id is not None else "NULL",
            event_id,
            for_sale,
            ean
        ])

# Write SQL
sql_lines.append(",\n".join(values) + ";")
with open("ticket.sql", "w") as f_sql:
    f_sql.write("\n".join(sql_lines))

# Write CSV
with open("ticket.csv", "w", newline='') as f_csv:
    writer = csv.writer(f_csv)
    writer.writerow(csv_header)
    writer.writerows(csv_rows)