require 'rugged'

class Repository
  def clone_at
    url = 'https://github.com/siman-man/git-sandbox.git'
    local_path = File.join(Dir.pwd, 'repos/git-sandbox')
    Rugged::Repository.clone_at(url, local_path)
  end
end

