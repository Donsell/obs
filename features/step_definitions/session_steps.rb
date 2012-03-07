Given /^there is a session with a begin_date of "([^"]*)"$/ do |arg1|
  Factory(:session, :begin_date => arg1)
end
