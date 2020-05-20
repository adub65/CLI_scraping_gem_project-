# PA State Parks Object-Oriented Scraper (Project 1)

## Objectives
- Use Nokogiri to scrape the PA DCNR website.
- Use the scraped data to create a Command Line Interface where the user can return a list of all the state parks.
- Give user the option to select one of the state parks and find more information about it.

## Overview

This project will scrape the Pennsylvania Department of Conservation and Natural Resources and list all the state parks within the state. When the CLI runs, it will welcome the user and give them the list of all the state parks in PA. The user will then be prompted to enter a number that will correspond to a state park on the list. The input will open a web page that corresponds to that state park and reveal information, such as location, directions, and contact info for the park's manager. The user can then return to the original park list and select a different park. Once a user is finished, they can `exit` the CLI and it will output a goodbye message.

## Navigation

1. Type in `ruby bin/run.rb` to initiate the Command Line Interface.
2. Once the terminal outputs the list of state parks, make a number selection that corresponds to the state park. This will print out basic info about the state park.
3. You will then be prompted to type in one of three different selections:
`open` will open the selected park's URL in your default browser and exit out of the CLI.
`back` will return you to the original list of parks.
`exit` will exit out of the CLI and `puts` a goodbye message.