class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :genre
      t.string :telephone
      t.date :date_birth
      t.string :occupation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
