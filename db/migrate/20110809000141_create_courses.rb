class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, :null => false
      t.decimal :price, :precision => 5, :scale => 2, :null => false
	    t.string :image
	    t.references :course_type, :null => false
      
      t.timestamps
    end
  end
end
