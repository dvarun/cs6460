json.extract! discussion, :id, :user_id, :group_id, :comment, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
