class CreateStudentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :year
      t.string :address
      t.string :email
      t.string :phone_number
    end
  end
end
