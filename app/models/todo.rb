class Todo < ApplicationRecord
  has_many :statuses
  has_many :users, through: :statuses

  def todoadd?(user)
    statuses.where(user: user).any? ? true : false
  end
end
