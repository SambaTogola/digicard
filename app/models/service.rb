# == Schema Information
#
# Table name: services
#
#  id              :bigint           not null, primary key
#  organization_id :bigint
#  name            :string
#  description     :string
#  status          :string
#  parent_id       :bigint
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Service < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  
end
