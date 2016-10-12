require 'rugged'
require 'pathname'

repo = Rugged::Repository.new('.')

repo.last_commit.tree.walk_blobs do |root, entry|
  puts Pathname.new(root).join(entry[:name])
end
