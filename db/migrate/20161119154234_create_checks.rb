class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.integer :category
      t.string :name
      t.string :condition_query
      t.integer :condition_operand
      t.integer :condition_aggegrator
      t.integer :severity
      t.integer :interval
      t.boolean :is_locked
      t.datetime :last_ran_at

      t.timestamps
    end
  end
end
