class AddHighlightColourToTest < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :highlight_colour, :string
  end
end
