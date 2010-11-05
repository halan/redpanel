class Project < ActiveRecord::Base
  validates_uniqueness_of :identifier, :domain, :name, :repositorie

  def identifier= value
    super dynamic_identifier(value)
  end

  def domain= value
    value = "www.#{(dynamic_identifier(identifier).gsub('_', ''))}.com" if value.empty?
    super value
  end

  def repositorie= value
    value = (identifier or name) if value.empty?
    value = value.split('/').last.gsub '.git', ''
    super "root@localhost:/var/git/#{dynamic_identifier(value)}.git"
  end

  protected
  def dynamic_identifier value = nil
    value = name if value.nil? or value.empty?
    value.to_slug.with_separators('_').approximate_ascii!
  end

end
