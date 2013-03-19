class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :preferred_industry
      t.string :preferred_location

      t.timestamps
    end
  end
end
