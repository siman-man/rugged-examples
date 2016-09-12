require 'rugged'

repo = Rugged::Repository.new('.')

branch_name = 'sample_branch'

# git branch -D branch_name
repo.branches.delete(branch_name)

