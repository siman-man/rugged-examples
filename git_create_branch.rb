require 'rugged'

repo = Rugged::Repository.new('.')

repo.create_branch('test')
