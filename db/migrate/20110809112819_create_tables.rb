class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number, :null => false, :unique => true
      t.integer :seats
      t.references :user
    end

    add_index :tables, :user_id
  end
end