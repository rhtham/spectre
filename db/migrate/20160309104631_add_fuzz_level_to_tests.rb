class AddFuzzLevelToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :fuzz_level, :string
  end
end
