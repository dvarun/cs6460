# SICT

Student and Instructor Collaboration Tool

# System Requirements

- Ruby version 2.5.1
- Rails version 5.2.2
- PostgreSQL
- IBM Watson Tone Analyzer Api Key

## Installation instructions

Clone the repository or download the source code, if you have downloaded then extract the file into any folder.

Perform the following steps below
open the terminal and move into the path of the folder where your source code is, e.g. command below

    cd cs6460

then install all the dependencies for the application, with the command below

    bundle install

Once all the dependencies are installed, perform database migration, command as per below.

    rails db:drop db:create db:migrate

then open a file called ApiCaller.rb in app/models/concerns/apicaller.rb and put IBM Watson tone analyzer API key, in the parameter below.

    iam_apikey:  "xxxxxxxxxxxxxxxxxxxxxx",

Once the key is available in the parameter above, then we will seed the database with the sample data, to seed the data run the command below

    rails db:seed

if the seed was successful, in the terminal it will show output as per below.

    user created
    events created
    state created
    task created
    feedback done
    done

To finally, run the application, use the command below.

    rails s

# Test Accounts

- Student accounts - ava@mail.com, ted@mail.com, robin@mail.com, paul@mail.com - password: demo123
- Instructors accounts - emily@mail.com, frank@mail.com - password: demo123

Sample data is available in the path below.

    db/seeds.rb
