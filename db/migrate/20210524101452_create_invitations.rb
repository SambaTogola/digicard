class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :uid
      t.references :organization, foreign_key: true
      t.references :service, foreign_key: true
      t.string :position
      t.text :description
      t.string :status
      t.references :user, foreign_key: true
      t.references :recipient, index: true

      t.timestamps
    end
  end
end
