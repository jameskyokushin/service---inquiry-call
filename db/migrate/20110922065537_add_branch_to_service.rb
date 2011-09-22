class AddBranchToService < ActiveRecord::Migration
  def self.up
    add_column :services, :branch_id, :integer
  end

  def self.down
    remove_column :services, :branch_id
  end
end
