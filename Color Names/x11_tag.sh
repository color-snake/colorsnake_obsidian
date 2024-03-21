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
            hex_value = file_name.split('.')[0].lower()
            if hex_value in x11_colors:
                markdown_file = os.path.join(directory, file_name)
                with open(markdown_file, 'r') as file:
                    lines = file.readlines()
                
                updated_tags = []
                for line in lines:
                    if line.strip().startswith("tags:"):
                        if tag_to_add not in line:
                            updated_tags.append(line.strip() + f", {tag_to_add}\n")
                        else:
                            updated_tags.append(line)
                    else:
                        updated_tags.append(line)
                
                with open(markdown_file, 'w') as file:
                    for line in updated_tags:
                        file.write(line)

if __name__ == "__main__":
    directory = "."  # Change this to the directory where your Markdown files are located
    csv_file = "x11.csv"  # Path to x11.csv file
    update_tags_in_markdown_files(directory, csv_file)
