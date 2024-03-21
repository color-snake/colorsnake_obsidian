import csv
import os

# Function to read colors from CSV file
def read_colors_from_csv(csv_file):
    colors = {}
    with open(csv_file, 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row
        for row in reader:
            name, hex_value = row
            colors[name.lower()] = hex_value.lower()
    return colors

# Function to update tags in Markdown files
def update_tags_in_markdown_files(directory, csv_files):
    for file_name in os.listdir(directory):
        if file_name.endswith('.md'):
            markdown_file = os.path.join(directory, file_name)
            with open(markdown_file, 'r') as file:
                lines = file.readlines()

            existing_tags = set()
            for line in lines:
                if line.strip().startswith("- Color/Tag/"):
                    existing_tags.add(line.strip())

            hex_value = file_name.split('.')[0].lower()
            updated_tags = []
            for csv_file in csv_files:
                colors = read_colors_from_csv(csv_file)
                if hex_value in colors:
                    updated_tags.append(f"- Color/Tag/{os.path.splitext(os.path.basename(csv_file))[0].upper()}")

            updated_tags = sorted(existing_tags.union(updated_tags))

            with open(markdown_file, 'w') as file:
                file.write("tags:\n")
                for tag in updated_tags:
                    file.write(f"  {tag}\n")

if __name__ == "__main__":
    directory = "."  # Change this to the directory where your Markdown files are located
    csv_files = ["HTML.csv", "NTC_v3.csv", "x11.csv"]  # List of CSV files
    update_tags_in_markdown_files(directory, csv_files)
