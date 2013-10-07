CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIO2OY7XXJVF2BDQA',                        # required
    :aws_secret_access_key  => '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',
    :region                 => 'us-west-2'                        # required
  }
  config.fog_directory  = 'photofriends'                     # required
end 