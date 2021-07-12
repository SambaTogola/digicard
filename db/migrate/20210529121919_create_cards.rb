class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :portfolio, foreign_key: true
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.string :work_position
      t.string :work_phone
      t.string :private_phone
      t.string :mobile_phone
      t.string :work_fax
      t.string :private_fax
      t.string :email
      t.string :address
      t.string :website
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :country
      t.text :descrption
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
