Feature: Viewing projects 
  In order to assign tikets
  As a user 
  I want to be able to list all available projects

  Scenario: List all projects 
    Given there is a project
    And I am at the home page 
    When I follow "divine"
    Then I should be on the project page for "divine"