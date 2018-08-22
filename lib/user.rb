class User < ActiveRecord::Base
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  has_many :saved_activities
  has_many :activities, through: :saved_activities
end
