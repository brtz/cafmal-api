class ChangeColumnMessageFromStringToTextOnEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :message, :text
  end
end
