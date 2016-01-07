class CreateComments < ActiveRecord::Migration
		def change
 			create_table :comments do |t|
      		t.integer :user_id
      		t.integer :property_id
      		t.string :comment
      		t.timestamp null:false
  		end
	end
end
