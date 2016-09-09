require 'rugged'

repo = Rugged::Repository.new('.')
ref = repo.head
commit = ref.target
tree = commit.tree

tree.each do |obj|
  puts "%06o #{obj[:type]} #{obj[:oid]}\t#{obj[:name]}" % [obj[:filemode]]
end
