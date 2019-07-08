CarrierWave.configure do |config|
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
  config.root = "#{Dir.pwd}/public" 


  if Rails.env.staging? || Rails.env.production?
    config.fog_provider = 'fog/google' 

    config.fog_credentials = {
      provider: 'Google',
      google_project: 'genuine-ridge-242303',
      google_json_key_string: ENV['GCS_KEY_JSON'],
    }

    config.fog_directory = 'flixter-assaf-rahav'

    config.fog_public = false

    config.fog_attributes = {
      multipart_chunk_size: 2097152, # 2MiB
      write_timeout: 600, # 10 minutes
    }
  else
    config.storage = :file
  end
end