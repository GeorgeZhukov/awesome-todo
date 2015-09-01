Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1014178745290209", "43f8c490be0f0f49cf878016cb675dee", scope: 'email'
end
