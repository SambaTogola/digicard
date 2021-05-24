# == Schema Information
#
# Table name: subscription_packs
#
#  id          :bigint           not null, primary key
#  name        :string
#  price       :decimal(, )
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubscriptionPack < ApplicationRecord
  belongs_to :user

  has_many :subscription_pack_items, dependent: :destroy
  accepts_nested_attributes_for :subscription_pack_items ,  allow_destroy: true , :reject_if => :no_subscription_pack_items


  def no_subscription_pack_items(attributes)
   attributes[:subscription_pack_feature_id].blank?
  end

end
