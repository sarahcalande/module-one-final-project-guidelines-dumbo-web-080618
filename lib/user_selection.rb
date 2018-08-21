class User_selection < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
end
