class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :customers, foreign_key: true
      t.date :date
      t.string :reservation_code

      t.timestamps
    end
  end
end
