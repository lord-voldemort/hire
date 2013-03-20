class Preference < ActiveRecord::Base
  attr_accessible :interest_expressed_by
  belongs_to :student
  belongs_to :employer
end
