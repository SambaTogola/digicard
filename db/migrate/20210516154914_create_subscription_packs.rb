class CreateSubscriptionPacks < ActiveRecord::Migration[5.2]
  def change
    create_table :subscription_packs do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
