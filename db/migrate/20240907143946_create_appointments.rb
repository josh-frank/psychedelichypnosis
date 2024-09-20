class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :hypnotist
      t.references :client
      t.datetime :start
      t.datetime :end
      t.string :location
      t.decimal :lng, precision: 10, scale: 6
      t.decimal :lat, precision: 10, scale: 6
      t.text :notes

      t.timestamps
    end
  end
end
