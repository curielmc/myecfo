class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
