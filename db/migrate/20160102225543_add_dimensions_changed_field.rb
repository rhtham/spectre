class AddDimensionsChangedField < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :dimensions_changed, :boolean
  end
end
