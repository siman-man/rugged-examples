require 'rugged'

repo = Rugged::Repository.new('.')

first_commit = repo.walk(repo.last_commit).to_a.last

puts first_commit.oid
puts first_commit.message
