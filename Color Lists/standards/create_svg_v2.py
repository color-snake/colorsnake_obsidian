import csv

# Function to generate SVG code for each color
def generate_svg(hex_code):
    # Prepend "#" to the hex code
    hex_code_with_hash = "#" + hex_code
    
    # Calculate circle center position
    circle_center_x = 286.027
    circle_center_y = 462.318
    
    return f'''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
    <svg width="100%" height="100%" viewBox="0 0 1920 1080" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linejoin:round;stroke-miterlimit:2;">
        <g id="_-FFFFFF--1920-" serif:id="#FFFFFF (1920)" transform="matrix(1.77778,0,0,1,0,0)">
            <g>
                <rect x="0" y="0" width="1080" height="1080" style="fill:#D2F5D6;"/>
                <g transform="matrix(1,0,0,1,236.249,-60.7246)">
                    <g transform="matrix(1.21296,0,0,2.15637,-43.1886,-456.928)">
                        <circle cx="{circle_center_x}" cy="{circle_center_y}" r="115.936" style="fill:{hex_code_with_hash};"/>
                    </g>
                    <g transform="matrix(0.5625,0,0,1,143.126,319.904)">
                        <text x="{circle_center_x}" y="{circle_center_y + 115.936 + 50}" style="font-family:'Junegull-Regular', 'Junegull', fantasy;font-size:50px;fill:rgb(48,15,49);" text-anchor="middle">{hex_code_with_hash}</text>
                    </g>
                </g>
            </g>
        </g>
    </svg>
    '''

# Read CSV file and generate SVG files
with open('NTC.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        hex_code = row['hex']
        svg_content = generate_svg(hex_code)
        with open(f'{hex_code}.svg', 'w') as svgfile:
            svgfile.write(svg_content)

print("SVG files generated successfully.")
