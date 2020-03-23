class CreateBoxCards < ActiveRecord::Migration[6.0]
  def change
    create_table :box_cards do |t|
      t.integer :card_id
      t.integer :box_id

      t.timestamps
    end
  end
end
