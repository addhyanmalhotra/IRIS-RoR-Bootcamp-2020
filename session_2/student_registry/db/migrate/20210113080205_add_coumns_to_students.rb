class AddCoumnsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :name, :string
    add_column :students, :branch, :string
    add_column :students, :cgpa, :decimal
    add_column :students, :address, :text
    add_column :students, :admission_year, :int
  end
end
