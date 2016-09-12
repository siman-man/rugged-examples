require 'rugged'

repo = Rugged::Repository.new('.')

revision = repo.last_commit.oid
path = 'Gemfile'

blob = repo.blob_at(revision, path)

puts blob.text
