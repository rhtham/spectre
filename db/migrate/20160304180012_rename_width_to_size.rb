class RenameWidthToSize < ActiveRecord::Migration[7.0]
  def change
    rename_column :tests, :width, :size
  end
end
