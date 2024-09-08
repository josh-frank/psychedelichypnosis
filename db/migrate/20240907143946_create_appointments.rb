class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :hypnotist, index: true, foreign_key: { to_table: :users }
      t.references :client, index: true, foreign_key: { to_table: :users }
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
