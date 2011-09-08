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

ActiveRecord::Schema.define(:version => 20110908205159) do

  create_table "answers", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "count",       :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "enrollments", :force => true do |t|
    t.integer  "question_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "q_relationships", :force => true do |t|
    t.integer  "q_follower_id"
    t.integer  "q_followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "q_relationships", ["q_followed_id"], :name => "index_q_relationships_on_q_followed_id"
  add_index "q_relationships", ["q_follower_id"], :name => "index_q_relationships_on_q_follower_id"

  create_table "questions", :force => true do |t|
    t.text     "content"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "has_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "t_relationships", :force => true do |t|
    t.integer  "t_follower_id"
    t.string   "t_followed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "t_relationships", ["t_follower_id"], :name => "index_t_relationships_on_t_follower_id"

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "u_relationships", :force => true do |t|
    t.integer  "u_follower_id"
    t.integer  "u_followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "u_relationships", ["u_followed_id"], :name => "index_u_relationships_on_u_followed_id"
  add_index "u_relationships", ["u_follower_id", "u_followed_id"], :name => "index_u_relationships_on_u_follower_id_and_u_followed_id", :unique => true
  add_index "u_relationships", ["u_follower_id"], :name => "index_u_relationships_on_u_follower_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "uid"
    t.string   "picture"
    t.string   "fb_link"
    t.text     "description"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["uid"], :name => "index_users_on_uid"

  create_table "votes", :force => true do |t|
    t.integer  "value"
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["answer_id", "user_id"], :name => "index_votes_on_answer_id_and_user_id", :unique => true
  add_index "votes", ["answer_id"], :name => "index_votes_on_answer_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
