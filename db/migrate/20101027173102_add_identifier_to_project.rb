class AddIdentifierToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :identifier, :string
  end

  def self.down
    remove_column :projects, :identifier
  end
end
