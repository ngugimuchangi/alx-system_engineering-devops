#!/usr/bin/env ruby
# Regular expression to match a string starting with h,
# ending with 'n' and has one of any character in between.

puts ARGV[0].scan(/^h.n$/).join
