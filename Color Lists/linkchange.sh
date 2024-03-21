import os

# Function to update markdown files with image links
def update_markdown_files(folder_path):
    for filename in os.listdir(folder_path):
        if filename.endswith('.md'):
            # Extract hex value from markdown filename
            hex_value = filename.split('.')[0]
            img_link = f"https://filedn.com/l0hpzxl1f01yT7GHxtF8cyk/Color%20Snake/SVG_Tumb%20Mass%20No%20Name/{hex_value}.svg"
            with open(os.path.join(folder_path, filename), 'r+') as file:
                content = file.readlines()

                img_property_found = False
                new_content = []

                for line in content:
                    if 'Hex:' in line and not img_property_found:
                        new_content.append(line)
                        new_content.append(f'img: {img_link}\n')
                        img_property_found = True
                    elif 'img:' in line.lower():
                        continue  # Skip existing img: property
                    else:
                        new_content.append(line)

                file.seek(0)
                file.writelines(new_content)
                file.truncate()

# Main function
def main():
    folder_path = 'Color_Names'
    update_markdown_files(folder_path)
    print("Markdown files updated successfully!")

if __name__ == "__main__":
    main()
