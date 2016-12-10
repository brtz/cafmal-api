class DeleteColumnSupportedTargetsFromAlerters < ActiveRecord::Migration[5.0]
  def change
    remove_column :alerters, :supported_targets, :integer
  end
end
