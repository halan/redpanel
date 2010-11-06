class System_Gem
  def self.all
    gems_list = []
    Gem::path.each do |path|
      gems_list += Dir[File.join(path, 'gems', '*'), ].map do |gem_path|
        gem_complete_name = File.basename(gem_path)
        gem_complete_name, name, version = gem_complete_name.match(/^(.*)-([0-9.]+)$/).to_a
        {:name => name, :version => version}
      end
    end
    gems_list
  end
end
