class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      #After creating this schema using the ~rails generate model command we want to add constraints like null check and character limit check
      #After making changes to this we run the ~rake db:generate command which will update the schema.rb
      t.string :title, null: false, limit: 40
      t.string :content, null: false
      t.string :author, null: false
      t.string :category, null: false
      t.date :published_at, null: false

      t.timestamps
    end
  end
end
