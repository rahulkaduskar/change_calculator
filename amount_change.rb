require "./lib/change"

# First positive check
begin
  puts Change.change(41)
rescue Exception => e
  puts e.message
end
# Second negative amount check
begin
  puts Change.change(-41)
rescue StandardError => e
  puts e.message
end
