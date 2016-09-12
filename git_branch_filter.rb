require 'colorize'
require 'rugged'

repo = Rugged::Repository.new('.')

repo.branches.each(:local) do |local_branch|
  puts local_branch.name
end

repo.branches.each(:remote) do |remote_branch|
  puts remote_branch.name
end

puts "\nlocal branche list"

repo.branches.each_name(:local) do |name|
  puts "  #{name}"
end

puts "\nremote branch list"

repo.branches.each_name(:remote) do |name|
  puts "  #{name}"
end
