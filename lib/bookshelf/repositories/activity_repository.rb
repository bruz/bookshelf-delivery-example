class ActivityRepository
  include Hanami::Repository

  def self.newest_to_oldest
    query do
      reverse_order(:timestamp)
    end
  end
end
