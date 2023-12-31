require 'optparse'

Dir['lib/**/*.rb'].each do |file|
  require File.join(File.dirname(__dir__), file)
end

options = {}
OptionParser.new do |opts|
  opts.on('-f', '--filter FIELD_VALUE', 'Filter (field:value)') { |v| options[:filter] = v }
  opts.on('-n', '--name NAME', 'Name') { |v| options[:name] = v }

end.parse!

result = DataFinder.new(options).call
PresentResult.new(result).call