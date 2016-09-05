require 'colorize'
require 'rugged'

repo = Rugged::Repository.new('.')

repo.walk(repo.last_commit).take(5).each do |entry|
  sha = entry.oid
  message = entry.message.chomp
  committer = entry.author
  author = committer[:name]
  email = committer[:email]
  time = committer[:time]

  puts "commit #{sha}".yellow
  puts "Author:\t#{author} <#{email}>"
  puts "Date:\t#{time}"
  puts ""
  puts "#{message}"
  puts ""
end
