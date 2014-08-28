class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
    	t.string "name"
    	t.string "address"
    	t.string "email"
    	t.string "phone"
    	t.string "fax"
      t.string "business"
      t.string "affiliate_number"
      t.string "website"
      t.string "state"
      t.string "doctor"
      t.string "letter", :default => "Nothing"
      t.string "certificate", :default => "Nothing"
      t.string "pads", :default => "Nothing"
      t.string "sent", :default => "Nothing"
      t.string "emailed", :default => "Nothing"
      t.string "call", :default => "Nothing"
      t.string "sold", :default => "Nothing"
      t.timestamps
    end
  end

  def down
  	drop_table :accounts
  end
end
