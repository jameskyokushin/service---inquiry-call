class AddPreparedByToServices < ActiveRecord::Migration
  def self.up
    add_column :services, :prepared_by, :string
  end

  def self.down
    remove_column :services, :prepared_by
  end
end
