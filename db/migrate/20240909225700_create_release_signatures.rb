class CreateReleaseSignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :release_signatures do |t|
      t.references :client
      t.string :e_signature, null: false
      t.date :date, null: false
      t.string :release_version

      t.timestamps
    end
  end
end
