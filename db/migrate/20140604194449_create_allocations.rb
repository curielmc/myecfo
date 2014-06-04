class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :year
      t.decimal :bills
      t.string :type_investments

      t.timestamps
    end
  end
end
