class RemoveBaselineFromTests < ActiveRecord::Migration[7.0]
  def change
    remove_column :tests, :baseline, :boolean
  end
end
