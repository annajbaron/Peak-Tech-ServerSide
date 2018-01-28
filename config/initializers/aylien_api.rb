AylienNewsApi.configure do |config|
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = Rails.application.secrets.aylien_application_id
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = Rails.application.secrets.aylien_application_key
end
