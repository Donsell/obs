Feature: Editing Sessions
	In order to update sessions
	As a user
	I want to be able to do that through an interface
	
	Background:
		Given there is a session with a begin_date of "2012-03-05"
		And I am on the homepage
		When I follow "2012-03-05"
		And I follow "Edit Session"
	
	Scenario: Updating a session
		And I fill in "Location" with "Merrit Reservoir"
		And I press "Update Session"
		Then I should see "Session has been updated."
		Then I should be on the session page for "2012-03-05"
		
	Scenario: Updateing a project with an invalid attributes is bad
		And I fill in "Location" with ""
		And I press "Update Session"
		Then I should see "Session has not been updated."
		
		
		
