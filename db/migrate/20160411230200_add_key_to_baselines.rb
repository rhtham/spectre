class AddKeyToBaselines < ActiveRecord::Migration[7.0]
  def change
    add_column :baselines, :key, :string
  end
end
