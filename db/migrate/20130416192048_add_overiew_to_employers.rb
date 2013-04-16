class AddOveriewToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :overview, :text
  end
end
