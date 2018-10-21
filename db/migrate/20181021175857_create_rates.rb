class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.string :startCity
      t.string :endCity
      t.datetime :date
      t.integer :price
      t.string :comment

      t.timestamps
    end
  end
end
