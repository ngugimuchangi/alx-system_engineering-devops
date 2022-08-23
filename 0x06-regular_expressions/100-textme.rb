#!/usr/bin/env ruby
# Regular expression to match a string a 10 digit phone number

# puts ARGV[0].scan(/from:(.*])\b.*to:(.\d*)\b.*flags:(.*\w)\]/).join(",")
# puts ARGV[0].scan(/from:(.\w*)\].*to:(.\w*).*flags:(.*\d)\]/).join(",")
puts ARGV[0].scan(/from:(.*)\].*to:(.*)\].*flags:(.*)\].*\[msg/).join(",")
