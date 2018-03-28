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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171009040524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_photos", force: :cascade do |t|
    t.string  "photo_id"
    t.string  "album_id"
    t.integer "sort_index",  default: 0,  null: false
    t.jsonb   "description", default: {}, null: false
    t.index ["album_id"], name: "index_album_photos_on_album_id", using: :btree
    t.index ["photo_id"], name: "index_album_photos_on_photo_id", using: :btree
  end

  create_table "albums", id: :string, force: :cascade do |t|
    t.string   "state"
    t.integer  "photos_count",   default: 0,  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "albumable_id"
    t.string   "albumable_type"
    t.text     "tags",           default: [],              array: true
    t.string   "title"
    t.jsonb    "description",    default: {}, null: false
    t.string   "owner_id",                    null: false
    t.string   "owner_type",                  null: false
    t.index ["albumable_id", "albumable_type"], name: "index_albums_on_albumable_id_and_albumable_type", unique: true, using: :btree
    t.index ["id"], name: "index_albums_on_id", using: :btree
    t.index ["owner_id"], name: "index_albums_on_owner_id", using: :btree
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.string   "user_id"
    t.datetime "expires_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["access_token"], name: "index_api_keys_on_access_token", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",                          null: false
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "region"
    t.string   "region_short"
    t.string   "country",                       null: false
    t.string   "country_short",                 null: false
    t.string   "slug",                          null: false
    t.boolean  "promoted",      default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["country"], name: "index_cities_on_country", using: :btree
    t.index ["name", "region", "country"], name: "index_cities_on_name_and_region_and_country", unique: true, using: :btree
    t.index ["region"], name: "index_cities_on_region", using: :btree
    t.index ["slug"], name: "index_cities_on_slug", unique: true, using: :btree
  end

  create_table "conversation_message_receipts", id: :string, force: :cascade do |t|
    t.string   "opened_type"
    t.string   "message_id"
    t.string   "conversation_participant_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["id"], name: "index_conversation_message_receipts_on_id", using: :btree
  end

  create_table "conversation_messages", id: :string, force: :cascade do |t|
    t.string   "conversation_id", null: false
    t.string   "sender_id",       null: false
    t.text     "message"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_conversation_messages_on_conversation_id", using: :btree
    t.index ["id"], name: "index_conversation_messages_on_id", using: :btree
  end

  create_table "conversation_participants", id: :string, force: :cascade do |t|
    t.string   "uuid",             null: false
    t.string   "conversation_id",  null: false
    t.string   "participant_id",   null: false
    t.string   "participant_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["conversation_id"], name: "index_conversation_participants_on_conversation_id", using: :btree
    t.index ["id"], name: "index_conversation_participants_on_id", using: :btree
    t.index ["participant_id"], name: "index_conversation_participants_on_participant_id", using: :btree
    t.index ["uuid"], name: "index_conversation_participants_on_uuid", using: :btree
  end

  create_table "conversations", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_conversations_on_id", using: :btree
  end

  create_table "emails", id: :string, force: :cascade do |t|
    t.string   "email",                                        null: false
    t.string   "state",                default: "unconfirmed"
    t.datetime "last_open_at"
    t.datetime "last_successful_send"
    t.datetime "inactive_at"
    t.string   "user_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["email"], name: "index_emails_on_email", unique: true, using: :btree
    t.index ["id"], name: "index_emails_on_id", using: :btree
  end

  create_table "featured_albums", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "vendor_id",  null: false
    t.index ["id"], name: "index_featured_albums_on_id", using: :btree
  end

  create_table "inspiration_albums", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_inspiration_albums_on_id", using: :btree
  end

  create_table "likes", id: :string, force: :cascade do |t|
    t.string   "liker_id",   null: false
    t.string   "liker_type"
    t.string   "liked_id",   null: false
    t.string   "liked_type"
    t.string   "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_likes_on_id", using: :btree
    t.index ["liked_id"], name: "index_likes_on_liked_id", using: :btree
    t.index ["liker_id", "liked_id"], name: "index_likes_on_liker_id_and_liked_id", using: :btree
    t.index ["liker_id"], name: "index_likes_on_liker_id", using: :btree
  end

  create_table "photos", id: :string, force: :cascade do |t|
    t.jsonb    "images",            default: {},    null: false
    t.string   "primary_album_id"
    t.integer  "city_id"
    t.integer  "height"
    t.integer  "width"
    t.decimal  "aspect_ratio"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "average_color"
    t.string   "device_name"
    t.string   "device_vendor"
    t.string   "exposure_mode"
    t.string   "exposure_time"
    t.string   "f_number"
    t.string   "aperture"
    t.string   "focal_length"
    t.string   "flash"
    t.string   "iso"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "extension"
    t.string   "s3_folder_name"
    t.string   "original_basename"
    t.boolean  "deleted",           default: false
    t.string   "owner_id",                          null: false
    t.string   "owner_type",                        null: false
    t.bigint   "score",             default: 0,     null: false
    t.datetime "published_at"
    t.decimal  "light_value"
    t.string   "device_software"
    t.string   "shutter_speed"
    t.string   "metering_mode"
    t.string   "white_balance"
    t.string   "temp_keywords"
    t.index ["id"], name: "index_photos_on_id", using: :btree
  end

  create_table "tli_assemblies", force: :cascade do |t|
    t.string   "assembly_id",         null: false
    t.string   "assembly_image_type", null: false
    t.string   "md5hash",             null: false
    t.string   "tliable_type"
    t.string   "tliable_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["tliable_type", "tliable_id"], name: "index_tli_assemblies_on_tliable_type_and_tliable_id", using: :btree
  end

  create_table "tokens", id: :string, force: :cascade do |t|
    t.string   "state"
    t.datetime "expires"
    t.boolean  "auth_required",  default: false
    t.string   "action"
    t.jsonb    "data",           default: {}
    t.string   "tokenable_id"
    t.string   "tokenable_type"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["id"], name: "index_tokens_on_id", using: :btree
  end

  create_table "usernames", force: :cascade do |t|
    t.string   "username"
    t.string   "usernameable_type"
    t.string   "usernameable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["username"], name: "index_usernames_on_username", using: :btree
    t.index ["usernameable_type", "usernameable_id"], name: "index_usernames_on_usernameable_type_and_usernameable_id", using: :btree
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string   "state",                        default: "new"
    t.string   "admin",                        default: "false"
    t.string   "first_name"
    t.string   "last_name"
    t.jsonb    "avatars",                      default: {},      null: false
    t.text     "bio"
    t.integer  "birth_day"
    t.integer  "birth_month"
    t.integer  "birth_year"
    t.string   "gender"
    t.string   "facebook_uid"
    t.string   "facebook_token"
    t.datetime "facebook_token_expiry"
    t.integer  "sign_in_count",                default: 0,       null: false
    t.datetime "last_sign_in_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "current_account_id"
    t.jsonb    "covers",                       default: {},      null: false
    t.string   "primary_email_id"
    t.boolean  "send_marketing_notifications", default: true
    t.index ["facebook_uid"], name: "index_users_on_facebook_uid", using: :btree
    t.index ["id"], name: "index_users_on_id", using: :btree
  end

  create_table "vendor_admins", force: :cascade do |t|
    t.string   "vendor_id"
    t.string   "user_id"
    t.string   "level",      default: "super"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["user_id"], name: "index_vendor_admins_on_user_id", using: :btree
    t.index ["vendor_id"], name: "index_vendor_admins_on_vendor_id", using: :btree
  end

  create_table "vendor_bid_line_items", force: :cascade do |t|
    t.string   "vendor_bid_id",                     null: false
    t.integer  "actual_amount_paid",    default: 0
    t.integer  "winning_bid_amount",    default: 0
    t.integer  "premium_auto_city_bid", default: 0
    t.integer  "max_bid",               default: 0
    t.integer  "position"
    t.datetime "date"
    t.index ["vendor_bid_id"], name: "index_vendor_bid_line_items_on_vendor_bid_id", using: :btree
  end

  create_table "vendor_bids", force: :cascade do |t|
    t.string   "vendor_id",                          null: false
    t.integer  "city_id",                            null: false
    t.string   "top_category",                       null: false
    t.string   "sub_categories",        default: [], null: false, array: true
    t.integer  "bid",                   default: 0
    t.integer  "premium_auto_city_bid", default: 0
    t.integer  "score"
    t.string   "ip_address"
    t.string   "user_id"
    t.datetime "effective_date"
    t.datetime "expiration_date"
    t.index ["city_id", "top_category", "vendor_id", "effective_date", "expiration_date"], name: "vendor_bids_index", using: :btree
    t.index ["vendor_id"], name: "index_vendor_bids_on_vendor_id", using: :btree
  end

  create_table "vendor_weddings", force: :cascade do |t|
    t.string "vendor_id"
    t.string "wedding_id"
    t.string "state"
    t.string "category",   null: false
    t.index ["vendor_id"], name: "index_vendor_weddings_on_vendor_id", using: :btree
    t.index ["wedding_id"], name: "index_vendor_weddings_on_wedding_id", using: :btree
  end

  create_table "vendors", id: :string, force: :cascade do |t|
    t.string   "state"
    t.string   "slug"
    t.string   "name"
    t.text     "categories",               default: [],    null: false, array: true
    t.jsonb    "avatars",                  default: {},    null: false
    t.jsonb    "covers",                   default: {},    null: false
    t.text     "short_description"
    t.text     "description"
    t.string   "phone_number"
    t.jsonb    "websites",                 default: {},    null: false
    t.datetime "terms_and_conditions"
    t.string   "terms_and_conditions_ip"
    t.string   "creator_id"
    t.jsonb    "registration_messages",    default: {}
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "city_id"
    t.boolean  "hide_address",             default: false
    t.boolean  "photographer",             default: false
    t.boolean  "registration_complete",    default: false
    t.boolean  "visible",                  default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "stripe_customer_id"
    t.string   "stripe_subscription_id"
    t.datetime "premium_expires"
    t.datetime "last_successful_charge"
    t.datetime "renewal_date"
    t.integer  "credit_limit",             default: 5000,  null: false
    t.integer  "amount_outstanding",       default: 0,     null: false
    t.string   "featured_album_id"
    t.string   "currency"
    t.integer  "premium_cost"
    t.boolean  "was_beta_tester",          default: false
    t.boolean  "was_original_site_member", default: false
    t.boolean  "messaging_enabled",        default: false
    t.string   "invite_email_id"
    t.string   "premium_term_length"
    t.index ["categories"], name: "index_vendors_on_categories", using: :gin
    t.index ["id"], name: "index_vendors_on_id", using: :btree
    t.index ["state"], name: "index_vendors_on_state", using: :btree
  end

  create_table "wedding_album_vendors", force: :cascade do |t|
    t.string "vendor_id"
    t.string "wedding_album_id"
    t.string "sub_category"
    t.index ["vendor_id", "wedding_album_id", "sub_category"], name: "wedding_album_vendors_with_category", using: :btree
    t.index ["vendor_id", "wedding_album_id"], name: "index_wedding_album_vendors_on_vendor_id_and_wedding_album_id", using: :btree
  end

  create_table "wedding_albums", id: :string, force: :cascade do |t|
    t.string   "city_id"
    t.string   "wedding_id"
    t.string   "wedding_type", default: "wedding_day", null: false
    t.datetime "wedding_date"
    t.text     "colors",       default: [],                         array: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "person1_name", default: "",            null: false
    t.string   "person2_name", default: "",            null: false
    t.index ["id"], name: "index_wedding_albums_on_id", using: :btree
  end

  create_table "weddings", id: :string, force: :cascade do |t|
    t.string   "person1_id"
    t.string   "person2_id"
    t.integer  "wedding_day"
    t.integer  "wedding_month"
    t.integer  "wedding_year"
    t.integer  "engagement_day"
    t.integer  "engagement_month"
    t.integer  "engagement_year"
    t.integer  "city_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "albums_count",     default: 0,  null: false
    t.text     "tags",             default: [],              array: true
    t.text     "colors",           default: [],              array: true
    t.index ["id", "person1_id", "person2_id"], name: "index_weddings_on_id_and_person1_id_and_person2_id", unique: true, using: :btree
  end

end
