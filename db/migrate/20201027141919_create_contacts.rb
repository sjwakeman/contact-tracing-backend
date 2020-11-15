class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :date
      t.string :category
      t.string :location
      t.string :occurrence
      t.belongs_to :individual, null: false, foreign_key: true
      t.string :individual_name
      # t.belongs_to :individual, foreign_key: true # removed null: false BUT NEED IT
      t.timestamps
    end
  end
end
