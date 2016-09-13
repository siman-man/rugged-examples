require 'rugged'
require 'colorize'

repo = Rugged::Repository.new('.')

commit = repo.last_commit

author = commit.author
committer = commit.committer

puts <<-COMMIT_LOG
parents: #{commit.parent_ids.join(', ').blue}
commit #{commit.oid.yellow}
Author: #{author[:name]} <#{author[:email]}>
Committer: #{committer[:name]} <#{committer[:email]}>
Date: #{committer[:time]}

    #{commit.message}
COMMIT_LOG

