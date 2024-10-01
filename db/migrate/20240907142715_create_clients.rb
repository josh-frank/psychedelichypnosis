class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.boolean :sms_consent

      t.timestamps
    end
  end
end
