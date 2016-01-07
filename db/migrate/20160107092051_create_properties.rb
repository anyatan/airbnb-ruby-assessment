class CreateProperties < ActiveRecord::Migration
	def change
 			create_table :properties do |t|
      		t.integer :user_id
      		t.string :property
      		t.timestamp null:false
  		end
	end
end
