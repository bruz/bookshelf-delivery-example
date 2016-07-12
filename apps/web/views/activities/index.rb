module Web::Views::Activities
  class Index
    include Web::View

    def format_time(time)
      time.strftime('%Y-%m-%d %k:%M:%S')
    end

    def description(activity)
      case activity.action
      when Activity::Action::CREATE
        create_description(activity)
      when Activity::Action::UPDATE
        update_description(activity)
      when Activity::Action::DELETE
        delete_description(activity)
      else
        raise "Unrecognized action: #{activity.action}"
      end
    end

    private

    def create_description(activity)
      "Added #{activity.new_title} (#{activity.new_author})"
    end

    def update_description(activity)
      old_book = "#{activity.old_title} (#{activity.old_author})"
      new_book = "#{activity.new_title} (#{activity.new_author})"
      "Updated from #{old_book} to #{new_book}"
    end

    def delete_description(activity)
      "Deleted #{activity.old_title} (#{activity.old_author})"
    end
  end
end
