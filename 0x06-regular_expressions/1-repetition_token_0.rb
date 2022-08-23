#!/usr/bin/env ruby
# Regular expression to match a reptition of t in range 2 to 5

puts ARGV[0].scan(/hbt{2,5}n$/).join
