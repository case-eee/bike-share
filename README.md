# Bike Share

We used Ruby, Sinatra, and Activerecord to build a site that analyzes bike share usage in San Francisco.

## Collecting the Data
Our application collects data by utilizing:
<br>
1)  User input through our web app, on which a user can enter trip/station/weather information
<br>
2)  CSV files with historical information for stations, trips, and weather

## Analysis
We started by analyzing the data from each table (stations, trips, and weather) seperately and then used their relationships to make connections and draw hypotheses based on what we found.

## Setup Instructions
Run these commands in this order:
'''
git clone https://github.com/DavidKnott/bike-share.git
cd bike-share
bundle
rails db:create
rails db:migrate
rails db:seed
rails db:test:prepare
'''

## Deployment instructions
To launch the project on local host, start up the rails server and visit the root path.
```
rails s
```

## How to Run the Test Suite
Run rspec from the command line:
```
rspec
```

## Tools/Technologies used
* Git/GitHub
* Waffle.io
* HTML, CSS, Bootstrap
* Sinatra and ERB templates
* ActiveRecord
* PostgreSQL
* Javascript and Google Maps API
* Rspec
* Capybara

## Project Team
[Eric](https://github.com/cews7), [David](https://github.com/DavidKnott), [Nick](https://github.com/njgheorghita)
