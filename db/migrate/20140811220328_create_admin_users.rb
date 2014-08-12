class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
    	t.string "first_name"
    	t.string "last_name"
    	t.string "email"
    	t.string "username"
    	t.string "password_digest"
      t.timestamps
    end
  end

  def down
  	drop_table :admin_users
  end
end
