class CreateContacts < ActiveRecord::Migration[8.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :company
      t.string :position
      t.date :birthdate
      t.text :notes
      t.string :avatar

      t.timestamps
    end
  end
end
