Feature: view front page

  Scenario: Front page
    Given I am viewing "/"
    Then I should see a link to "/" called "Main page"
