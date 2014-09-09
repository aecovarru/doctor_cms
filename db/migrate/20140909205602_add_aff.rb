class AddAff < ActiveRecord::Migration
  def up
  	add_column("accounts", "aff", :string, :default => "Nothing")
  end

  def down
  	remove_column("accounts", "aff")
  end
end
