Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, 'NTIVVnCVGaHGbBuucuOzA', 'cWwS6xUhOVINd7Ch1Qu0Wl5l9cXygB92PcsCLwCA'
  provider :google_oauth2, '384707867200.apps.googleusercontent.com', '9BI9tuDj0yyrqL9znNil0_1c'
  
end