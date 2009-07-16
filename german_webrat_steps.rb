require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Gegebensei /^dass ich auf (.+) bin$/ do |page_name|
  visit path_to(page_name)
end

Wenn /^ich auf (.+) gehe$/ do |page_name|
  visit path_to(page_name)
end

Wenn /^ich auf "([^\"]*)" drücke$/ do |button|
  click_button(button)
end

Wenn /^ich dem Link "([^\"]*)" folge$/ do |link|
  click_link(link)
end

Wenn /^ich "([^\"]*)" in das Feld "([^\"]*)" eingebe$/ do |value, field|
  fill_in(field, :with => value) 
end

Wenn /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field) 
end

# Use this step in conjunction with Rail's datetime_select helper. For example:
# When I select "December 25, 2008 10:00" as the date and time 
Wenn /^I select "([^\"]*)" as the date and time$/ do |time|
  select_datetime(time)
end

# Use this step when using multiple datetime_select helpers on a page or 
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" date and time
# And I select "November 25, 2004 10:30" as the "Alternative" date and time
Wenn /^I select "([^\"]*)" as the "([^\"]*)" date and time$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it. 
Wenn /^I select "([^\"]*)" as the time$/ do |time|
  select_time(time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
Wenn /^I select "([^\"]*)" as the "([^\"]*)" time$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
Wenn /^I select "([^\"]*)" as the date$/ do |date|
  select_date(date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
Wenn /^I select "([^\"]*)" as the "([^\"]*)" date$/ do |date, date_label|
  select_date(date, :from => date_label)
end

Wenn /^I check "([^\"]*)"$/ do |field|
  check(field) 
end

Wenn /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field) 
end

Wenn /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

Wenn /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Dann /^ich sollte "([^\"]*)" sehen$/ do |text|
  response.should contain(text)
end

Dann /^sollte ich "([^\"]*)" sehen$/ do |text|
  response.should contain(text)
end

Dann /^ich sollte nicht "([^\"]*)" sehen$/ do |text|
  response.should_not contain(text)
end

Dann /^sollte ich nicht "([^\"]*)" sehen$/ do |text|
  response.should_not contain(text)
end

Dann /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end

Dann /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should_not =~ /#{value}/
end
    
Dann /^the "([^\"]*)" checkbox should be checked$/ do |label|
  field_labeled(label).should be_checked
end

Dann /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  field_labeled(label).should_not be_checked
end

Dann /^sollte ich auf (.+) sein$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

Dann /^ich sollte auf (.+) sein$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end
