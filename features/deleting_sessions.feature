 Feature: Deleting Sessions
 	In order to remove needless sessions
 	As a user
 	I want to be able to make them disappear
 	
	Scenario: Deleting a session
		Given there is a session with a begin_date of "2012-03-05"
		And I am on the homepage
		When I follow "2012-03-05"
		And I follow "Delete Session"
		Then I should see "Session has been deleted."
		And I should not see "2012-03-05"
