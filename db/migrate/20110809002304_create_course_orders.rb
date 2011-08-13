class CreateCourseOrders < ActiveRecord::Migration
  def change
    create_table :course_orders, :id => false do |t|
      t.references :order, :null => false
      t.references :course, :null => false
      t.integer :number_required, :null => false
	  t.integer :number_cooked, :null => false, :default => 0
    end
  end
end
