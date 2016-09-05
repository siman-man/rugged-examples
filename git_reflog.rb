require 'colorize'
require 'rugged'

repo = Rugged::Repository.new('.')

ref = repo.head

repo.walk(repo.last_commit).reverse_each do |entry|
#ref.log.reverse_each do |entry|
  sha = entry[:id_new]
  message = entry[:message]
  committer = entry[:committer]
  author = committer[:name]
  email = committer[:email]
  time = committer[:time]

  puts <<-GITLOG
#{"commit\t#{sha}".yellow}
Author:\t#{author} <#{email}>
Date:\t#{time}"

    #{message}"

  GITLOG
end
