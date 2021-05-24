# == Schema Information
#
# Table name: organizations
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  name                 :string
#  organization_type_id :bigint
#  activity_field_id    :bigint
#  slogan               :string
#  address              :string
#  city                 :string
#  state                :string
#  country              :string
#  phone                :string
#  fax                  :string
#  zip_code             :string
#  web_site             :string
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Organization < ApplicationRecord
  belongs_to :organization_type
end
