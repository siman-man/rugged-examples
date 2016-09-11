require 'rugged'

repo = Rugged::Repository.new('.')

def range_log(repo, from, to)
  logs = []
  commits = repo.walk(from)

  commits.each do |commit|
    break if to.oid == commit.oid
    logs << commit
  end

  if commits.size == logs.size
    raise 'Object not found' if commits.size == logs.size
  else
    logs
  end
end

commits = repo.walk(repo.last_commit).to_a

logs = range_log(repo, commits[0], commits[5])

p logs.size

