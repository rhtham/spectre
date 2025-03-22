class AddTestIdToBaselines < ActiveRecord::Migration[7.0]
  def change
    add_column :baselines, :test_id, :integer
  end
end
