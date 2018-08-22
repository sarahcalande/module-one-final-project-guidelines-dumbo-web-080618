class User < ActiveRecord::Base
  has_many :saved_activities
  has_many :activities, through: :saved_activities
end
