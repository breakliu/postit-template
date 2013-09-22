class Membership < ActiveRecord::Migration
  def change
  	create_table :memberships do |t|
  		t.integer :post_id
  		t.integer :category_id
      t.timestamps
  	end
  end
end
