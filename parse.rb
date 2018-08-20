require './requires'

# parsing
parser = Parser.new 'search.xml'
parser.parse

# printing result
output = Output.new parser.results
output.to_console

