Feature: Creating observing session
	In order to have sessions to log observations to
	As a User
	I want to create them easily
	
Scenario: Creating a session
	Given I am on the homepage
	When I follow "New Session"
	And I select "March 5th, 2012" as the "Date" date
	And I select "16:30:00" as the "Start Time" time
	And I fill in "Location" with "The Farm"
	And I fill in "Initial Seeing" with "3"
	And I fill in "Initial Transparency" with "3"
	And I press "Create Session"
	Then I should see "Session has been created."
