class ChangeColumnLastRanAtOnChecks < ActiveRecord::Migration[5.0]
  def change
    change_column_default :checks, :last_ran_at, DateTime.now
  end
end
