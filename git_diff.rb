require 'colorize'
require 'rugged'

def color_diff_message(message)
  message.split("\n").map {|line|
    case line
    when /^\+/
      line.green
    when /^\-/
      line.red
    when /^@@.*@@$/
      line.cyan
    else
      line
    end
  }.join("\n")
end

repo = Rugged::Repository.new('.')
diff = repo.diff_workdir(repo.last_commit)

diff.each_patch do |patch|
  puts color_diff_message(patch.to_s)
end

