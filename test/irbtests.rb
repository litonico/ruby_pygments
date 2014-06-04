require_relative 'testcase'
require 'ruby_pygments'

puts "testing basic highlight"
puts Ruby_Pygments.highlight('lambda x: x', 'python', 'annotate')
puts "testing highlight with strange string quoting"
puts Ruby_Pygments.highlight(SOURCESTR, 'python', 'annotate')
