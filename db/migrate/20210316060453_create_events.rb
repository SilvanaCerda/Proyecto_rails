class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :Client, null: false, foreign_key: true
      t.string :eventname
      t.text :description
      t.string :img
      t.string :slug
      t.datetime :startdate
      t.datetime :publishdate
      t.string :status
      t.integer :quantytickets
      t.integer :price

      t.timestamps
    end
  end
end
