 Feature: Signing Up
 In order for me to be known for my project
 As a user
 i want to be able to sign up 

 Scenario: Signing Up

	Given I am on the homepage
	When I follow "Sign up"
	And I fill in "Email" with "divine@me.com"
	And I fill in "Password" with "123123"
	And I fill in "Password Confirmation" with "123123"
	And I press "Sign up"
	Then I should see "you have signed up successfully"