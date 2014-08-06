gitmodules = File.read('.gitmodules')

submodules = []
current_module = nil

gitmodules.split("\n").each do |line|
  if line[0] == "["
    submodules << current_module if !current_module.nil?

    current_module = {}
    next
  end

  parts = line.strip.split("=").map(&:strip)
  current_module[parts[0]] = parts[1]
end

submodules << current_module

submodules.each do |submodule|
  if File.exist?(submodule["path"])
    puts "#{submodule["path"]} exists. Skipping..."
    next 
  end

  `git submodule add #{submodule["url"]} #{submodule["path"]}`
end
