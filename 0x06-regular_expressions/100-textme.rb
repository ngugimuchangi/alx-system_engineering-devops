#!/usr/bin/env ruby
# Script to parse string
# Output: [SENDER],[RECEIVER],[FLAGS]
#   SENDER: The sender phone number or name (including country code if present)
#   RECEIVER: The receiver phone number or name (including country code if present)
#   FLAGS: The flags that were used

puts ARGV[0].scan(/from:(.*)\].*to:(.*)\].*flags:(.*)\].*\[msg/).join(",")
