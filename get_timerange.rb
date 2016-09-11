require 'rugged'

repo = Rugged::Repository.new('.')

def get_timerange_log(repo, time)
  repo.walk(repo.last_commit).take_while do |commit|
    commit.time > time
  end
end

# 1 hour
hour_logs = get_timerange_log(repo, Time.now - 3600)

# 1 day
day_logs = get_timerange_log(repo, Time.now - 3600 * 24)

# 1 week
week_logs = get_timerange_log(repo, Time.now - 3600 * 24 * 7)

puts "#{hour_logs.size} commits 1 hour ago"
puts "#{day_logs.size} commits 1 day ago"
puts "#{week_logs.size} commits 1 week ago"
