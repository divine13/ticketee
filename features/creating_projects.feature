Feature: Creating Projects
  In order to have projects to assign tickets to 
  As a user 
  I want to create the easily

  Scenario: Creating a project
    Given I am on the homepage
    When I follow "New Project"
    And I fill in "Name" with "my project" 
    Then I should see "project has been created"  