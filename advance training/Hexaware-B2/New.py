import requests
from bs4 import BeautifulSoup
import json

# URL of the Wikipedia page containing the list of cities in India
url = 'https://en.wikipedia.org/wiki/List_of_cities_in_India_by_population'

# Send a GET request to the URL
response = requests.get(url)

# Parse the HTML content of the page
soup = BeautifulSoup(response.text, 'html.parser')

# Find all tables containing the list of cities
tables = soup.find_all('table', class_='wikitable')

# Initialize an empty dictionary to store city names
city_data = {}

city_names = []
    

for row in tables[0].find_all('tr')[1:]:
    # The city names are in the first column of each row
    city_name = row.find('td').text.strip()
    city_names.append(city_name)

    
for row in tables[1].find_all('tr')[1:]:
    # The city names are in the first column of each row
    city_name = row.find_all('td')[1].text.strip()
    city_names.append(city_name)

    # Store the city names in the dictionary with table number as key
    city_data[f'Table1'] = city_names


# Save the city data in a JSON file
with open('indian_cities.json', 'w') as f:
    json.dump(city_data, f, indent=4)

print("Data saved successfully in 'indian_cities.json'")
