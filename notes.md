##### BUILD A PROJECT FROM SCRATCH

### Project Requirements
Provide a CLI (Links to an external site.)
Your CLI application (Links to an external site.) must provide access to data from a web page.
The data provided must go at least one level deep. A "level" is where a user can make a choice and then get detailed information about their choice. Some examples are below:
Movies opening soon - Enter your zip code and receive a list of movies and their details.
Libraries near you - Enter your zip code and receive a list of libraries and their details.
Programming meetups near you - Choose from an events list and receive details.
News reader - List articles and read an article of your choosing.
Your CLI application should not be too similar to the Ruby final projects (Music Library CLI, Tic-Tac-Toe with AI, Student Scraper). Also, please refrain from using Kickstarter (Links to an external site.) as that was used for the scraping 'code along'.
Use good OO design patterns. You should be creating a collection of objects, not hashes, to store your data. Pro Tip: Avoid scraping data more than once per web page - utilize objects you have already created. It will speed up your program!

## Flow
- Set up a cli file
- Find an api
    > Inspirational Quotes
    > (http://api.forismatic.com/api/1.0/)
- Classes/relationships

 - user is greeted & asked if they are feeling stressed today
 - show options 1 for yes, 2 for no
    - if yes, 
        + read: "Im sorry to hear that :(. Would you like a quote to brighten your spirit?"
            -show options 1 for yes, 2 for no
                - if yes, 
                    - until input = no 
                        -- read: "quote"
                        + ask if they want another?
                        -show options 1 for yes, 2 for no
                + read: Well then, I hope youre feeling better! Have a good day!
                (exit)
    -else
        "Well continue having a good day!"
        (exit)
                    
