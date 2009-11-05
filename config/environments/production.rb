Merb.logger.info("Loaded PRODUCTION Environment...")
Merb::Config.use { |c|
  c[:exception_details] = false
  c[:reload_classes] = false
  c[:log_level] = :error
  
  c[:log_file]  = Merb.root / "log" / "production.log"
  
  c[:path_prefix] = '/facets'
  c[:compress_assets] = true
  #c[:disable_rack_assets] = true
  
  # or redirect logger using IO handle
  # c[:log_stream] = STDOUT
}
