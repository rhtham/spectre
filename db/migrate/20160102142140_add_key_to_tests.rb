class AddKeyToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :key, :string
  end
end
