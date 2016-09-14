require 'rugged'

repo = Rugged::Repository.new('.')

commit = repo.last_commit

puts commit.oid
puts commit.message
