class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.float :cost, default: 0.0
      t.timestamps
    end
  end
end
