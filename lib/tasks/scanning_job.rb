class ScanningJob
  def perform
    Rails.logger.info "logging from delayed_job"
  end

  def after(job)
    Rails.logger.info "logging from after delayed_job"
  end
end