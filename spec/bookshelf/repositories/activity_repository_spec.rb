require 'spec_helper'

describe ActivityRepository do
  def create_activity(timestamp)
    ActivityRepository.create(
      Activity.new(
        timestamp: timestamp,
        action: Activity::Action::CREATE
      )
    )
  end

  before do
    ActivityRepository.clear

    @activity_1 = create_activity(Time.now - 1)
    @activity_2 = create_activity(Time.now)
  end

  describe '#newest_to_oldest' do
    it 'provides the activities in the correct order' do
      result = ActivityRepository.newest_to_oldest
      result.to_a.must_equal [@activity_2, @activity_1]
    end
  end
end
