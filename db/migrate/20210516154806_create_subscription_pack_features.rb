class CreateSubscriptionPackFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :subscription_pack_features do |t|
      t.string :name
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
