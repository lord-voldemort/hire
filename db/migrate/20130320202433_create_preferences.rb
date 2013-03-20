class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :employer
      t.references :student
      t.string :interest_expressed_by
      t.timestamps
    end
  end
end
