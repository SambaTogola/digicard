# == Schema Information
#
# Table name: cards
#
#  id            :bigint           not null, primary key
#  portfolio_id  :bigint
#  uid           :string
#  first_name    :string
#  last_name     :string
#  organization  :string
#  work_position :string
#  work_phone    :string
#  private_phone :string
#  mobile_phone  :string
#  work_fax      :string
#  private_fax   :string
#  email         :string
#  website       :string
#  street        :string
#  zipcode       :string
#  city          :string
#  country       :string
#  descrption    :text
#  status        :string
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
