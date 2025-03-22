class AddPassToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :pass, :boolean
  end
end
