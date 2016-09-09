require 'rugged'

repo = Rugged::Repository.new('.')

repo.checkout('develop')
