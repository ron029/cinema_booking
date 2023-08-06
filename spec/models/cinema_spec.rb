# == Schema Information
#
# Table name: cinemas
#
#  id           :bigint           not null, primary key
#  availability :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Cinema, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
