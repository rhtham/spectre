class AddUrlToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :url, :string
  end
end
