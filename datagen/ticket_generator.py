import random
from datetime import datetime, timedelta

# Configuration
events = range(1, 181)  # event_id from 1 to 180
tickets_per_event = 500

# Output SQL
sql_lines = ["INSERT INTO `ticket` (`cost`, `used`, `purchase_type_id`, `ticket_type_id`, `purchase_date`, `visitor_id`, `event_id`, `for_sale`, `ean-13`) VALUES"]
values = []

# Helper to generate random purchase date in past 2 years
def random_date():
    start = datetime.now() - timedelta(days=730)
    end = datetime.now()
    rand_date = start + timedelta(days=random.randint(0, 730))
    return f"'{rand_date.strftime('%Y-%m-%d')}'"

# Helper to generate random EAN-13 barcode (13 digits, valid prefix)
def random_ean13():
    first_digit = str(random.randint(1, 9))
    other_digits = ''.join(str(random.randint(0, 9)) for _ in range(12))
    return f"'{first_digit + other_digits}'"

# Generate tickets
for event_id in events:
    vip_count = 0

    cost = random.randint(10, 20) * 0.5
    
    for _ in range(tickets_per_event):

        # Choose ticket type
        if vip_count < 50: 
            ticket_type_id = 2
            vip_count += 1
            vipcost = 2*cost  # VIP is double
        else:
            ticket_type_id = random.choice([1, 3])  # Non-VIP

        # Usage and for_sale logic
        used = random.randint(0, 1)
        if used == 1:
            for_sale = 0
        else:
            for_sale = 0 if random.random() < 0.75 else 1

        # Determine NULLs or values
        if used == 0 and random.random() < 0.5:
            purchase_type_id = "NULL"
            visitor_id = "NULL"
            purchase_date = "NULL"
        else:
            purchase_type_id = random.randint(1, 3)
            visitor_id = random.randint(1, 200)
            purchase_date = random_date()

        ean = random_ean13()

        if ticket_type_id == 2:
            values.append(f"({vipcost}, {used}, {purchase_type_id}, {ticket_type_id}, {purchase_date}, {visitor_id}, {event_id}, {for_sale}, {ean})")
        else:
            values.append(f"({cost}, {used}, {purchase_type_id}, {ticket_type_id}, {purchase_date}, {visitor_id}, {event_id}, {for_sale}, {ean})")

# Finalize and write SQL
sql_lines.append(",\n".join(values) + ";")
with open("tickets", "w") as f:
    f.write("\n".join(sql_lines))
