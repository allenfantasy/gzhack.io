class ExportApplicants
  @queue = :sleep

  def self.perform(seconds)
    sleep(seconds)
  end
end
