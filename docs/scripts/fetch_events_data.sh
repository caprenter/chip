#!/bin/bash

# #Events
# wget --no-check-certificate --output-document=../_data/events.csv "https://docs.google.com/spreadsheets/d/1-Eugy7Wfl0O2dSach2D2dOoE8JEW2tI3sqChuCvLUYg/export?format=csv&gid=0"
# #Venues
# wget --no-check-certificate --output-document=../_data/venues.csv "https://docs.google.com/spreadsheets/d/1-Eugy7Wfl0O2dSach2D2dOoE8JEW2tI3sqChuCvLUYg/export?format=csv&gid=287605425"
# #Artists
# wget --no-check-certificate --output-document=../_data/artists.csv "https://docs.google.com/spreadsheets/d/1-Eugy7Wfl0O2dSach2D2dOoE8JEW2tI3sqChuCvLUYg/export?format=csv&gid=370499827"

#Events
curl -L "https://docs.google.com/spreadsheets/d/1-Eugy7Wfl0O2dSach2D2dOoE8JEW2tI3sqChuCvLUYg/export?format=csv&gid=0" > ../_data/events.csv 
#Venues
curl -L "https://docs.google.com/spreadsheets/d/1-Eugy7Wfl0O2dSach2D2dOoE8JEW2tI3sqChuCvLUYg/export?format=csv&gid=287605425" > ../_data/venues.csv 
#Artists
curl -L  "https://docs.google.com/spreadsheets/d/1-Eugy7Wfl0O2dSach2D2dOoE8JEW2tI3sqChuCvLUYg/export?format=csv&gid=370499827" > ../_data/artists.csv
# Chip Events
curl -L  "https://docs.google.com/spreadsheets/d/1-Eugy7Wfl0O2dSach2D2dOoE8JEW2tI3sqChuCvLUYg/export?format=csv&gid=1645647175" > ../_data/chip.csv


# Remove the column headers of the BAC sheet
sed -i '1d' "../_data/chip.csv"
# Append the BAC events to all events
cat "../_data/chip.csv" >> "../_data/events.csv"
