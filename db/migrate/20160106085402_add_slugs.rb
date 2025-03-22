class AddSlugs < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :slug, :string
    add_column :suites, :slug, :string
  end
end
