ActiveRecord::Schema.define(:version => 0) do
  create_table "articles", :force => true do |t|
    t.string   :title
    t.text     :body
    t.timestamps
  end

  create_table "comments", :force => true do |t|
    t.text     :body
    t.string   :email    ,:limit => 40
    t.string   :name     ,:limit => 40
    t.timestamps
  end
end
