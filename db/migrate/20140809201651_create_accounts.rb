class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
    	t.string "name"
    	t.string "address"
    	t.string "email"
    	t.string "phone"
    	t.string "fax"
      t.string "account_type"
      t.string "other_type"
      t.string "business"
      t.string "affiliate_number"
      t.string "website"
      t.string "state"
      t.string "doctor"
      t.timestamps
    end
  end

  def down
  	drop_table :accounts
  end
end
