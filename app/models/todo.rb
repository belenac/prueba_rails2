class Todo < ApplicationRecord
  has_many :statuses
  has_many :users, through: :statuses

  def completed?(user)
    statuses.where(user: user).any? ? true : false
  end
end
