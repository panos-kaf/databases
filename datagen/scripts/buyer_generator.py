import random

# Input/output files
ticket_file = "forsaletickets"
output_file = "buyer.sql"

# Parameters
total_visitors = 90000
total_events = 180
total_ticket_types = 3

# Load ticket IDs from file
with open(ticket_file, 'r') as f:
    ticket_ids = [line.strip() for line in f if line.strip().isdigit()]

values = []

for ticket_id in ticket_ids:
    if random.random() < 0.1:  # 10% of the tickets
        visitor_id = random.randint(1, total_visitors)

        if random.random() < 0.5:
            # Use specific_ticket, others are NULL
            values.append(f"({visitor_id}, NULL, NULL, {ticket_id})")
        else:
            # Use event_id and ticket_type_id, specific_ticket is NULL
            event_id = random.randint(1, total_events)
            ticket_type_id = random.randint(1, total_ticket_types)
            values.append(f"({visitor_id}, {event_id}, {ticket_type_id}, NULL)")

# Write to SQL file
with open(output_file, 'w') as f:
    if values:
        f.write("INSERT INTO buyer (visitor_id, event_id, ticket_type_id, specific_ticket) VALUES\n")
        f.write(",\n".join(values))
        f.write(";\n")
    else:
        f.write("-- No buyers generated.\n")

print(f"Generated {len(values)} buyer entries in {output_file}")