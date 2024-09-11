class CreateHypnotists < ActiveRecord::Migration[5.2]
  def change
    create_table :hypnotists do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
