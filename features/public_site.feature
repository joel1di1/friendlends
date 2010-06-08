Feature: Public site
  In order to discover the site
  unregistred user
  wants to have a description of the site and a signup faclities
  
  Scenario: First view of the site
    Given I am a unregistred user
    When I visit the home page
    Then I should see "Bienvenue dans 'Où est ma perceuse ?'"
    And I should see "sign up"
    And I should see "sign in"

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
#  Scenario: Delete frooble
#    Given the following froobles:
#      |name|color|description|
#      |name 1|color 1|description 1|
#      |name 2|color 2|description 2|
#      |name 3|color 3|description 3|
#      |name 4|color 4|description 4|
#    When I delete the 3rd frooble
#    Then I should see the following froobles:
#      |Name|Color|Description|
#      |name 1|color 1|description 1|
#      |name 2|color 2|description 2|
#      |name 4|color 4|description 4|
