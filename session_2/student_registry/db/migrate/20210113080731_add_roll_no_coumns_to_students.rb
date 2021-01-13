class AddRollNoCoumnsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :roll_number, :string
  end
end
