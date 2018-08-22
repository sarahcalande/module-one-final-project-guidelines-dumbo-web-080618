class Activity < ActiveRecord::Base
  has_many :saved_activities
  has_many :users, through: :saved_activities
end
