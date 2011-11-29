Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '280573415313029', 'cbd6541f25329f011466c4f737af3c1e', {:scope => "email, user_location"}
end