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

Chat GTP Response:
```shell
awk -F, 'FNR==NR{a[$2];next} !($2 in a)' NTC_v3.csv HTML.csv x11.csv | sort > standard_difference.csv
```

---
