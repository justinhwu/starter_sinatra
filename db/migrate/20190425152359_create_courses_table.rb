class CreateCoursesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string  :name
      t.string  :subject
      t.integer :course_number
      t.string  :description
      t.integer :instructor_id
    end
  end
end
