class CreateNotes < ActiveRecord::Migration
  def up
    create_table :notes do |t|
    	t.belongs_to :account
      t.string "created_by"
      t.string "date"
    	t.text "note"

      t.timestamps
    end
  end

  def down
  	drop_table :notes
  end
end
