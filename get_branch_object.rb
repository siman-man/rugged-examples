require 'rugged'

repo = Rugged::Repository.new('.')

branch_name = 'master'
branches = repo.branches

branch = branches[branch_name]

puts branch.name
