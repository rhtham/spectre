class RemoveRunsSequenceFromSuites < ActiveRecord::Migration[7.0]
  def change
    remove_column :suites, :runs_sequence, :integer
  end
end
