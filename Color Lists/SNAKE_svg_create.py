import csv

def generate_svg(color_name, hex_code):
    return f'''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
    <svg width="100%" height="100%" viewBox="0 0 1920 1080" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5;">
        <g id="_-FFFFFF--1920-" serif:id="#FFFFFF (1920)" transform="matrix(1.77778,0,0,1,0,0)">
            <rect x="0" y="0" width="1080" height="1080" style="fill:rgb(210,245,214);"/>
            <g transform="matrix(3.07955,0,0,1.9527,-2720.01,-163.491)">
                <path d="M1228.83,177.179L1228.83,339.117C1228.83,383.805 1215.89,420.085 1199.95,420.085L970.522,420.085C954.583,420.085 941.642,383.805 941.642,339.117L941.642,177.179C941.642,132.491 954.583,96.21 970.522,96.21L1199.95,96.21C1215.89,96.21 1228.83,132.491 1228.83,177.179Z" style="fill:{hex_code};stroke:black;stroke-width:1.7px;"/>
            </g>
            <g transform="matrix(1.70992,0,0,1.70992,-662.478,-712.847)">
                <g transform="matrix(0.5625,0,0,1,454.304,923.272)">
                    <text x="0px" y="0px" style="font-family:'Junegull-Regular', 'Junegull', fantasy;font-size:50px;">{hex_code}</text>
                </g>
                <g transform="matrix(0.5625,0,0,1,453.826,869.68)">
                    <g transform="matrix(50,0,0,50,144.75,0)">
                    </g>
                    <text x="0px" y="0px" style="font-family:'Junegull-Regular', 'Junegull', fantasy;font-size:50px;">{color_name}</text>
                </g>
            </g>
            <g transform="matrix(1.28498,0,0,1,-99.591,15.1008)">
                <path d="M153.605,150.453L153.605,899.345L841.88,899.345" style="fill:none;stroke:black;stroke-width:3.97px;"/>
            </g>
        </g>
    </svg>
    '''

# Read CSV file and generate SVG files
with open('Color_Snake_CSV.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        color_name, hex_code = row['name'], row['hex']
        svg_content = generate_svg(color_name, hex_code)
        with open(f'{hex_code}.svg', 'w') as svgfile:
            svgfile.write(svg_content)

print("SVG files generated successfully.")
