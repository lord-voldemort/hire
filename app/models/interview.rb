class Interview < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :student
  belongs_to :employer
end
