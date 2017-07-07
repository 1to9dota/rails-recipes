CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["251838931@qq.com"]
  config.qiniu_secret_key    = ENV["757757757"]
  config.qiniu_bucket        = ENV["youbao"]
  config.qiniu_bucket_domain = ENV["osqc76q8q.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
