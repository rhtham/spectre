class RemovePlatform < ActiveRecord::Migration[7.0]
  def change
    remove_column :tests, :platform, :string
    remove_column :baselines, :platform, :string
  end
end
