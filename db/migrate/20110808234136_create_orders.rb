class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
	    t.string :client_name
      t.boolean :paid
      t.integer :people
	    t.references :table, :null => false
        t.references :user, :null => false
        t.timestamps
      end
  end
end