class AddUrlToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :homepage_url, :string
  end
end
