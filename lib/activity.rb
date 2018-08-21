class Activity < ActiveRecord::Base
  has_many :user_selections
  has_many :users, through: :user_selections
end
