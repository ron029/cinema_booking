# == Schema Information
#
# Table name: seats
#
#  id         :bigint           not null, primary key
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Seat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
