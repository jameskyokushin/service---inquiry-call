class AddNotesToServices < ActiveRecord::Migration
  def self.up
    add_column :services, :notes, :text
  end

  def self.down
    remove_column :services, :notes
  end
end
