class Discussion < ApplicationRecord
  belongs_to :group
  belongs_to :user

  after_create do |discussion|
    ApiCaller.analyze("Discussion", discussion.id, discussion.comment, discussion.user_id)
  end
end
