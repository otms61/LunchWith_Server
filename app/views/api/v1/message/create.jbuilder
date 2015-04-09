json.name @user.name
json.is_me @user.id == @message.user_id
json.sequential_id @message.sequential_id
json.message @message.message
json.time @message.created_at.to_i