class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.references :client
      t.references :hypnotist
      t.string :description
      t.string :ip_address

      t.timestamps
    end
  end
end
