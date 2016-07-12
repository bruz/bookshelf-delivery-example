require 'spec_helper'
require_relative '../../../../apps/web/controllers/activities/index'

describe Web::Controllers::Activities::Index do
  let(:action) { Web::Controllers::Activities::Index.new }
  let(:params) { Hash[] }

  before do
    ActivityRepository.clear

    @activity = ActivityRepository.create(
      Activity.new(
        timestamp: Time.now,
        action: Activity::Action::CREATE,
        new_title: 'TDD',
        new_author: 'Kent Beck'
      )
    )
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all activities' do
    action.call(params)
    action.exposures[:activities].to_a.must_equal [@activity]
  end
end
