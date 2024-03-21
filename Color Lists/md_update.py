import re

# Read the markdown file
with open("HTML.md", "r") as f:
    markdown_content = f.read()

# Define the pattern for palette code blocks
pattern = r'```palette\n#([0-9a-fA-F]{6})\n```'

# Find all palette code blocks and their hex codes
palette_blocks = re.finditer(pattern, markdown_content)

# Keep track of the replacements
replacements = []

# Iterate over each palette code block and its hex code
for match in palette_blocks:
    hex_code = match.group(1)
    replacement = f"- [[{hex_code}]]\n"
    replacements.append((match.start(), match.end(), replacement))

# Apply the replacements in reverse order to avoid shifting indices
for start, end, replacement in reversed(replacements):
    markdown_content = markdown_content[:end] + replacement + markdown_content[end:]

# Write the updated markdown content back to the file
with open("your_updated_markdown_file.md", "w") as f:
    f.write(markdown_content)
