class AddColumnMetricToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :metric, :string
  end
end
