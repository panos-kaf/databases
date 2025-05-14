import csv
import re

# Input and output file names
input_file = 'ticket.sql'
output_file = 'ticket.csv'

# Read SQL content from file
with open(input_file, 'r') as f:
    sql_data = f.read()

# Extract column names
columns_match = re.search(r'INSERT INTO `\w+` \((.*?)\) VALUES', sql_data, re.DOTALL)
columns = [col.strip(' `') for col in columns_match.group(1).split(',')]

# Extract values
values = re.findall(r'$begin:math:text$(.*?)$end:math:text$', sql_data)
rows = []
for value in values:
    fields = []
    # Split by comma not inside quotes
    for field in re.split(r",(?=(?:[^']*'[^']*')*[^']*$)", value):
        field = field.strip()
        if field.upper() == 'NULL':
            fields.append('')
        elif field.startswith("'") and field.endswith("'"):
            fields.append(field[1:-1])
        else:
            fields.append(field)
    rows.append(fields)

# Write to CSV
with open(output_file, 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(columns)
    writer.writerows(rows)

print(f"CSV conversion complete. File saved as '{output_file}'.")