class AddColumnsToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :number_of_employees, :text
    add_column :employers, :category_code, :text
    add_column :employers, :description, :text
    add_column :employers, :funding, :text
    change_column :employers, :industry, :text
    change_column :employers, :location, :text

  end
end
