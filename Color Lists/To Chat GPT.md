# To Chat GPT

To keep track of some of my messages to chat GPT


---

I have these cvs files named so
"HTML.csv
NTC_v3.csv
x11.csv"

They are all layed out like
"name,hex
Black,#000000
Navy Blue,#000080
Dark Blue,#0000C8
Blue,#0000FF
Stratos,#000741
Swamp,#001B1C"

The NTC one is the largest I want to run a command from the terminal to create a csv file that has names and hex for colors in the "HTML.csv" and  "x11.csv" that are not in the NTC_v3.csv, and lets name the file standard_difference.csv

**Chat GTP final Response:**
```shell
awk -F, 'FNR==NR{a[tolower($2)]; next} !(tolower($2) in a)' NTC_v3.csv HTML.csv x11.csv | sort | uniq > standard_difference.csv
```

**Note:**
I don't know what I will do with this file, but at least I have it! Use it for next task...

---

Now create markdown files like this from the standard_difference.csv.


**Thursday March 21, 2024**
- Now I should have a md file for every color from the standard lists, I tried for awhile but to get the correct tags for each file from the terminal but gave up, so I will have to manully add tags.
- I also later this evening will create a script for create svg thumbnails.
- the svg thumnails will be a cointinual thing to create as I add more color md files.
- And as I add more color md files I may need to create a cvs file to keep track of them.


