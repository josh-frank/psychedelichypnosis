class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :hypnotist
      t.references :client
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
