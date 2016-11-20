class AddTeamToCheck < ActiveRecord::Migration[5.0]
  def change
    add_reference :checks, :team, foreign_key: true
  end
end
