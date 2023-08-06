# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cinema_id  :bigint           not null
#
# Indexes
#
#  index_movies_on_cinema_id  (cinema_id)
#
# Foreign Keys
#
#  fk_rails_...  (cinema_id => cinemas.id)
#
require 'rails_helper'

RSpec.describe Movie, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
