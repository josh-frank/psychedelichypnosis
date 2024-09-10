class CreateReleaseSignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :release_signatures do |t|
      t.references :user, foreign_key: true
      t.string :e_signature, null: false
      t.date :date, null: false
      t.string :release_version

      t.timestamps
    end
  end
end
