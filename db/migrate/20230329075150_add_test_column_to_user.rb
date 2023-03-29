class AddTestColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :test_column, :string
  end
end
