require 'colorize'
require 'rugged'

repo = Rugged::Repository.new('.')

repo.branches.each do |branch|
  name = branch.name
  remote_name = branch.remote_name

  next if name.include?('/')

  if branch.head?
    puts "* #{name.green}"
  else
    puts "  #{name}"
  end
end
