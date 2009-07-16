Wenn /^(\d+) Minuten vergehen$/ do |minutes|
  now = Time.now
  Time.stub!(:now).and_return(now + minutes.to_i.minutes)
end

Wenn /^(\d+) Stunden vergehen$/ do |hours|
  now = Time.now
  Time.stub!(:now).and_return(now + hours.to_i.hours)
end

Wenn /^(\d+) Tage vergehen$/ do |days|
  now = Time.now
  Time.stub!(:now).and_return(now + days.to_i.days)
end