class CreateBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :boxes do |t|
      t.string :rarity
      t.integer :cost

      t.timestamps
    end
  end
end
