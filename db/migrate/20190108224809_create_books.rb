class CreateBooks < ActiveRecord::Migration
  def change
  	create_table :books do |t|
  		t.string :title
  		t.string :author
  		t.string :genre
        t.integer :user_id
  	end
  end
end
