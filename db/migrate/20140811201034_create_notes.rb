class CreateNotes < ActiveRecord::Migration
  def up
    create_table :notes do |t|
    	t.belongs_to :account
    	t.text "log"

      t.timestamps
    end
  end

  def down
  	drop_table :notes
  end
end
