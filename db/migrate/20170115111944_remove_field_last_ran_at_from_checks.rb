class RemoveFieldLastRanAtFromChecks < ActiveRecord::Migration[5.0]
  def change
    remove_column :checks, :last_ran_at, :datetime
  end
end
