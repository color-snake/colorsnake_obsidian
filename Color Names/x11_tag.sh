import csv
import os
import yaml

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
            color_name = os.path.splitext(filename)[0].upper()

            # Check if color name exists in CSV data
            if color_name in colors:
                hex_value = colors[color_name]
                tag_to_add = "- Color/Tag/x11"
                if tag_to_add not in content:
                    print("Adding tag to file:", file_path)  # Debugging print
                    # Load YAML front matter
                    yaml_end = content.find('---', 4)
                    yaml_front_matter = content[4:yaml_end].strip()
                    data = yaml.safe_load(yaml_front_matter)
                    if 'tags' in data:
                        data['tags'].append(tag_to_add)
                    else:
                        data['tags'] = [tag_to_add]

                    # Update content with modified YAML front matter
                    updated_content = '---\n' + yaml.dump(data, default_flow_style=False) + '---\n' + content[yaml_end+3:]

                    # Write back the updated content to the file
                    with open(file_path, 'w') as f:
                        f.write(updated_content)

if __name__ == "__main__":
    csv_file = "x11.csv"
    folder_path = "."  # Assuming markdown files are in the current directory

    colors = read_csv(csv_file)
    update_markdown_folder(folder_path, colors)
