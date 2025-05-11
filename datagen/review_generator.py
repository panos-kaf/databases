import random

# Constants
events = range(1, 181)  # 180 events
performances_per_event = 5
visitors_per_event = 500
total_performances = 900  # 180 * 5

# Output SQL
sql_lines = ["INSERT INTO `review` (`score`, `criteria_id`, `visitor_id`, `performance_id`) VALUES"]
values = []

# For each performance
for performance_id in range(1, total_performances + 1):
    # Determine the event this performance belongs to
    event_index = (performance_id - 1) // performances_per_event

    # Visitor IDs for that event
    start_visitor_id = event_index * visitors_per_event + 1
    end_visitor_id = start_visitor_id + visitors_per_event

    # Randomly have some of those visitors review the performance
    for visitor_id in range(start_visitor_id, end_visitor_id):
        if random.random() < 0.2:  # 20% chance to leave reviews
            for criteria_id in range(1, 6):  # 5 criteria
                if random.random() < 0.5:  # 50% chance per criteria
                    score = random.randint(1, 5)
                    values.append(f"({score}, {criteria_id}, {visitor_id}, {performance_id})")

# Save to file
sql_lines.append(",\n".join(values) + ";")
with open("review.sql", "w") as f:
    f.write("\n".join(sql_lines))