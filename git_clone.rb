require 'rugged'

url = 'https://github.com/siman-man/rugged-sandbox.git'
local_path = File.expand_path('repos/rugged-sandbox', Dir.pwd)

repo = Rugged::Repository.clone_at(url, local_path)
