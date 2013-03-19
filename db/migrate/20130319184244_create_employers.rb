class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :industry
      t.string :location
      t.string :est_year

      t.timestamps
    end
  end
end
