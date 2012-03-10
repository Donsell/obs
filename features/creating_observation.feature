Feature: Creating Observation
In order to create observations for sessions
As a user
I want to be able to select a session and do that

Background:
	Given there is a session with a begin_date of "2012-03-05"
	And I am on the homepage
	When I follow "2012-03-05"
	And I follow "New Observation"
	
Scenario: Creating an observation
	And I select "March 5th, 2012" as the "Date" date
	And I select "16:30:00" as the "Time" time
	And I fill in "Seeing" with "3"
	And I fill in "Transparency" with "3"
	And I fill in "Notes" with "This is an observing note."
	And I press "Create Observation"
	Then I should see "Observation has been created."
	And I should see "2012-03-05"
	And I should see "This is an observing note."

Scenario: Missing Notes should fail
	And I select "March 5th, 2012" as the "Date" date
	And I select "16:30:00" as the "Time" time
	And I fill in "Seeing" with "3"
	And I fill in "Transparency" with "3"
	And I press "Create Observation"
	Then I should see "Notes can't be blank"
	And I should see "New Observation"
