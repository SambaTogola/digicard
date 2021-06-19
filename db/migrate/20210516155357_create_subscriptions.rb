class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :uid
      t.references :user, foreign_key: true
      t.references :subscription_pack, foreign_key: true
      t.references :subscription_type, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
