class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :invitation, foreign_key: true
      t.references :organization, foreign_key: true
      t.references :service, foreign_key: true
      t.string :position
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
