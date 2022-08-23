#!/usr/bin/env ruby
# Regular expression to match zero or one incidence of 'b'

puts ARGV[0].scan(/hb?tn$/).join
