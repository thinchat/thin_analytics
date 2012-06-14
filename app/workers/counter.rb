class Counter
  @queue = :analytics

  def self.perform(message)
    data = JSON.parse(message)
    puts data.inspect
  end
end
