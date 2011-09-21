class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :company
      t.string :address
      t.string :contact_person
      t.string :contact_number
      t.string :e_mail
      t.text :complain

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
