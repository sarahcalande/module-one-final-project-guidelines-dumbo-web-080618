class User < ActiveRecord::Base
  has_many :user_selections
  has_many :activities, through: :user_selections
end
