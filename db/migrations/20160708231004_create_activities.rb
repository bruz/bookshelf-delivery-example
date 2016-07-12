Hanami::Model.migration do
  change do
    create_table :activities do
      primary_key :id
      column :timestamp,  Time,     null: false
      column :action,     String,   null: false
      column :old_title,  String
      column :old_author, String
      column :new_title,  String
      column :new_author, String
    end
  end
end
