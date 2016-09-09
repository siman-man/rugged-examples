require 'rugged'
require 'colorize'

# TODO: not yet implemented
repo = Rugged::Repository.new('.')


repo_status = Hash.new{|h,k| h[k] = []}

index_files = []
worktree_files = []

repo.status {|file, status_data|
  repo_status[status_data.first] << file
  status = status_data.first

  if %i(index_new index_modified index_deleted).include?(status_data.first)
    index_files << [file, status]
  elsif %i(worktree_new worktree_modified worktree_deleted).include?(status_data.first)
    worktree_files << [file, status]
  end
}

puts "On branch master"
puts "Your branch is up-to-date with 'origin/master'."
puts '  Changes to be committed:'
puts '    (use "git reset HEAD <file>..." to unstage)'
puts ''

index_files.each do |file, status|
  status = status.to_s.gsub('index_', '')
  puts "\t#{status} file:  #{file}".green
end

puts ''
puts 'Untracked files:'
puts '  (use "git add <file>..." to include in what will be committed)'
puts ''

worktree_files.each do |file, status|
  status = status.to_s.gsub('worktree_', '')
  puts "\t#{file}".red
end

puts ''
