import re
import csv

input_file = "visitor.sql"
output_file = "visitor.csv"

# Read the whole file as a string
with open(input_file, 'r') as infile:
    sql_content = infile.read()

# Find all full INSERT INTO statements (multiline safe)
inserts = re.findall(r"INSERT\s+INTO\s+.*?\s+VALUES\s+(.*?);", sql_content, re.IGNORECASE | re.DOTALL)

rows = []
for insert in inserts:
    # Find all value tuples
    value_tuples = re.findall(r"\((.*?)\)", insert, re.DOTALL)
    for tuple_str in value_tuples:
        parts = re.split(r""",(?![^']*')""", tuple_str)
        fields = []
        for part in parts:
            part = part.strip()
            if part.upper() == "NULL":
                fields.append("\\N")
            elif part.startswith("'") and part.endswith("'"):
                fields.append(part[1:-1].replace("\\'", "'"))
            else:
                fields.append(part)
        rows.append(fields)

# Write to CSV
with open(output_file, 'w', newline='') as outfile:
    writer = csv.writer(outfile, quoting=csv.QUOTE_MINIMAL, escapechar='\\')
    writer.writerows(rows)

print(f"Wrote {len(rows)} rows to {output_file}")