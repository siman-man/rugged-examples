require 'rugged'

repo = Rugged::Repository.new('.')

branches = repo.branches

p branches.exist?('hoge') #=> false
p branches.exist?('master') #=> true

p branches.exists?('hoge') #=> false
p branches.exists?('master') #=> true
