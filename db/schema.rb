# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_29_075150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ach_files", force: :cascade do |t|
    t.integer "file_id"
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ach_gateways", force: :cascade do |t|
    t.string "bank_name"
    t.string "descriptor"
    t.integer "status", default: 0
    t.boolean "archive", default: false
    t.float "bank_fee_percent", default: 0.0
    t.float "bank_fee_dollar", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "export_col"
    t.integer "gateway_type"
    t.float "transaction_limit", default: 0.0
    t.string "ach_type"
  end

  create_table "activity_logs", force: :cascade do |t|
    t.integer "user_id"
    t.string "ip_address"
    t.string "action"
    t.jsonb "params"
    t.string "controller"
    t.text "note"
    t.jsonb "respond_with"
    t.string "browser"
    t.string "host"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "response_status"
    t.integer "activity_type"
    t.integer "transaction_id"
    t.json "cultivate_response"
    t.integer "tango_order_id"
    t.string "ref_id"
    t.string "action_type"
    t.index ["action"], name: "index_activity_logs_on_action"
    t.index ["activity_type"], name: "index_activity_logs_on_activity_type"
    t.index ["created_at"], name: "index_activity_logs_on_created_at"
    t.index ["ref_id"], name: "index_activity_logs_on_ref_id"
    t.index ["transaction_id"], name: "index_activity_logs_on_transaction_id"
    t.index ["user_id", "created_at"], name: "index_activity_logs_on_user_id_and_created_at"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.string "name"
    t.string "email"
    t.string "country"
    t.string "address_type"
    t.string "phone_number"
    t.string "whom"
    t.integer "tracker_id"
    t.string "company"
    t.string "address_code"
    t.string "first_name"
    t.string "last_name"
    t.integer "request_id"
    t.string "suit"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "ahoy_messages", force: :cascade do |t|
    t.string "user_type"
    t.bigint "user_id"
    t.text "to"
    t.string "mailer"
    t.text "subject"
    t.datetime "sent_at"
    t.string "message_id"
    t.integer "email_notification_id"
    t.string "status"
    t.string "user_name"
    t.index ["user_type", "user_id"], name: "index_ahoy_messages_on_user_type_and_user_id"
  end

  create_table "app_configs", force: :cascade do |t|
    t.string "key", null: false
    t.string "stringValue"
    t.boolean "boolValue", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "merchant_fee"
    t.float "user_fee"
    t.float "atm_fee"
    t.string "secondary_option"
    t.string "client_id", default: ""
    t.string "client_secret", default: ""
    t.jsonb "slot_detail"
  end

  create_table "assets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
    t.string "name"
    t.string "version", default: "1.0.0"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["auditable_id", "auditable_type"], name: "index_audits_on_auditable_id_and_auditable_type"
    t.index ["created_at"], name: "index_audits_on_created_at"
  end

  create_table "baked_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "location_id"
    t.integer "wallet_id"
    t.string "split_type"
    t.string "position"
    t.boolean "gbox"
    t.boolean "iso_on_file"
    t.boolean "attach"
    t.float "dollar"
    t.float "percent"
    t.string "user_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "active"
  end

  create_table "bank_details", force: :cascade do |t|
    t.string "bank_name"
    t.string "account_name"
    t.string "account_no"
    t.string "routing_no"
    t.string "account_digit"
    t.string "routing_digit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.string "bank_account_type"
    t.integer "user_id"
    t.boolean "for_charge", default: false
  end

  create_table "batches", force: :cascade do |t|
    t.date "close_date"
    t.time "close_time"
    t.integer "total_transactions"
    t.float "total_sales"
    t.boolean "is_closed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "wallet_id"
    t.integer "batch_type"
    t.integer "days", default: 0
    t.integer "current_tier", default: 1
    t.bigint "location_id"
    t.float "total_fee", default: 0.0
    t.integer "batch_risk"
    t.integer "iso_id"
    t.float "iso_profit", default: 0.0
    t.float "agent_profit", default: 0.0
    t.float "affiliate_profit", default: 0.0
    t.float "total_bonus", default: 0.0
    t.jsonb "batch_detail"
    t.index ["location_id"], name: "index_batches_on_location_id"
    t.index ["user_id"], name: "index_batches_on_user_id"
    t.index ["wallet_id"], name: "index_batches_on_wallet_id"
  end

  create_table "block_transactions", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "sender_wallet_id"
    t.bigint "receiver_wallet_id"
    t.integer "amount_in_cents"
    t.integer "fee_in_cents"
    t.integer "action"
    t.string "main_type"
    t.string "sub_type"
    t.string "gateway"
    t.integer "tip_cents"
    t.integer "hold_money_cents"
    t.string "seq_parent_id"
    t.jsonb "tags"
    t.string "sequence_id", null: false
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip"
    t.string "last4"
    t.string "card_id"
    t.string "charge_id"
    t.integer "status"
    t.string "api_type"
    t.integer "parent_id"
    t.string "card_brand"
    t.string "card_type"
    t.float "iso_fee", default: 0.0
    t.float "agent_fee", default: 0.0
    t.float "affiliate_fee", default: 0.0
    t.float "partner_fee", default: 0.0
    t.float "gbox_fee", default: 0.0
    t.float "tx_amount", default: 0.0
    t.float "net_fee", default: 0.0
    t.float "total_net", default: 0.0
    t.float "privacy_fee", default: 0.0
    t.string "first6"
    t.string "tx_type"
    t.string "tx_sub_type"
    t.string "position"
    t.string "new_type"
    t.boolean "refunded"
    t.jsonb "refund_reason"
    t.jsonb "refund_log"
    t.string "source_name"
    t.string "destination_name"
    t.string "merchant_name"
    t.string "location_dba_name"
    t.string "seq_block_id"
    t.string "sender_name"
    t.string "receiver_name"
    t.integer "category_id"
    t.integer "payment_gateway_id"
    t.integer "location_id"
    t.float "main_amount"
    t.float "transaction_fee", default: 0.0
    t.float "per_transaction_fee", default: 0.0
    t.string "terminal_id"
    t.string "ref_id"
    t.string "clerk_id"
    t.integer "iso_id"
    t.integer "agent_id"
    t.integer "affiliate_id"
    t.integer "transaction_id"
    t.string "block_version", default: "2"
    t.integer "load_balancer_id"
    t.string "baked"
    t.string "quickcard_id"
    t.integer "tango_order_id"
    t.index ["amount_in_cents"], name: "index_block_transactions_on_amount_in_cents"
    t.index ["main_type"], name: "index_block_transactions_on_main_type"
    t.index ["quickcard_id"], name: "index_block_transactions_on_quickcard_id", unique: true
    t.index ["receiver_id"], name: "index_block_transactions_on_receiver_id"
    t.index ["receiver_wallet_id"], name: "index_block_transactions_on_receiver_wallet_id"
    t.index ["sender_id"], name: "index_block_transactions_on_sender_id"
    t.index ["sender_wallet_id"], name: "index_block_transactions_on_sender_wallet_id"
    t.index ["seq_parent_id"], name: "index_block_transactions_on_seq_parent_id"
    t.index ["sequence_id"], name: "sequence_id", unique: true
    t.index ["tx_type", "tx_sub_type"], name: "index_block_transactions_on_tx_type_and_tx_sub_type"
  end

  create_table "bulk_ach_instances", force: :cascade do |t|
    t.string "bulk_type"
    t.integer "wallet"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_amount"
    t.float "fee", default: 0.0
    t.boolean "aches_processed", default: false
    t.boolean "start_process", default: false
    t.integer "total_ach"
    t.integer "total_processed"
    t.string "location"
    t.boolean "approve", default: true
    t.string "status"
    t.integer "approved_by_user_id"
    t.integer "total_recurring", default: 0
    t.date "nearest_schedule_date"
    t.float "fee_perc", default: 0.0
    t.float "dollar_fee", default: 0.0
    t.text "decline_reason"
  end

  create_table "bulk_aches", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "routing_number"
    t.string "account_number"
    t.string "confirm_account"
    t.float "amount"
    t.string "status", default: "Ready"
    t.text "response_message"
    t.boolean "is_processed"
    t.bigint "bulk_ach_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tango_order_id"
    t.boolean "sent", default: false
    t.float "fee", default: 0.0
    t.integer "payment_qty"
    t.datetime "payment_day"
    t.boolean "recurring"
    t.integer "day_number"
    t.string "notes"
  end

  create_table "bulk_check_instances", force: :cascade do |t|
    t.string "bulk_type"
    t.integer "wallet"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_amount"
    t.float "fee", default: 0.0
    t.boolean "checks_processed", default: false
    t.boolean "start_process", default: false
    t.index ["user_id"], name: "index_bulk_check_instances_on_user_id"
  end

  create_table "bulk_checks", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "routing_number"
    t.string "account_number"
    t.string "confirm_account"
    t.float "amount"
    t.string "status", default: "Ready"
    t.text "response_message"
    t.boolean "is_processed"
    t.bigint "bulk_check_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tango_order_id"
    t.boolean "sent", default: false
    t.index ["bulk_check_instance_id"], name: "index_bulk_checks_on_bulk_check_instance_id"
    t.index ["tango_order_id"], name: "index_bulk_checks_on_tango_order_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.string "last4"
    t.string "customer"
    t.string "name"
    t.string "stripe"
    t.string "elavon"
    t.string "payeezy"
    t.string "exp_date"
    t.string "bridge_pay"
    t.string "card_type"
    t.string "fluid_pay", default: ""
    t.boolean "archived", default: false
    t.string "stripe2"
    t.integer "first6"
    t.string "stripe3"
    t.string "qc_token"
    t.string "fingerprint"
    t.string "flag", default: "straight"
    t.integer "decline_attempts"
    t.datetime "last_decline"
    t.integer "merchant_id"
    t.string "bolt_token"
    t.boolean "instant_pay", default: false
    t.string "bank"
    t.string "bolt_bank"
    t.boolean "is_blocked", default: false
    t.boolean "is_vip", default: false
    t.jsonb "transaction_attempts"
    t.jsonb "group_transaction_attempts"
    t.jsonb "decline_transaction_attempts"
    t.boolean "blocked_by_load_balancer", default: false
    t.datetime "blocked_till"
    t.string "error_code"
    t.jsonb "cc_number_transaction_attempts"
    t.jsonb "country"
    t.index ["fingerprint", "merchant_id"], name: "index_cards_on_fingerprint_and_merchant_id"
    t.index ["first6", "last4"], name: "index_cards_on_first6_and_last4"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checks", force: :cascade do |t|
    t.text "description"
    t.float "amount"
    t.string "direction"
    t.string "checkId"
    t.string "status"
    t.string "recipient"
    t.string "sender"
    t.string "name"
    t.integer "number"
    t.string "image_uri"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wallet_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_comments_on_ticket_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived", default: false
    t.string "company_email"
    t.string "slug"
    t.string "ledger"
    t.string "ref_no"
    t.string "years_in_business"
    t.string "tax_id"
    t.string "access_token"
    t.datetime "token_last_used_at"
    t.index ["slug"], name: "index_companies_on_slug", unique: true
  end

  create_table "company_locations", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "company_id"
    t.string "status"
    t.string "company_name"
    t.string "location_name"
    t.datetime "request_date"
    t.integer "revoker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_locations_on_company_id"
    t.index ["location_id"], name: "index_company_locations_on_location_id"
  end

  create_table "config_log_details", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "config_log_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.index ["config_log_id"], name: "index_config_log_details_on_config_log_id"
    t.index ["user_id"], name: "index_config_log_details_on_user_id"
  end

  create_table "config_logs", force: :cascade do |t|
    t.integer "user_id"
    t.string "to"
    t.string "from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_merchants"
    t.integer "location_id"
  end

  create_table "cron_jobs", force: :cascade do |t|
    t.string "name"
    t.jsonb "description"
    t.integer "log_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "result"
    t.boolean "success"
    t.string "status"
    t.boolean "email", default: false
  end

  create_table "customer_disputes", force: :cascade do |t|
    t.integer "transaction_id"
    t.string "dispute_type"
    t.text "reason"
    t.string "status"
    t.text "description"
    t.float "amount"
    t.integer "merchant_id"
    t.integer "customer_id"
    t.datetime "close_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.float "refund_amount"
    t.string "reason_detail"
  end

  create_table "customer_merchants", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "merchant_id"
    t.integer "location_id"
    t.integer "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_processing_volumes", force: :cascade do |t|
    t.integer "location_id"
    t.integer "payment_gateway_id"
    t.float "daily_volume"
    t.jsonb "visa_credit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "visa_debit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "mastercard_credit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "mastercard_debit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "amex_credit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "amex_debit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "discover_credit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "discover_debit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "manual_refund", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "other_cards", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "descriptors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.float "daily_limit", default: 0.0
    t.float "monthly_limit", default: 0.0
    t.float "cbk_limit", default: 0.0
  end

  create_table "dispute_cases", force: :cascade do |t|
    t.string "case_number"
    t.bigint "user_id"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "recieved_date"
    t.datetime "due_date"
    t.float "amount", default: 0.0
    t.string "card_type", default: ""
    t.bigint "reason_id"
    t.integer "merchant_wallet_id"
    t.integer "user_wallet_id"
    t.string "card_number", default: ""
    t.integer "status", default: 0
    t.integer "dispute_type", default: 0
    t.boolean "charge_fee", default: true
    t.integer "payment_gateway_id"
    t.integer "chargeback_transaction_id"
    t.date "read_at"
    t.integer "dispute_result_transaction_id"
    t.integer "cbk_fee_transaction_id"
    t.index ["case_number"], name: "index_dispute_cases_on_case_number"
    t.index ["created_at"], name: "index_dispute_cases_on_created_at"
    t.index ["merchant_wallet_id"], name: "index_dispute_cases_on_merchant_wallet_id"
    t.index ["reason_id"], name: "index_dispute_cases_on_reason_id"
    t.index ["transaction_id"], name: "index_dispute_cases_on_transaction_id"
    t.index ["user_id"], name: "index_dispute_cases_on_user_id"
    t.index ["user_wallet_id"], name: "index_dispute_cases_on_user_wallet_id"
  end

  create_table "dispute_requests", force: :cascade do |t|
    t.integer "user_id"
    t.float "amount"
    t.text "message"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_dispute_id"
    t.string "title"
    t.float "refund_amount"
    t.string "request_type"
  end

  create_table "documentations", force: :cascade do |t|
    t.integer "image_type"
    t.string "document_file_name"
    t.string "document_content_type"
    t.bigint "document_file_size"
    t.datetime "document_updated_at"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.boolean "is_deleted", default: false
    t.boolean "document_processing"
    t.index ["imageable_type", "imageable_id"], name: "index_documentations_on_imageable_type_and_imageable_id"
  end

  create_table "ecomm_platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_notifications", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.datetime "schedule_date"
    t.string "sender"
    t.string "search_option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message_id"
    t.string "category_id"
    t.string "status"
    t.string "sender_signature"
  end

  create_table "emailtemplates", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "error_messages", force: :cascade do |t|
    t.integer "error_code"
    t.string "error_message"
    t.string "error_reason"
    t.string "error_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_logs", force: :cascade do |t|
    t.text "message"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_type"
    t.index ["transaction_id"], name: "index_event_logs_on_transaction_id"
  end

  create_table "evidences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "billing_address"
    t.string "package_carrier"
    t.string "tracking_number"
    t.string "shipping_address"
    t.date "shipping_date"
    t.integer "dispute_id"
    t.string "name"
    t.string "customer_ip"
    t.string "email"
    t.string "description"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.jsonb "data", default: {}
    t.boolean "is_enabled", default: true
    t.string "version"
    t.string "allowed_roles", default: [], array: true
    t.string "environment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fees", force: :cascade do |t|
    t.string "customer_fee"
    t.string "b2b_fee"
    t.string "redeem_fee"
    t.string "send_check"
    t.string "gbox"
    t.string "partner"
    t.string "iso"
    t.string "agent"
    t.integer "fee_id"
    t.integer "fee_status"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "buy_qc_card_cash"
    t.float "buy_qc_card_cc"
    t.float "atm_processing_fee"
    t.integer "user_id"
    t.string "add_money_check"
    t.string "redeem_check"
    t.string "giftcard_fee"
    t.float "reserve_fee", default: 0.0
    t.integer "days"
    t.string "customer_fee_dollar"
    t.string "transaction_fee_app"
    t.string "transaction_fee_app_dollar"
    t.string "transaction_fee_dcard"
    t.string "transaction_fee_dcard_dollar"
    t.string "transaction_fee_ccard"
    t.string "transaction_fee_ccard_dollar"
    t.float "charge_back_fee", default: 0.0
    t.float "retrievel_fee", default: 0.0
    t.jsonb "commission"
    t.integer "risk"
    t.string "name"
    t.float "refund_fee", default: 0.0
    t.float "service", default: 0.0
    t.float "statement", default: 0.0
    t.float "misc", default: 0.0
    t.jsonb "splits"
    t.boolean "is_baked_iso", default: false
    t.datetime "service_date"
    t.datetime "statement_date"
    t.datetime "misc_date"
    t.float "ach_fee"
    t.float "ach_fee_dollar"
    t.string "pincode"
    t.boolean "is_locked", default: true
    t.float "dc_deposit_fee"
    t.float "dc_deposit_fee_dollar"
    t.float "charge_back_percent"
    t.integer "charge_back_count"
    t.float "refund_percent"
    t.integer "refund_count"
    t.integer "payment_gateway_id"
    t.float "vmcardrate"
    t.float "distransfee"
    t.float "amexrate"
    t.float "amextransfee"
    t.float "monthlygatewayfee"
    t.float "annualccsalesvol"
    t.datetime "service_last_charged"
    t.datetime "statement_last_charged"
    t.datetime "misc_last_charged"
    t.float "qr_refund"
    t.float "qr_refund_percentage"
    t.float "debit_unredeemed_fee"
    t.float "credit_unredeemed_fee"
    t.float "debit_unredeemed_perc_fee"
    t.float "credit_unredeemed_perc_fee"
    t.float "load_fee_credit"
    t.float "load_fee_percent_credit"
    t.float "load_fee_debit"
    t.float "load_fee_percent_debit"
    t.float "failed_ach_fee", default: 0.0
    t.float "failed_push_to_card_fee", default: 0.0
    t.float "failed_check_fee", default: 0.0
    t.float "failed_ach_percent_fee", default: 0.0
    t.float "failed_push_to_card_percent_fee", default: 0.0
    t.float "failed_check_percent_fee", default: 0.0
    t.float "generate_label_fee"
    t.float "tracking_fee"
    t.float "invoice_card_fee", default: 0.0
    t.float "invoice_card_fee_perc", default: 0.0
    t.float "invoice_debit_card_fee", default: 0.0
    t.float "invoice_debit_card_fee_perc", default: 0.0
    t.float "b2b_fee_dollar", default: 0.0
    t.float "invoice_rtp_fee", default: 0.0
    t.float "invoice_rtp_fee_perc", default: 0.0
    t.float "rtp_fee"
    t.float "rtp_fee_perc"
    t.float "transaction_decline_fee_dollar"
    t.float "transaction_decline_fee"
    t.float "privacy_fee"
    t.float "cellular_terminal_fee", default: 0.0
    t.datetime "cellular_terminal_date"
    t.datetime "cellular_terminal_last_charged"
    t.float "ach_debit_fee_dollar"
    t.float "ach_debit_fee"
    t.float "check_withdraw_limit"
    t.float "privacy_fee_perc"
    t.float "cellular_fee", default: 0.0
    t.datetime "cellular_date"
    t.datetime "cellular_last_charged"
    t.float "min_monthly_fee", default: 0.0
    t.datetime "min_monthly_date"
    t.datetime "min_monthly_last_charged"
    t.float "cancellation_fee", default: 0.0
    t.datetime "cancellation_fee_last_charged"
    t.float "cellular_terminal_perc", default: 0.0
    t.float "cellular_perc", default: 0.0
    t.float "wire_fee", default: 0.0
    t.float "wire_fee_dollar", default: 0.0
    t.float "failed_wire_fee", default: 0.0
    t.float "failed_wire_percent_fee", default: 0.0
    t.index ["fee_status"], name: "index_fees_on_fee_status"
    t.index ["user_id"], name: "index_fees_on_user_id"
  end

  create_table "fees_locations", id: false, force: :cascade do |t|
    t.integer "fee_id"
    t.integer "location_id"
    t.index ["fee_id", "location_id"], name: "index_fees_locations_on_fee_id_and_location_id"
    t.index ["location_id"], name: "index_fees_locations_on_location_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  end

  create_table "giftcards", force: :cascade do |t|
    t.string "token"
    t.string "exp_year"
    t.string "exp_month"
    t.bigint "wallet_id"
    t.boolean "is_valid", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "balance"
    t.string "category"
    t.string "remaining_balance"
    t.string "pincode"
    t.integer "company_id"
    t.string "slug"
    t.index ["slug"], name: "index_giftcards_on_slug", unique: true
    t.index ["wallet_id"], name: "index_giftcards_on_wallet_id"
  end

  create_table "hold_in_rears", force: :cascade do |t|
    t.integer "status"
    t.date "release_date"
    t.float "amount", default: 0.0
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "release_time"
    t.float "ecommerce_amount", default: 0.0
    t.float "reserve_amount", default: 0.0
    t.datetime "reserve_release"
    t.index ["location_id"], name: "index_hold_in_rears_on_location_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "add_image_file_name"
    t.string "add_image_content_type"
    t.bigint "add_image_file_size"
    t.datetime "add_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "request_id"
    t.integer "ticket_id"
    t.integer "comment_id"
    t.integer "usage_id"
    t.integer "location_id"
    t.integer "evidence_id"
    t.string "file_type", default: "default"
    t.integer "bank_detail_id"
    t.integer "email_notification_id"
    t.string "name"
    t.integer "invoice_user_id"
    t.boolean "add_image_processing"
    t.index ["comment_id"], name: "index_images_on_comment_id"
    t.index ["request_id"], name: "index_images_on_request_id"
    t.index ["ticket_id"], name: "index_images_on_ticket_id"
  end

  create_table "job_statuses", force: :cascade do |t|
    t.integer "status"
    t.string "error"
    t.float "percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "load_balancer_rules", force: :cascade do |t|
    t.integer "operator"
    t.integer "count"
    t.float "amount"
    t.integer "no_of_hours"
    t.float "percentage"
    t.string "country"
    t.text "alert_receivers_emails"
    t.string "decline_reason"
    t.integer "rule_type"
    t.integer "identifier"
    t.integer "status"
    t.integer "load_balancer_id"
    t.string "card_brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descriptor"
    t.index ["load_balancer_id"], name: "index_load_balancer_rules_on_load_balancer_id"
  end

  create_table "load_balancers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.boolean "archived", default: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "business_name"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "web_site"
    t.text "address"
    t.string "business_type"
    t.string "years_in_business"
    t.string "category"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "social_security_no"
    t.string "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.integer "merchant_id"
    t.string "location_secure_token"
    t.boolean "iso_allowed", default: false
    t.boolean "agent_allowed", default: false
    t.boolean "is_block", default: false
    t.string "slug"
    t.float "sale_limit"
    t.float "sale_limit_percentage"
    t.string "ledger"
    t.boolean "block_withdrawal", default: false
    t.boolean "affiliate_allowed", default: false
    t.boolean "block_ip", default: false
    t.boolean "profit_split", default: false
    t.boolean "block_giftcard", default: true
    t.boolean "sales", default: true
    t.boolean "virtual_terminal", default: true
    t.boolean "close_batch", default: true
    t.boolean "disable_sales_transaction", default: true
    t.jsonb "profit_split_detail"
    t.boolean "baked_iso", default: false
    t.integer "primary_gateway_id"
    t.integer "secondary_gateway_id"
    t.integer "ternary_gateway_id"
    t.boolean "hold_in_rear", default: false
    t.integer "hold_in_rear_days", default: 1
    t.integer "risk"
    t.string "ecom_platform"
    t.boolean "block_api", default: false
    t.boolean "virtual_transaction_api", default: false
    t.boolean "virtual_terminal_transaction_api", default: false
    t.boolean "virtual_debit_api", default: false
    t.string "bank_account"
    t.string "bank_routing"
    t.integer "bank_account_type"
    t.string "cs_number"
    t.boolean "net_profit_split", default: false
    t.boolean "email_receipt", default: true
    t.boolean "sms_receipt", default: true
    t.boolean "block_ach", default: true
    t.boolean "sub_merchant_split", default: false
    t.string "pincode"
    t.boolean "is_locked", default: true
    t.bigint "category_id"
    t.bigint "ecomm_platform_id"
    t.float "low_ticket"
    t.float "average_ticket"
    t.float "high_ticket"
    t.float "monthly_processing_volume"
    t.float "over_high"
    t.float "extra_over"
    t.boolean "standalone", default: false
    t.boolean "push_to_card", default: true
    t.float "ach_limit", default: 0.0
    t.float "push_to_card_limit", default: 2000.0
    t.float "check_limit", default: 0.0
    t.string "ach_limit_type"
    t.string "push_to_card_limit_type"
    t.string "check_limit_type"
    t.string "bank_account_name"
    t.string "standalone_type"
    t.boolean "eaze_reporting", default: false
    t.boolean "is_slot", default: false
    t.string "dda_type"
    t.string "trip_business_type"
    t.string "ach_type"
    t.boolean "dispensary_credit_split"
    t.boolean "dispensary_debit_split"
    t.boolean "on_hold_pending_delivery", default: false
    t.integer "on_hold_pending_delivery_days", default: 1
    t.string "processing_type", default: "retail"
    t.string "country"
    t.string "ach_flag_text"
    t.boolean "ach_flag"
    t.boolean "vip_card", default: false
    t.boolean "ach_international", default: false
    t.integer "load_balancer_id"
    t.boolean "apply_load_balancer", default: false
    t.boolean "transaction_limit", default: false
    t.float "transaction_limit_offset", default: [], array: true
    t.string "rtp_hook"
    t.jsonb "status_reason", default: {"reason"=>nil, "status"=>"active"}
    t.jsonb "monthly_fees", default: {"monthly_pci_fee"=>false, "minimum_monthly_fee"=>false, "monthly_service_fee"=>false, "monthly_cellular_fee"=>false, "monthly_terminal_fee"=>false}
    t.float "refund_exceed_amount"
    t.string "refund_exceed_phone", default: [], array: true
    t.string "string"
    t.boolean "refund_exceed", default: false
    t.boolean "chargeback_alert", default: false
    t.string "chargeback_email_addresses"
    t.boolean "bulk_ach", default: true
    t.boolean "disable_nacha_transfer", default: false
    t.integer "primary_wallet_id"
    t.integer "tip_wallet_id"
    t.integer "reserve_wallet_id"
    t.integer "retail_descriptor_id"
    t.boolean "apply_retail_descriptor", default: false
    t.string "bussiness_license_expire"
    t.integer "license_status", default: 0
    t.boolean "block_wire", default: true
    t.index ["category_id"], name: "index_locations_on_category_id"
    t.index ["ecomm_platform_id"], name: "index_locations_on_ecomm_platform_id"
    t.index ["load_balancer_id"], name: "index_locations_on_load_balancer_id"
    t.index ["merchant_id"], name: "index_locations_on_merchant_id"
    t.index ["primary_gateway_id"], name: "index_locations_on_primary_gateway_id"
    t.index ["retail_descriptor_id"], name: "index_locations_on_retail_descriptor_id"
    t.index ["secondary_gateway_id"], name: "index_locations_on_secondary_gateway_id"
    t.index ["slug"], name: "index_locations_on_slug", unique: true
    t.index ["ternary_gateway_id"], name: "index_locations_on_ternary_gateway_id"
  end

  create_table "locations_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "location_id"
    t.boolean "attach", default: false
    t.string "relation_type", default: "primary"
    t.index ["location_id", "user_id"], name: "index_locations_users_on_location_id_and_user_id"
    t.index ["user_id"], name: "index_locations_users_on_user_id"
  end

  create_table "merchant_data", force: :cascade do |t|
    t.jsonb "corporate", default: "{}"
    t.jsonb "owners", default: "{}"
    t.jsonb "location", default: "{}"
    t.jsonb "iso_agent", default: "{}"
    t.jsonb "fees", default: "{}"
    t.jsonb "setting", default: "{}"
    t.jsonb "documentation", default: "{}"
    t.jsonb "buyrate", default: "{}"
    t.jsonb "bank_details", default: {}
  end

  create_table "messages", force: :cascade do |t|
    t.integer "actor_id"
    t.text "text"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transaction_id"
    t.integer "recipient_id"
  end

  create_table "minfraud_results", force: :cascade do |t|
    t.float "risk_score"
    t.jsonb "insight_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transaction_id"
    t.jsonb "mm_disposition"
    t.string "qc_action"
    t.string "qc_reason"
    t.string "website_url"
    t.index ["transaction_id"], name: "index_minfraud_results_on_transaction_id"
  end

  create_table "misc_fees", force: :cascade do |t|
    t.string "name"
    t.float "dollar_fee"
    t.float "percentage_fee"
    t.integer "misc_type"
    t.bigint "payment_gateway_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_gateway_id"], name: "index_misc_fees_on_payment_gateway_id"
  end

  create_table "monthly_processing_volumes", force: :cascade do |t|
    t.integer "location_id"
    t.integer "payment_gateway_id"
    t.float "monthly_volume"
    t.jsonb "visa_credit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "visa_debit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "mastercard_credit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "mastercard_debit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "amex_credit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "amex_debit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "discover_credit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "discover_debit", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "manual_refund", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.jsonb "other_cards", default: {"total_amount"=>nil, "decline_count"=>nil, "approved_count"=>nil, "decline_amount"=>nil, "approved_amount"=>nil, "decline_percentage"=>nil}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nacha_file_records", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "wallet_id"
    t.string "location_name"
    t.integer "status"
    t.integer "records"
    t.float "total_amount"
    t.datetime "transfer_date"
    t.integer "file_type"
    t.string "nacha_file_file_name"
    t.string "nacha_file_content_type"
    t.integer "nacha_file_file_size"
    t.datetime "nacha_file_updated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_nacha_file_records_on_user_id"
    t.index ["wallet_id"], name: "index_nacha_file_records_on_wallet_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "notable_type"
    t.bigint "notable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", default: ""
    t.string "name", default: ""
    t.index ["notable_id", "notable_type"], name: "index_notes_on_notable_id_and_notable_type"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived", default: false
    t.integer "status", default: 0
    t.string "text"
    t.datetime "hide_at"
    t.index ["action", "read_at"], name: "index_notifications_on_action_and_read_at"
    t.index ["actor_id"], name: "index_notifications_on_actor_id"
    t.index ["notifiable_id", "notifiable_type"], name: "index_notifications_on_notifiable_id_and_notifiable_type"
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
  end

  create_table "oauth_apps", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "website"
    t.string "tos"
    t.string "privacy_url"
    t.string "redirect_uri"
    t.boolean "is_block", default: false
    t.string "key"
    t.string "secret"
    t.string "token"
    t.string "code"
    t.string "organization_name"
    t.string "organization_web"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.text "revealed_by"
    t.datetime "revealed_date"
    t.index ["user_id"], name: "index_oauth_apps_on_user_id"
  end

  create_table "old_passwords", force: :cascade do |t|
    t.string "encrypted_password"
    t.string "password_archivable_type"
    t.integer "password_archivable_id"
    t.string "password_salt"
    t.datetime "created_at"
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable"
  end

  create_table "order_banks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "merchant_id"
    t.string "bank_type"
    t.string "card_type"
    t.string "status"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_sub_type"
    t.jsonb "transaction_info"
    t.integer "transaction_id"
    t.integer "payment_gateway_id"
    t.integer "card_id"
    t.integer "load_balancer_id"
    t.index ["merchant_id"], name: "index_order_banks_on_merchant_id"
    t.index ["payment_gateway_id"], name: "index_order_banks_on_payment_gateway_id"
    t.index ["user_id"], name: "index_order_banks_on_user_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "ownership"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "phone_number"
    t.string "ssn"
    t.string "date_of_birth"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dl"
    t.string "email"
    t.string "dl_state_issue"
    t.string "country"
    t.string "title"
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "payment_gateways", force: :cascade do |t|
    t.integer "type"
    t.string "name"
    t.text "client_secret"
    t.text "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.boolean "is_deleted", default: false
    t.text "authentication_id"
    t.text "signature_maker"
    t.boolean "is_block", default: false
    t.float "account_processing_limit", default: 0.0
    t.float "transaction_fee", default: 0.0
    t.float "charge_back_fee", default: 0.0
    t.float "retrieval_fee", default: 0.0
    t.float "per_transaction_fee", default: 0.0
    t.float "reserve_money", default: 0.0
    t.integer "reserve_money_days", default: 0
    t.float "monthly_service_fee", default: 0.0
    t.float "misc_fee", default: 0.0
    t.float "misc_fee_dollars", default: 0.0
    t.text "vertical_types", default: "0"
    t.integer "vertical_type_id"
    t.json "card_selection", default: {"visa_credit"=>"on", "visa_debit"=>"on", "mastercard_credit"=>"on", "mastercard_debit"=>"on", "amex_credit"=>"on", "discover_credit"=>"on", "jcb_credit"=>"on"}
    t.text "processor_id"
    t.string "slot_name"
    t.float "cbk_max_percent"
    t.integer "cbk_max_count"
    t.float "average_ticket"
    t.float "high_ticket"
    t.float "daily_limit"
    t.float "monthly_limit"
    t.boolean "allow_decimal", default: false
    t.boolean "virtual_tx"
    t.integer "descriptor_id"
    t.string "status", default: "active"
    t.bigint "wallet_id"
    t.integer "load_balancer_id"
    t.integer "load_balancer_rule_id"
    t.integer "transaction_count", default: 0
    t.boolean "blocked_by_load_balancer", default: false
    t.jsonb "decline_attempts"
    t.integer "decline_count", default: 0
    t.string "last_status"
    t.float "daily_volume_achived", default: 0.0
    t.datetime "last_daily_updated"
    t.float "monthly_volume_achived", default: 0.0
    t.datetime "last_monthly_updated"
    t.datetime "blocked_till"
    t.integer "total_transaction_count"
    t.integer "total_decline_count"
    t.integer "total_cbk_count"
    t.integer "cc_number_count", default: 0
    t.integer "amount_count", default: 0
    t.integer "cc_brand_count", default: 0
    t.integer "rotation_count", default: 0
    t.jsonb "error_message"
    t.jsonb "transaction_attempts"
    t.boolean "enable_refund", default: true
    t.index ["decline_count"], name: "index_payment_gateways_on_decline_count"
    t.index ["load_balancer_id"], name: "index_payment_gateways_on_load_balancer_id"
    t.index ["load_balancer_rule_id"], name: "index_payment_gateways_on_load_balancer_rule_id"
    t.index ["type"], name: "index_payment_gateways_on_type"
    t.index ["wallet_id"], name: "index_payment_gateways_on_wallet_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.decimal "permission_type"
    t.boolean "wallet", default: false
    t.boolean "refund", default: false
    t.boolean "transfer", default: false
    t.boolean "b2b", default: false
    t.boolean "virtual_terminal", default: false
    t.boolean "dispute_view_only", default: false
    t.boolean "dispute_submit_evidence", default: false
    t.boolean "accept_dispute", default: false
    t.boolean "funding_schedule", default: false
    t.boolean "check", default: false
    t.boolean "push_to_card", default: false
    t.boolean "ach", default: false
    t.boolean "gift_card", default: false
    t.boolean "sales_report", default: false
    t.boolean "checks_report", default: false
    t.boolean "gift_card_report", default: false
    t.boolean "user_view_only", default: false
    t.boolean "user_edit", default: false
    t.boolean "user_add", default: false
    t.boolean "developer_app", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "merchant_id"
    t.boolean "qr_scan", default: false
    t.boolean "qr_view_only", default: false
    t.boolean "qr_redeem", default: false
    t.boolean "view_chargeback_cases", default: false
    t.boolean "fight_chargeback", default: false
    t.boolean "accept_chargeback", default: false
    t.boolean "view_invoice", default: false
    t.boolean "create_invoice", default: false
    t.boolean "cancel_invoice", default: false
    t.boolean "customer_list", default: false
    t.boolean "approve_mr_transaction", default: false
    t.boolean "refund_mr_transaction", default: false
    t.boolean "export_list", default: false
    t.boolean "permission_view_only", default: false
    t.boolean "permission_edit", default: false
    t.boolean "permission_add", default: false
    t.boolean "api_key", default: false
    t.boolean "plugin", default: false
    t.boolean "fee_structure", default: false
    t.boolean "help", default: false
    t.boolean "check_view_only", default: false
    t.boolean "check_add", default: false
    t.boolean "check_void", default: false
    t.boolean "push_to_card_view_only", default: false
    t.boolean "push_to_card_add", default: false
    t.boolean "push_to_card_void", default: false
    t.boolean "ach_view_only", default: false
    t.boolean "ach_add", default: false
    t.boolean "ach_void", default: false
    t.boolean "gift_card_view_only", default: false
    t.boolean "gift_card_add", default: false
    t.boolean "gift_card_void", default: false
    t.boolean "export_account", default: false
    t.boolean "export_withdrawal", default: false
    t.boolean "export_chargeback", default: false
    t.boolean "export_invoice", default: false
    t.boolean "export_funding_schedule", default: false
    t.boolean "export_business_settings", default: false
    t.boolean "accounts", default: false
    t.boolean "withdrawals", default: false
    t.boolean "e_checks", default: false
    t.boolean "push_to_cards", default: false
    t.boolean "achs", default: false
    t.boolean "giftcards", default: false
    t.boolean "invoices", default: false
    t.boolean "exports", default: false
    t.boolean "business_settings", default: false
    t.boolean "employee_list", default: false
    t.boolean "permission_list", default: false
    t.boolean "risk_analysis", default: false
    t.boolean "chargebacks", default: false
    t.boolean "all", default: false
    t.boolean "view_accounts", default: false
    t.boolean "account_transfer", default: false
    t.boolean "tip_transfer", default: false
    t.boolean "export_daily_batch", default: false
    t.boolean "withdrawal", default: false
    t.boolean "view_retrieval_cases", default: false
    t.boolean "retrievals", default: false
    t.boolean "dispute_check", default: false
    t.boolean "export_retrieval", default: false
    t.integer "mgt_company_id"
    t.boolean "auto_ach", default: false
    t.boolean "payment", default: false
    t.boolean "ach_payment", default: false
    t.boolean "wire_payment", default: false
    t.boolean "approve_payment", default: false
    t.boolean "nacha_payment", default: false
    t.boolean "export_payment", default: false
    t.boolean "mgt_company_tab", default: false
    t.boolean "mgt_company_add", default: false
    t.boolean "mgt_company_revoke", default: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "amount"
    t.integer "quantity"
    t.integer "transaction_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website_url"
    t.string "order_id"
    t.float "total_amount"
    t.integer "request_id"
    t.integer "customer_dispute_id"
    t.integer "refund_count"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "company_name"
    t.integer "business_type"
    t.string "ein"
    t.string "business_location"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "years_in_business"
    t.string "tax_id"
    t.string "country"
    t.integer "business_category"
    t.boolean "disable_bulk_ach", default: true
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "qc_files", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "status"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.integer "user_id"
    t.string "info"
  end

  create_table "qr_cards", force: :cascade do |t|
    t.boolean "is_valid", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.string "price"
    t.bigint "wallet_id"
    t.string "token"
    t.string "message"
    t.string "category"
    t.integer "from_id"
    t.string "type_of"
    t.float "tip"
    t.integer "request_id"
    t.integer "transaction_id"
    t.string "job_id"
    t.index ["user_id"], name: "index_qr_cards_on_user_id"
    t.index ["wallet_id"], name: "index_qr_cards_on_wallet_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.string "title", default: ""
    t.string "reason_type", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "releases", force: :cascade do |t|
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id"
    t.jsonb "params"
    t.datetime "first_date"
    t.datetime "second_date"
    t.string "status"
    t.jsonb "file_id"
    t.text "message"
    t.string "report_type"
    t.string "offset"
    t.string "wallet"
    t.string "send_via"
    t.string "transaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admin_user_id"
    t.boolean "read"
    t.string "name"
  end

  create_table "request_data", force: :cascade do |t|
    t.integer "category"
    t.integer "status"
    t.float "volume_processed"
    t.jsonb "data"
  end

  create_table "requests", force: :cascade do |t|
    t.string "amount"
    t.string "status"
    t.integer "sender_id"
    t.integer "reciever_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wallet_id"
    t.string "sender_name"
    t.string "reciever_name"
    t.string "sender_access_token"
    t.string "pin_code"
    t.text "description"
    t.boolean "qr_scanned", default: false
    t.string "request_type"
    t.integer "from_wallet_id"
    t.integer "activity_id"
    t.integer "due_days"
    t.integer "logo_id"
    t.datetime "schedule_date"
    t.float "late_fee"
    t.string "late_fee_method"
    t.string "discount_method"
    t.string "fee_method"
    t.string "tax_method"
    t.float "total_amount"
    t.string "invoice_number"
    t.json "payment_option", default: {"card"=>false, "ach"=>false, "quickcard"=>false}
    t.float "discount"
    t.float "tax"
    t.float "fee"
    t.datetime "due_date"
    t.float "shipping_handling_fee"
    t.string "shipping_handling_method", default: "dollar"
    t.boolean "apply_tax", default: false
    t.boolean "checked_value_address", default: false
    t.index ["reciever_id"], name: "index_requests_on_reciever_id"
    t.index ["sender_id"], name: "index_requests_on_sender_id"
    t.index ["wallet_id"], name: "index_requests_on_wallet_id"
  end

  create_table "return_nacha_file_records", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "charge_percentage"
  end

  create_table "roles_users", force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "push_notification", default: false
    t.boolean "touch_id_login", default: false
    t.boolean "touch_id_transaction", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "slots", force: :cascade do |t|
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "amount"
    t.jsonb "slot_under"
    t.jsonb "slot_over"
  end

  create_table "tango_orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "utid"
    t.float "amount"
    t.string "order_id"
    t.string "account_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "catalog_image"
    t.string "checkId"
    t.text "description"
    t.string "direction"
    t.string "name"
    t.string "number"
    t.string "recipient"
    t.string "sender"
    t.string "status"
    t.integer "wallet_id"
    t.integer "order_type"
    t.string "account_number"
    t.string "routing_number"
    t.float "actual_amount"
    t.float "check_fee"
    t.float "fee_perc"
    t.float "gift_card_fee"
    t.string "pincode"
    t.boolean "settled", default: true
    t.string "notes"
    t.string "zip_code"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "account_type"
    t.string "send_via"
    t.json "account_token"
    t.boolean "approved", default: true
    t.boolean "from_admin", default: false
    t.string "ach_type"
    t.integer "transaction_id"
    t.datetime "batch_date"
    t.integer "ach_gateway_id"
    t.integer "void_transaction_id"
    t.string "first6"
    t.string "last4"
    t.integer "shape_file_id", default: 0
    t.boolean "under_review", default: false
    t.boolean "amount_escrow"
    t.integer "location_id"
    t.boolean "ach_international", default: false
    t.boolean "ach_afp"
    t.jsonb "address_details", default: {}
    t.jsonb "giftcard_data", default: {}
    t.string "category"
    t.string "schedule_days", default: [], array: true
    t.datetime "schedule_date"
    t.datetime "last_schedule"
    t.integer "percent"
    t.string "recipient_name"
    t.string "swift"
    t.string "bank_name"
    t.string "bank_type"
    t.index ["ach_gateway_id"], name: "index_tango_orders_on_ach_gateway_id"
    t.index ["batch_date"], name: "index_tango_orders_on_batch_date"
    t.index ["order_type"], name: "index_tango_orders_on_order_type"
    t.index ["send_via", "order_type", "batch_date"], name: "index_tango_orders_on_send_via_order_type_batch_date"
    t.index ["status"], name: "index_tango_orders_on_status"
    t.index ["user_id"], name: "index_tango_orders_on_user_id"
    t.index ["void_transaction_id"], name: "index_tango_orders_on_void_transaction_id"
    t.index ["wallet_id"], name: "index_tango_orders_on_wallet_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "untreated"
    t.string "title"
    t.string "slug"
    t.string "device_type"
    t.string "time_stamp"
    t.boolean "get_attention", default: true
    t.boolean "merchant_attention", default: false
    t.integer "assigned_to"
    t.integer "flag"
    t.index ["slug"], name: "index_tickets_on_slug", unique: true
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trackers", force: :cascade do |t|
    t.text "tracker_id"
    t.string "tracker_code"
    t.string "carrier"
    t.string "signed_by"
    t.datetime "est_delivery_date"
    t.jsonb "tracking_details"
    t.string "status"
    t.bigint "user_id"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label_url"
    t.jsonb "easypost_id"
    t.datetime "shipment_date"
    t.datetime "delivered_date"
    t.integer "location_id"
    t.boolean "is_return"
    t.string "return_tracking_id"
    t.string "return_tracking_code"
    t.jsonb "return_tracking_details"
    t.string "return_label_url"
    t.string "return_carrier"
    t.jsonb "return_easypost_ids"
    t.string "return_status"
    t.datetime "return_shipment_date"
    t.datetime "return_delivered_date"
    t.datetime "return_est_delivery_date"
    t.index ["transaction_id"], name: "index_trackers_on_transaction_id"
  end

  create_table "transaction_batches", force: :cascade do |t|
    t.integer "merchant_id"
    t.integer "merchant_wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "batch_date"
    t.integer "total_trxs"
    t.float "total_fee"
    t.float "total_amount"
    t.float "total_net"
    t.float "expenses"
    t.float "starting_balance"
    t.string "batch_type"
    t.float "invoice_amount", default: 0.0
    t.integer "invoice_count", default: 0
    t.float "iso_balance", default: 0.0
    t.float "agent_balance", default: 0.0
    t.float "affiliate_balance", default: 0.0
    t.float "refund_amount", default: 0.0
    t.integer "refund_count", default: 0
    t.integer "iso_wallet_id"
    t.integer "agent_wallet_id"
    t.integer "affiliate_wallet_id"
    t.float "iso_commission"
    t.float "agent_commission"
    t.float "affiliate_commission"
    t.float "iso_expense"
    t.float "affiliate_expense"
    t.float "agent_expense"
    t.float "iso_split"
    t.float "agent_split"
    t.float "affiliate_split"
    t.integer "iso_count", default: 0
    t.integer "agent_count", default: 0
    t.integer "affiliate_count", default: 0
    t.float "reserve", default: 0.0
    t.index ["merchant_wallet_id"], name: "index_transaction_batches_on_merchant_wallet_id"
  end

  create_table "transaction_batches_transactions", force: :cascade do |t|
    t.integer "transaction_batch_id"
    t.integer "transaction_id"
    t.index ["transaction_batch_id"], name: "index_transaction_batches_transactions_on_transaction_batch_id"
    t.index ["transaction_id"], name: "index_transaction_batches_transactions_on_transaction_id"
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name"
    t.bigint "payment_gateway_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_gateway_id"], name: "index_transaction_types_on_payment_gateway_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "to"
    t.string "from"
    t.string "amount"
    t.string "status"
    t.string "charge_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.string "action"
    t.text "seq_transaction_id"
    t.string "slug"
    t.bigint "card_id"
    t.string "refund_reason", default: ""
    t.jsonb "refund_log"
    t.jsonb "details"
    t.integer "payment_gateway_id"
    t.float "fee"
    t.float "tip"
    t.float "privacy_fee"
    t.float "reserve_money"
    t.jsonb "tags"
    t.string "main_type"
    t.string "sub_type"
    t.float "account_processing_limit", default: 0.0
    t.float "transaction_fee", default: 0.0
    t.float "charge_back_fee", default: 0.0
    t.float "retrieval_fee", default: 0.0
    t.float "per_transaction_fee", default: 0.0
    t.float "reserve_money_fee", default: 0.0
    t.float "reserve_money_days", default: 0.0
    t.float "monthly_service_fee", default: 0.0
    t.float "misc_fee", default: 0.0
    t.float "misc_fee_dollars", default: 0.0
    t.string "last4"
    t.string "first6"
    t.string "auth_code"
    t.integer "refunded_by"
    t.float "gbox_fee", default: 0.0
    t.float "iso_fee", default: 0.0
    t.float "affiliate_fee", default: 0.0
    t.float "agent_fee", default: 0.0
    t.float "total_amount", default: 0.0
    t.float "net_fee", default: 0.0
    t.float "net_amount", default: 0.0
    t.integer "receiver_id"
    t.integer "sender_wallet_id"
    t.integer "receiver_wallet_id"
    t.string "ip"
    t.datetime "timestamp"
    t.string "ref_id"
    t.string "bank_reference"
    t.integer "order_bank_id"
    t.float "discount"
    t.string "sender_name"
    t.string "receiver_name"
    t.string "clerk_id"
    t.integer "ach_gateway_id"
    t.string "terminal_id"
    t.integer "billing_id"
    t.integer "shipping_id"
    t.string "delivery_status"
    t.string "redirect_url"
    t.string "order_id"
    t.float "tax"
    t.string "block_version", default: "2"
    t.integer "invoice_id"
    t.string "website"
    t.float "sender_balance"
    t.float "receiver_balance"
    t.float "product_fee"
    t.string "fee_method"
    t.string "discount_method"
    t.integer "load_balancer_id"
    t.integer "refund_id"
    t.float "shipping_amount"
    t.string "quickcard_id"
    t.integer "tango_order_id"
    t.index ["card_id"], name: "index_transactions_on_card_id"
    t.index ["created_at"], name: "index_transactions_on_created_at"
    t.index ["payment_gateway_id"], name: "index_transactions_on_payment_gateway_id"
    t.index ["quickcard_id"], name: "index_transactions_on_quickcard_id", unique: true
    t.index ["ref_id"], name: "index_transactions_on_ref_id"
    t.index ["sender_id"], name: "index_transactions_on_sender_id"
    t.index ["slug"], name: "index_transactions_on_slug", unique: true
    t.index ["status", "main_type"], name: "index_transactions_on_status_and_main_type"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "from_wallet"
    t.integer "to_wallet"
    t.float "amount", default: 0.0
    t.date "transfer_date"
    t.string "memo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "sequence_id"
    t.string "transfer_timezone"
    t.string "user_name"
    t.string "from_wallet_name"
    t.string "to_wallet_name"
    t.string "transfer_main_type"
    t.index ["from_wallet"], name: "index_transfers_on_from_wallet"
    t.index ["to_wallet"], name: "index_transfers_on_to_wallet"
    t.index ["user_id"], name: "index_transfers_on_user_id"
  end

  create_table "user_data", force: :cascade do |t|
    t.integer "user_id"
    t.float "monthly_commission"
    t.float "daily_commission"
  end

  create_table "user_session_stores", force: :cascade do |t|
    t.string "session"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "postal_address"
    t.string "phone_number"
    t.boolean "status"
    t.string "user_image_file_name"
    t.string "user_image_content_type"
    t.bigint "user_image_file_size"
    t.datetime "user_image_updated_at"
    t.string "front_card_image_file_name"
    t.string "front_card_image_content_type"
    t.bigint "front_card_image_file_size"
    t.datetime "front_card_image_updated_at"
    t.string "back_card_image_file_name"
    t.string "back_card_image_content_type"
    t.bigint "back_card_image_file_size"
    t.datetime "back_card_image_updated_at"
    t.string "authentication_token"
    t.boolean "admin", default: false
    t.boolean "is_block", default: true
    t.string "confirmation_code"
    t.string "date_of_birth"
    t.string "issue_date"
    t.string "expire_date"
    t.string "stripe_customer_id"
    t.string "pin_code"
    t.string "device_token"
    t.string "device_type"
    t.boolean "archived", default: false
    t.string "registeration_id"
    t.string "username"
    t.string "client_id"
    t.string "client_secret"
    t.integer "app_id"
    t.string "redirect_url"
    t.text "denominations", default: "{1 => 0, 2 => 0, 5 => 0, 10 => 0, 20 => 0, 50 => 0, 100 => 0}"
    t.string "oauth_code"
    t.string "first_name"
    t.string "last_name"
    t.json "card_json"
    t.integer "company_id"
    t.integer "role"
    t.float "fee"
    t.string "plain_password_text"
    t.string "zip_code"
    t.integer "merchant_id"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "street"
    t.integer "location_id"
    t.boolean "issue_fee", default: true
    t.boolean "retail_sales", default: false
    t.string "owner_name"
    t.text "confirmation_code_enc"
    t.string "slug"
    t.string "ref_no"
    t.string "source"
    t.integer "payment_gateway"
    t.string "fluid_pay_customer_id", default: ""
    t.string "ledger"
    t.string "submerchant_type"
    t.string "area_code", default: ""
    t.integer "secondary_payment_gateway"
    t.integer "third_payment_gateway"
    t.string "second_stripe_id"
    t.integer "risk", default: 0
    t.string "third_stripe_id"
    t.jsonb "system_fee", default: "{}", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "second_factor_attempts_count", default: 0
    t.string "encrypted_otp_secret_key"
    t.string "encrypted_otp_secret_key_iv"
    t.string "encrypted_otp_secret_key_salt"
    t.string "direct_otp"
    t.datetime "direct_otp_sent_at"
    t.datetime "totp_timestamp"
    t.integer "primary_gateway_id"
    t.integer "secondary_gateway_id"
    t.integer "ternary_gateway_id"
    t.boolean "two_step_verification", default: false
    t.string "blocked_email"
    t.datetime "last_password_update", default: "2022-03-14 14:29:02"
    t.string "shipping_first_name"
    t.string "shipping_last_name"
    t.string "shipping_company"
    t.string "shipping_address"
    t.string "shipping_city"
    t.string "shipping_state"
    t.string "shipping_country"
    t.string "shipping_zip_code"
    t.datetime "password_changed_at", default: "2022-03-14 14:29:02"
    t.string "country"
    t.string "company_name"
    t.integer "merchant_ach_status"
    t.boolean "tos_checking", default: false
    t.boolean "is_profile_completed", default: false
    t.datetime "tos_acceptance_date"
    t.boolean "low_risk", default: false
    t.jsonb "low_risk_details"
    t.string "low_risk_status"
    t.bigint "permission_id"
    t.datetime "welcome_user_date"
    t.datetime "approve_date"
    t.boolean "send_ach_bank_request", default: false
    t.datetime "ach_bank_request_date"
    t.boolean "is_password_set", default: true, null: false
    t.jsonb "assigned_location_detail"
    t.boolean "assign_location", default: false
    t.boolean "block_withdrawal", default: true
    t.boolean "block_ach", default: true
    t.boolean "push_to_card", default: true
    t.boolean "block_giftcard", default: true
    t.jsonb "easypost_id"
    t.integer "approved_by"
    t.boolean "cookies_accept", default: false
    t.integer "tos_user_id"
    t.integer "admin_user_id"
    t.boolean "plugin_tab", default: false
    t.boolean "restricted_address", default: false
    t.string "access_ip_addresses", default: [], array: true
    t.string "access_mac_addresses", default: [], array: true
    t.boolean "blocked", default: false
    t.jsonb "status_reason", default: {"reason"=>nil, "status"=>"active"}
    t.integer "pole_admin_id"
    t.integer "business_account_id"
    t.integer "load_balancer_id"
    t.integer "api_company_id"
    t.string "auth_pin"
    t.datetime "pin_sent_at"
    t.integer "mgt_company_id"
    t.bigint "category_id"
    t.string "pos_integration_name"
    t.string "test_column"
    t.index ["authentication_token"], name: "index_users_on_authentication_token"
    t.index ["category_id"], name: "index_users_on_category_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["encrypted_otp_secret_key"], name: "index_users_on_encrypted_otp_secret_key", unique: true
    t.index ["permission_id"], name: "index_users_on_permission_id"
    t.index ["phone_number", "archived"], name: "index_users_on_phone_number_and_archived"
    t.index ["primary_gateway_id"], name: "index_users_on_primary_gateway_id"
    t.index ["ref_no"], name: "index_users_on_ref_no"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_wallets", force: :cascade do |t|
    t.integer "wallet_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "wallet_id"], name: "index_users_wallets_on_user_id_and_wallet_id"
    t.index ["wallet_id"], name: "index_users_wallets_on_wallet_id"
  end

  create_table "vertical_types", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payment_gateway_id"
    t.index ["payment_gateway_id"], name: "index_vertical_types_on_payment_gateway_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "qr_image_file_name"
    t.string "qr_image_content_type"
    t.bigint "qr_image_file_size"
    t.datetime "qr_image_updated_at"
    t.string "string_file_name"
    t.string "string_content_type"
    t.bigint "string_file_size"
    t.datetime "string_updated_at"
    t.string "token"
    t.string "balance", default: "0"
    t.bigint "oauth_app_id"
    t.integer "wallet_type"
    t.float "total_amount"
    t.float "total_sales"
    t.integer "total_transactions"
    t.integer "location_id"
    t.string "slug"
    t.string "pincode"
    t.string "notes"
    t.boolean "is_locked", default: true
    t.string "block_version", default: "2"
    t.boolean "is_blocked", default: false
    t.index ["location_id"], name: "index_wallets_on_location_id"
    t.index ["slug"], name: "index_wallets_on_slug", unique: true
    t.index ["user_id"], name: "index_wallets_on_user_id"
    t.index ["wallet_type"], name: "index_wallets_on_wallet_type"
  end

  add_foreign_key "batches", "locations"
  add_foreign_key "bulk_check_instances", "users"
  add_foreign_key "bulk_checks", "bulk_check_instances"
  add_foreign_key "bulk_checks", "tango_orders"
  add_foreign_key "cards", "users"
  add_foreign_key "comments", "tickets"
  add_foreign_key "comments", "users"
  add_foreign_key "company_locations", "companies"
  add_foreign_key "company_locations", "locations"
  add_foreign_key "config_log_details", "config_logs"
  add_foreign_key "config_log_details", "users"
  add_foreign_key "dispute_cases", "transactions"
  add_foreign_key "dispute_cases", "users"
  add_foreign_key "giftcards", "wallets"
  add_foreign_key "locations", "categories"
  add_foreign_key "locations", "ecomm_platforms"
  add_foreign_key "nacha_file_records", "users"
  add_foreign_key "nacha_file_records", "wallets"
  add_foreign_key "oauth_apps", "users"
  add_foreign_key "owners", "users"
  add_foreign_key "payment_gateways", "wallets"
  add_foreign_key "qr_cards", "users"
  add_foreign_key "qr_cards", "wallets"
  add_foreign_key "settings", "users"
  add_foreign_key "tango_orders", "users"
  add_foreign_key "tickets", "users"
  add_foreign_key "transactions", "users"
  add_foreign_key "transfers", "users"
  add_foreign_key "users", "categories"
  add_foreign_key "users", "permissions"
  add_foreign_key "wallets", "users", on_delete: :cascade
end
