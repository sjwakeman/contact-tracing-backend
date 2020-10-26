class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :date
      t.string :location
      t.string :occurrence
      t.references :individual, null: false, foreign_key: true

      t.timestamps
      t.string :category
    end
  end
end
