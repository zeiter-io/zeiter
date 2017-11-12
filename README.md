# zeiter
Better scheduling for medium to large teams.

###Index

[Testing Philosophy](#testing-philosophy)

[Maintaining Specs](#maintaining-specs)

# Testing Philosophy
>Controller testing has been soft-deprecated in Rails, but you’re still likely to see controller specs in many Rails codebases. The basics covered in this post still apply. -*Everyday Rails*

Testing in Rails has changed from 100% coverage in unit and controller testing to feature/integration testing.  Originally Rspec scaffolded controller tests and these were used by developers to prove the application state would hold up under use.  Unit tests and Controller tests were expected for each function or method to guarantee that the developer wasn't coding incorrectly.

There isn't a clearly defined source of truth for each of these terms but here's the rundown:
#### Unit Tests
* Tests edge cases
* Acts as an Assert of a code chunk
* Tests an isolated component separate from the whole Application

#### Controller Tests
* Pre Rails 5 standard
* Lie about application state to Developer
* False sense of comfort
* Tests a larger, but still isolated portion of code

The theme here is that we're testing small pieces, while benefical in many cases it should not be the core testing suite.  People have shifted to integration/feature tests because these test the whole application state.  This is more valuable because applications are complicted and no one can think about every piece of the application while adding one feature.  I'll refer to integration tests as feature tests here on out because it seems to be a loose term; but when you combine rspec and capybara you get feature tests, so we'll stick with that.

#### Feature Tests
* Test the state of the application
* Focus on the app components
..* database
..* http/json response
..* header
..* redirection source/destination
* Contain the Application truth
* Sends a request and ensures the app state is as expected. *An Assertion for the entire app*

You may see the differences, we're not passing arguements to methods and watching the output, we're making sure that the app is as reliable as possible.  Every line of code added should not change the expected state.  The ui should display the correct messages in the proper amount of time.  The database should cache and retrieve the proper record.  The header should contain the correct status and referer.  The status code returned should indicate the state of the request.  Etc, etc, etc.

## Sources
*in no particular order*

[Modern testing overview w/ Prathamesh Sonpatki](https://youtu.be/WAznFdX1O4g)

[Nice Rspec Docs on Relish](https://relishapp.com/rspec/rspec-rails/v/3-7/docs)

[SO factory_bot and rspec setup](https://stackoverflow.com/questions/10925116/got-error-cant-be-blank-rails-test)

[Bye Bye Controller Tests](https://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html)

[Hello Feature Specs](https://everydayrails.com/2016/09/05/replace-rspec-controller-tests.html)

# Specs
```
Program testing can be used to show the presence of bugs, but never to show their absence! 
--Edsger Dijkstra
```
#### Running Specs
Run the `rspec` command in your terminal while in the project root.  Output should show Failed, pending, and succesfull tests. 

#### Dependencies
[factory_bot](https://github.com/thoughtbot/factory_bot_rails) - Generates objects we'll use for testing.
[database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) - Destroys records created during testing so we don't try and create things that already exist on subsequent tests.

#### Controller Specs

#### Routing Specs

#### Feature Specs

#### Request Specs