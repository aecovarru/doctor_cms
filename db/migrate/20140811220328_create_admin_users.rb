class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
    	t.string "first_name", :default => ""
    	t.string "last_name", :default => ""
    	t.string "email"
    	t.string "username"
    	t.string "password_digest"
      t.boolean "administrator", :default => false
      t.timestamps
    end
  end

  def down
  	drop_table :admin_users
  end
end
