== README
# Requires Ruby 2.4.2 installed

## How I run this
  1. I am running this on Windows10 with the ubuntu subsystem
  2. I use the subsystem for commands like git, rvm, bundle and rails
  3. I used HeidiSql(free windows app/ donations welcome) for DB creation 
  and alterations as it allows me to CRUD all aspects of the schema.

## Description:
  > Simple UI for storing and keeping track of tracking services used on a site, what parameters are 
  >  relevant and descriptions for each.
  > Ability to store specific tracking calls for reference that are accessible for use as test verification via rest API.

## Database:
  > A mysql database service needs to be running locally and a "track" DB created with the associated sql file<>.
Once the service is running, use a DB authoring tools the create a database name track and rund the sql file to create the schema.

## Starting the project:
  > With a running DB, navigate to the workspace for the project and run the following in order
    - workspace/trackio$ gem install bundler
    - workspace/trackio$ bundler install
    - workspace/trackio$ rails server

## Accessing the Webapp:
  You should now have a running webapp
  In a browser, visit your [localhost](http://localhost:3000)


