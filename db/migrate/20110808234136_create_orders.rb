class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :client_name
      t.boolean :paid, :default => false, :null => false
      t.integer :people
      t.references :table, :null => false
      t.references :user, :null => false
      t.timestamps
    end

    add_index :orders, :table_id
    add_index :orders, :user_id
  end
end