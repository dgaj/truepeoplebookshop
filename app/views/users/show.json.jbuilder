json.user do
	json.id @user.id
	json.name @user.name
	json.password_digest @user.password_digest
	json.admin @user.admin
	json.created_at @user.created_at
	json.updated_at @user.updated_at
end