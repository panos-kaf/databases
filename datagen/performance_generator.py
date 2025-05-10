import random
from datetime import datetime, timedelta

# Configuration
events = range(1, 181)  # event_id from 1 to 179
performances_per_event = 5

# Output SQL
sql_lines = ["INSERT INTO `performance` (`time`, `duration`, `break`, `performance_type_id`, `event_id`) VALUES"]
values = []

# Helper: format time for SQL
def format_sql_time(dt):
    return f"'{dt.strftime('%H:%M:%S')}'"

# Helper: generate a random start time on the hour or half-hour between 10:00 and 15:00
def random_half_hour_start():
    hour = random.randint(10, 14)  # last full hour before 15:30
    minute = random.choice([0, 30])
    return datetime.strptime(f"{hour:02d}:{minute:02d}:00", "%H:%M:%S")

# Generate performances
for event_id in events:
    current_time = random_half_hour_start()

    for _ in range(performances_per_event):
        duration = random.randint(20, 180)
        break_duration = 5 * random.randint(1, 6)
        performance_type_id = random.randint(1, 4)

        time_str = format_sql_time(current_time)
        values.append(f"({time_str}, {duration}, {break_duration}, {performance_type_id}, {event_id})")

        # Move to next performance time
        current_time += timedelta(minutes=duration + break_duration)

# Write SQL to file
sql_lines.append(",\n".join(values) + ";")
with open("performances", "w") as f:
    f.write("\n".join(sql_lines))
