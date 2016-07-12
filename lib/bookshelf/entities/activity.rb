class Activity
  include Hanami::Entity

  attributes :timestamp, :action, :old_title, :old_author, :new_title,
             :new_author

  module Action
    CREATE = 'create'.freeze
    UPDATE = 'update'.freeze
    DELETE = 'delete'.freeze
  end
end
