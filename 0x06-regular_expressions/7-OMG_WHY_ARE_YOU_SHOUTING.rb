#!/usr/bin/env ruby
# Regular expression to match all caps letters

puts ARGV[0].scan(/[A-Z]*/).join
