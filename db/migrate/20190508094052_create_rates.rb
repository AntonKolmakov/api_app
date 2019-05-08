class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :value
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
