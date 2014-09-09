class AddTabs < ActiveRecord::Migration

  def up
  	add_column("accounts", "email2", :string)
  	add_column("accounts", "SMAT", :string, :default => "Nothing")
  end

  def down
  	remove_column("accounts", "SMAT")
  	remove_column("accounts", "email2")
  end

end
