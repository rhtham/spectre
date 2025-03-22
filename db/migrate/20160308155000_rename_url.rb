class RenameUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :tests, :url, :source_url
  end
end
