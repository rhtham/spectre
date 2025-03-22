class RemoveDimensionsChangedFromTests < ActiveRecord::Migration[7.0]
  def change
    remove_column :tests, :dimensions_changed, :boolean
  end
end
