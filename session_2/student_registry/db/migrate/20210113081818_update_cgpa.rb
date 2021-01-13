class UpdateCgpa < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :cgpa
    add_column :students, :cgpa, :decimal,precision:4,  scale: 2
  end
end
