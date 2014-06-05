class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :year
      t.decimal :bills, precision: 8, scale: 2
      t.string :type_investments

      t.timestamps
    end
  end
end
