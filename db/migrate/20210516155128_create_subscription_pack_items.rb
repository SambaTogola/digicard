class CreateSubscriptionPackItems < ActiveRecord::Migration[5.2]
  def change
    create_table :subscription_pack_items do |t|
      t.references :subscription_pack, foreign_key: true
      t.references :subscription_pack_feature, foreign_key: true
      t.string :quantity
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
