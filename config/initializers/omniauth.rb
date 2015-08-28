Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1601374403456744", "94e5b100e5aee5b1ae9dc69bdcf3fadf", scope: 'email'
end
