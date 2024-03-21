import csv
import os
import re

# Function to read the CSV file and store color names and hex values
def read_csv(csv_file):
    colors = {}
    with open(csv_file, 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            colors[row['name']] = row['hex']
    return colors

# Function to update markdown files with tags
def update_markdown_folder(folder_path, colors):
    for filename in os.listdir(folder_path):
        if filename.endswith(".md"):
            file_path = os.path.join(folder_path, filename)
            print("Processing file:", file_path)  # Debugging print
            with open(file_path, 'r') as f:
                content = f.read()

            # Extract color name from file name
            color_name = re.match(r'^([0-9A-Fa-f]+)\.md$', filename).group(1).upper()

            # Check if color name exists in CSV data
            if color_name in colors:
                hex_value = colors[color_name]
                tag_to_add = "- Color/Tag/x11"
                if tag_to_add not in content:
                    print("Adding tag to file:", file_path)  # Debugging print
                    # Add the tag to the YAML section
                    yaml_section = re.search(r'^---(.*?)---', content, re.DOTALL | re.MULTILINE)
                    if yaml_section:
                        yaml_content = yaml_section.group(1)
                        updated_yaml = yaml_content.strip() + "\n  " + tag_to_add + "\n---"
                        content = content.replace(yaml_section.group(0), updated_yaml)
                    else:
                        print("YAML section not found in file:", file_path)  # Debugging print
                else:
                    print("Tag already exists in file:", file_path)  # Debugging print

            # Write back the updated content to the file
            with open(file_path, 'w') as f:
                f.write(content)

if __name__ == "__main__":
    csv_file = "x11.csv"
    folder_path = "."  # Assuming markdown files are in the current directory

    colors = read_csv(csv_file)
    update_markdown_folder(folder_path, colors)
