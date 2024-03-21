import csv
import os

# Function to read colors from CSV file
def read_colors_from_csv(csv_file):
    colors = set()
    with open(csv_file, 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row
        for row in reader:
            colors.add(row[0].lower())
    return colors

# Function to update tags in Markdown files
def update_tags_in_markdown_files(directory, csv_file):
    x11_colors = read_colors_from_csv(csv_file)
    tag_to_add = "- Color/Tag/x11"
    
    for file_name in os.listdir(directory):
        if file_name.endswith('.md'):
            markdown_file = os.path.join(directory, file_name)
            with open(markdown_file, 'r') as file:
                lines = file.readlines()

            existing_tags = set()
            tags_updated = False
            for line in lines:
                if line.strip().startswith("- Color/Tag/"):
                    existing_tags.add(line.strip())
                if tag_to_add in line:
                    tags_updated = True

            hex_value = file_name.split('.')[0].lower()
            if hex_value in x11_colors and tag_to_add not in existing_tags and not tags_updated:
                existing_tags.add(tag_to_add)

            with open(markdown_file, 'w') as file:
                for line in lines:
                    file.write(line)
                if not tags_updated:
                    file.write(f"  {tag_to_add}\n")

if __name__ == "__main__":
    directory = "."  # Change this to the directory where your Markdown files are located
    csv_file = "x11.csv"  # Path to x11.csv file
    update_tags_in_markdown_files(directory, csv_file)
