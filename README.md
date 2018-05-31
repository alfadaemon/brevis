# README

This README documents the steps necessary to get the application up and running.

* Application Information
    -
* Ruby version 2.3.0
* Rails version 5.2.0

* System dependencies
    - 
    - We use postgresql for the DB storage.
    - To run the application locally use `rails server` command from a CLI

* Configuration
    -
    - As stated before, we use postgreSQL for the DB, so you should configure the development information in ther: you should change the username/password in the DB Config files (config/database.yml)
    - If you haven't done it, run bundle install to install all the dependencies from the Gemfile.

* Database creation
    -
    - Once you are have the application running (`rails server` remember?), run the following steps on the CLI:
        * `rake db:create` (For this, your user needs to have creation permissions on the DB)
        * `rake db:migrate` 

* Database initialization (ROBOT!!!!)
    -
    - Run `rake db:populate` (This is optional but it will fill up your DB with 150 random urls.)

* How to run the test suite
    -
    - I'm still working on this, the application has some basic testing
    - You can run `rake` and/or `rails test test/models/brevi_test.rb` to run the sample tests.


* Deployment to heroku instructions
    -
    I used the Heroku Git deployment method, it is simple an fast to get the app up and running.
    
    - Install heroku toolbelt on your machine.
    - Once you you have it installed, on a CLI run: `heroku login`
        - It will ask you for your heroku credentials. (create an account if you haven't)
    - You can create the app from the heroku command line using `heroku create <nameOfApp>` command (replace <nameOfApp> with the name of your app.
    - Inside the project folder:
        - Confirm that Heroku's remote repository was added to your origins, run `git remote -v` you should have four entries, two for origin and two for heroku
        - If no remote origin was added, you should run `heroku git:remote -a <nameOfApp>`. this will add Heroku's remote Git respository so Heroku automatically deploy the app from source.
        - Now do a push to heroku origin, this will detect your app and install the required gems and postgres. Run `git push heroku master`
        - Afte this you need to run the DB create and migrations:
            - Run: `heroku run rake db:create`
            - Then: `heroku run rake db:migrate`
            - Lastly: `heroku run rake db:populate` (remember, this is optional and will populate your app with random urls.)
            