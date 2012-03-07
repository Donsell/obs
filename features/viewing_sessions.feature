Feature: Viewing Sessions
	In order to add observations to a session
	As a user
	I want to be able to see a list of available sessions
	
Scenario: Listing all Sessions
	Given there is a session with a begin_date of "2012-3-5"
	And I am on the homepage
	When I follow "2012-03-05"
	Then I should be on the session page for "2012-03-05"
