== README
# Requires Ruby 2.4.2 installed

## What you should know
  1. How to install ruby (rvm or rbenv) and bundler (google helps)
  2. How to run mysql, create a DB and setup access
  3. How to git a repo
  

## How I run this
  1. I am running this on Windows10 with the ubuntu subsystem
  2. I use the subsystem for commands like git, rvm, bundle and rails
  3. I use [HeidiSql](https://www.heidisql.com/)(free windows app/ donations welcome / awesome tool) for DB creation 
  and alterations as it allows me to CRUD all aspects of the schema.
 

## Description:
  > Simple UI for storing and keeping track of tracking services used on a site, what parameters are 
  >  relevant and descriptions for each.
  > Ability to store specific tracking calls for reference that are accessible for use as test verification via rest API.

## Database:
  > A mysql database service needs to be running locally and a "track" DB needs to be created with the associated sql file<trackio.sql>.
  > Once the service is running, use a DB authoring tools the create a database name track and run the sql file to create the schema.
  > Verify that tables have been created.
  > The project is already configured to connect but check the database.yml for details when creating the DB.

## Getting started with the project:  
  ### Navigate to the workspace for the project and run the following in order
    1. workspace/trackio$ gem install bundler
    2. workspace/trackio$ bundle install
    3. workspace/trackio$ rails server
    
## Accessing the Webapp:
   * You should now have a running webapp
   * In a browser, visit your [localhost](http://localhost:3000)


![trackio_capture2](https://user-images.githubusercontent.com/4805625/32510929-4bdf27b8-c3c0-11e7-9be0-f0433e529e83.PNG)
