class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.references :user, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
