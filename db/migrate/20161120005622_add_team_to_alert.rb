class AddTeamToAlert < ActiveRecord::Migration[5.0]
  def change
    add_reference :alerts, :team, foreign_key: true
  end
end
