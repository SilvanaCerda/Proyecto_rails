class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :Event, null: false, foreign_key: true
      t.string :buyername
      t.string :buyeremail
      t.string :code

      t.timestamps
    end
  end
end
