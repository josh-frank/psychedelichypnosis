class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.references :hypnotist, foreign_key: true
      t.references :client, foreign_key: true
      t.integer :value
      t.decimal :paid, precision: 10, scale: 2
      t.date :date

      t.timestamps
    end
  end
end
