class AddCropAreaToTest < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :crop_area, :string
  end
end
