# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130305101231) do

  create_table "activities", :force => true do |t|
    t.integer  "activity_verb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "author_id"
    t.integer  "user_author_id"
    t.integer  "owner_id"
  end

  add_index "activities", ["activity_verb_id"], :name => "index_activities_on_activity_verb_id"
  add_index "activities", ["author_id"], :name => "index_activities_on_author_id"
  add_index "activities", ["owner_id"], :name => "index_activities_on_owner_id"
  add_index "activities", ["user_author_id"], :name => "index_activities_on_user_author_id"

  create_table "activity_actions", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "activity_object_id"
    t.boolean  "follow",             :default => false
    t.boolean  "author",             :default => false
    t.boolean  "user_author",        :default => false
    t.boolean  "owner",              :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "activity_actions", ["activity_object_id"], :name => "index_activity_actions_on_activity_object_id"
  add_index "activity_actions", ["actor_id"], :name => "index_activity_actions_on_actor_id"

  create_table "activity_object_activities", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "object_type"
  end

  add_index "activity_object_activities", ["activity_id"], :name => "index_activity_object_activities_on_activity_id"
  add_index "activity_object_activities", ["activity_object_id"], :name => "index_activity_object_activities_on_activity_object_id"

  create_table "activity_object_audiences", :force => true do |t|
    t.integer  "activity_object_id"
    t.integer  "relation_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "activity_object_audiences", ["activity_object_id"], :name => "activity_object_audiences_on_activity_object_id"
  add_index "activity_object_audiences", ["relation_id"], :name => "activity_object_audiences_on_relation_id"

  create_table "activity_object_properties", :force => true do |t|
    t.integer "activity_object_id"
    t.integer "property_id"
    t.string  "type"
    t.boolean "main"
  end

  add_index "activity_object_properties", ["activity_object_id"], :name => "index_activity_object_properties_on_activity_object_id"
  add_index "activity_object_properties", ["property_id"], :name => "index_activity_object_properties_on_property_id"

  create_table "activity_objects", :force => true do |t|
    t.string   "title",                        :default => ""
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "object_type",    :limit => 45
    t.integer  "like_count",                   :default => 0
    t.integer  "follower_count",               :default => 0
    t.integer  "visit_count",                  :default => 0
    t.integer  "comment_count",                :default => 0
  end

  create_table "activity_verbs", :force => true do |t|
    t.string   "name",       :limit => 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actors", :force => true do |t|
    t.string   "name"
    t.string   "email",              :default => "",   :null => false
    t.string   "slug"
    t.string   "subject_type"
    t.boolean  "notify_by_email",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_object_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "actors", ["activity_object_id"], :name => "index_actors_on_activity_object_id"
  add_index "actors", ["email"], :name => "index_actors_on_email"
  add_index "actors", ["slug"], :name => "index_actors_on_slug", :unique => true

  create_table "addresses", :force => true do |t|
    t.string   "formatted"
    t.string   "streetAddress"
    t.string   "locality"
    t.string   "region"
    t.string   "postalCode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["streetAddress", "locality"], :name => "index_addresses_on_streetAddress_and_locality"

  create_table "audiences", :force => true do |t|
    t.integer "relation_id"
    t.integer "activity_id"
  end

  add_index "audiences", ["activity_id"], :name => "index_audiences_on_activity_id"
  add_index "audiences", ["relation_id"], :name => "index_audiences_on_relation_id"

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["activity_object_id"], :name => "index_comments_on_activity_object_id"

  create_table "contacts", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inverse_id"
    t.integer  "ties_count",  :default => 0
  end

  add_index "contacts", ["inverse_id"], :name => "index_contacts_on_inverse_id"
  add_index "contacts", ["receiver_id"], :name => "index_contacts_on_receiver_id"
  add_index "contacts", ["sender_id"], :name => "index_contacts_on_sender_id"

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "diaries", :force => true do |t|
    t.integer  "activity_object_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "diaries", ["activity_object_id"], :name => "index_diaries_on_activity_object_id"

  create_table "documents", :force => true do |t|
    t.string   "type"
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.string   "file_file_size"
    t.boolean  "file_processing"
  end

  add_index "documents", ["activity_object_id"], :name => "index_documents_on_activity_object_id"

  create_table "geotags", :force => true do |t|
    t.integer  "activity_object_id"
    t.integer  "address_id"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "altitude"
    t.float    "heading"
    t.float    "tilt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "geotags", ["latitude", "longitude"], :name => "index_geotags_on_latitude_and_longitude"

  create_table "groups", :force => true do |t|
    t.integer  "actor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["actor_id"], :name => "index_groups_on_actor_id"

  create_table "guides", :force => true do |t|
    t.integer  "activity_object_id"
    t.integer  "trip_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "guides", ["activity_object_id"], :name => "index_guides_on_activity_object_id"
  add_index "guides", ["trip_id"], :name => "index_guides_on_trip_id"

  create_table "guides_places", :id => false, :force => true do |t|
    t.integer "guide_id", :null => false
    t.integer "place_id", :null => false
  end

  add_index "guides_places", ["guide_id", "place_id"], :name => "index_guides_places_on_guide_id_and_place_id", :unique => true

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              :default => ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                :default => false
    t.datetime "updated_at",                              :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
  end

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"

  create_table "permissions", :force => true do |t|
    t.string   "action"
    t.string   "object"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.integer  "activity_object_id"
    t.string   "url"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["activity_object_id"], :name => "index_places_on_activity_object_id"

  create_table "places_routes", :id => false, :force => true do |t|
    t.integer "place_id", :null => false
    t.integer "route_id", :null => false
  end

  add_index "places_routes", ["place_id", "route_id"], :name => "index_places_routes_on_place_id_and_route_id", :unique => true

  create_table "places_trips", :id => false, :force => true do |t|
    t.integer "place_id", :null => false
    t.integer "trip_id",  :null => false
  end

  add_index "places_trips", ["place_id", "trip_id"], :name => "index_places_trips_on_place_id_and_trip_id", :unique => true

  create_table "plannings", :force => true do |t|
    t.integer  "activity_object_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "duration"
    t.text     "items"
    t.text     "days"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "plannings", ["activity_object_id"], :name => "index_plannings_on_activity_object_id"

  create_table "posts", :force => true do |t|
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["activity_object_id"], :name => "index_posts_on_activity_object_id"

  create_table "profiles", :force => true do |t|
    t.integer  "actor_id"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organization", :limit => 45
    t.string   "phone",        :limit => 45
    t.string   "mobile",       :limit => 45
    t.string   "fax",          :limit => 45
    t.string   "address"
    t.string   "city"
    t.string   "zipcode",      :limit => 45
    t.string   "province",     :limit => 45
    t.string   "country",      :limit => 45
    t.integer  "prefix_key"
    t.string   "description"
    t.string   "experience"
    t.string   "website"
    t.string   "skype",        :limit => 45
    t.string   "im",           :limit => 45
  end

  add_index "profiles", ["actor_id"], :name => "index_profiles_on_actor_id"

  create_table "receipts", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                                  :null => false
    t.boolean  "is_read",                          :default => false
    t.boolean  "trashed",                       :default => false
    t.boolean  "deleted",                       :default => false
    t.string   "mailbox_type",    :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"

  create_table "relation_permissions", :force => true do |t|
    t.integer  "relation_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relation_permissions", ["permission_id"], :name => "index_relation_permissions_on_permission_id"
  add_index "relation_permissions", ["relation_id"], :name => "index_relation_permissions_on_relation_id"

  create_table "relations", :force => true do |t|
    t.integer  "actor_id"
    t.string   "type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sender_type"
    t.string   "receiver_type"
    t.string   "ancestry"
  end

  add_index "relations", ["actor_id"], :name => "index_relations_on_actor_id"
  add_index "relations", ["ancestry"], :name => "index_relations_on_ancestry"

  create_table "routes", :force => true do |t|
    t.integer  "activity_object_id"
    t.integer  "trip_id"
    t.integer  "guide_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "routes", ["activity_object_id"], :name => "index_routes_on_activity_object_id"
  add_index "routes", ["guide_id"], :name => "index_routes_on_guide_id"
  add_index "routes", ["trip_id"], :name => "index_routes_on_trip_id"

  create_table "sites", :force => true do |t|
    t.string   "type"
    t.integer  "actor_id"
    t.text     "config"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sites", ["actor_id"], :name => "index_sites_on_actor_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "ties", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "relation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ties", ["contact_id"], :name => "index_ties_on_contact_id"
  add_index "ties", ["relation_id"], :name => "index_ties_on_relation_id"

  create_table "trips", :force => true do |t|
    t.integer  "activity_object_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "trips", ["activity_object_id"], :name => "index_trips_on_activity_object_id"

  create_table "users", :force => true do |t|
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "password_salt"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.integer  "actor_id"
    t.string   "language"
  end

  add_index "users", ["actor_id"], :name => "index_users_on_actor_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "activities", "activity_verbs", :name => "index_activities_on_activity_verb_id"
  add_foreign_key "activities", "actors", :name => "index_activities_on_author_id", :column => "author_id"
  add_foreign_key "activities", "actors", :name => "index_activities_on_owner_id", :column => "owner_id"
  add_foreign_key "activities", "actors", :name => "index_activities_on_user_author_id", :column => "user_author_id"

  add_foreign_key "activity_actions", "activity_objects", :name => "index_activity_actions_on_activity_object_id"
  add_foreign_key "activity_actions", "actors", :name => "index_activity_actions_on_actor_id"

  add_foreign_key "activity_object_activities", "activities", :name => "index_activity_object_activities_on_activity_id"
  add_foreign_key "activity_object_activities", "activity_objects", :name => "activity_object_activities_on_activity_object_id"

  add_foreign_key "activity_object_audiences", "activity_objects", :name => "activity_object_audiences_on_activity_object_id"
  add_foreign_key "activity_object_audiences", "relations", :name => "activity_object_audiences_on_relation_id"

  add_foreign_key "activity_object_properties", "activity_objects", :name => "index_activity_object_properties_on_activity_object_id"
  add_foreign_key "activity_object_properties", "activity_objects", :name => "index_activity_object_properties_on_property_id", :column => "property_id"

  add_foreign_key "actors", "activity_objects", :name => "actors_on_activity_object_id"

  add_foreign_key "audiences", "activities", :name => "audiences_on_activity_id"
  add_foreign_key "audiences", "relations", :name => "audiences_on_relation_id"

  add_foreign_key "authentications", "users", :name => "authentications_on_user_id"

  add_foreign_key "comments", "activity_objects", :name => "comments_on_activity_object_id"

  add_foreign_key "contacts", "actors", :name => "contacts_on_receiver_id", :column => "receiver_id"
  add_foreign_key "contacts", "actors", :name => "contacts_on_sender_id", :column => "sender_id"

  add_foreign_key "documents", "activity_objects", :name => "documents_on_activity_object_id"

  add_foreign_key "groups", "actors", :name => "groups_on_actor_id"

  add_foreign_key "notifications", "conversations", :name => "notifications_on_conversation_id"

  add_foreign_key "posts", "activity_objects", :name => "posts_on_activity_object_id"

  add_foreign_key "profiles", "actors", :name => "profiles_on_actor_id"

  add_foreign_key "receipts", "notifications", :name => "receipts_on_notification_id"

  add_foreign_key "relation_permissions", "permissions", :name => "relation_permissions_on_permission_id"
  add_foreign_key "relation_permissions", "relations", :name => "relation_permissions_on_relation_id"

  add_foreign_key "relations", "actors", :name => "relations_on_actor_id"

  add_foreign_key "sites", "actors", :name => "index_sites_on_actor_id"

  add_foreign_key "ties", "contacts", :name => "ties_on_contact_id"
  add_foreign_key "ties", "relations", :name => "ties_on_relation_id"

  add_foreign_key "users", "actors", :name => "users_on_actor_id"

end
