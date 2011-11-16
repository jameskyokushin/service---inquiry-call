class AddWarrantyToServices < ActiveRecord::Migration
  def self.up
    add_column :services, :warranty, :string
  end

  def self.down
    remove_column :services, :warranty
  end
end
