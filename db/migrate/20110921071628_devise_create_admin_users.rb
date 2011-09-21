class DeviseCreateAdminUsers < ActiveRecord::Migration
  def self.up
    create_table(:admin_users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    # Create a default user
    AdminUser.create!(:email => 'james@admin.com', :password => 'james99', :password_confirmation => 'james99')
    AdminUser.create!(:email => 'steven@admin.com.ph', :password => 'steven99', :password_confirmation => 'steven99')
    AdminUser.create!(:email => 'chris@admin.com.ph', :password => 'chris99', :password_confirmation => 'chris99')
    AdminUser.create!(:email => 'ed@admin.com.ph', :password => 'ed99', :password_confirmation => 'ed99')
    AdminUser.create!(:email => 'excel@asi.com.ph', :password => 'excel10', :password_confirmation => 'excel99')
    AdminUser.create!(:email => 'kim@admin.com.ph', :password => 'kim99', :password_confirmation => 'kim99')
    AdminUser.create!(:email => 'allen@asi.com.ph', :password => 'allen99', :password_confirmation => 'allen99')
    AdminUser.create!(:email => 'agent001@asi.com.ph', :password => '1agent99', :password_confirmation => '1agent99')
    AdminUser.create!(:email => 'agent002@asi.com.ph', :password => '2agent99', :password_confirmation => '2agent99')
    AdminUser.create!(:email => 'agent003@james.com', :password => '3agent99', :password_confirmation => '3agent99')
    AdminUser.create!(:email => 'agent004@asi.com.ph', :password => '4agent99', :password_confirmation => '4agent99')
    AdminUser.create!(:email => 'agent005@asi.com.ph', :password => '5agent99', :password_confirmation => '5agent99')
    AdminUser.create!(:email => 'agent006@james.com.ph', :password => '6agent99', :password_confirmation => '6agent99')


    add_index :admin_users, :email,                :unique => true
    add_index :admin_users, :reset_password_token, :unique => true
    # add_index :admin_users, :confirmation_token,   :unique => true
    # add_index :admin_users, :unlock_token,         :unique => true
    # add_index :admin_users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :admin_users
  end
end
