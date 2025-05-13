from collections import defaultdict
import random

def parse_visitor_events(filename):
    visitor_events = defaultdict(list)

    with open(filename, 'r') as file:
        for line in file:
            # Skip empty lines
            if not line.strip():
                continue

            try:
                # Split by '|', strip whitespace
                parts = line.strip().split('|')
                visitor_id = int(parts[0].strip())
                event_id = int(parts[1].strip())
                visitor_events[visitor_id].append(event_id)
            except (IndexError, ValueError) as e:
                print(f"Skipping line due to error: {line.strip()} - {e}")

    return visitor_events

input = "../data/reviewtable"
to_review = parse_visitor_events(input)

sql_lines = ["INSERT INTO `review` (`score`, `criteria_id`, `visitor_id`, `performance_id`) VALUES"]
values = []

for visitor_id, event_ids in to_review.items():
    for event_id in event_ids:

        for performance_id in range(5 * (event_id - 1) + 1, (5 * (event_id - 1) + 6)):

            if random.random() < 0.75:
                for criteria_id in range(1, 6):
                    if random.random() < 0.75:
                        score = random.randint(1, 5)
                        values.append(f"({score}, {criteria_id}, {visitor_id}, {performance_id})")

sql_lines.append(",\n".join(values) + ";")
with open("more_reviews.sql", "w") as f:
    f.write("\n".join(sql_lines))