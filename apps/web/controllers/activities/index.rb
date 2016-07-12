module Web::Controllers::Activities
  # The list of activities
  class Index
    include Web::Action

    expose :activities

    def call(_)
      @activities = ActivityRepository.newest_to_oldest
    end
  end
end
