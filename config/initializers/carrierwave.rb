
CarrierWave.configure do |config| # required
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['AWS_ID'],                        # required
      aws_secret_access_key: ENV['AWS_SECRET'],                        # required
  }
  config.fog_directory  = 'davetoxabest'                                   # required
end