class Article < ApplicationRecord
    #Adding this to provide validation when null string is passed on through the JSON
    validates :title, presence: true, length: { maximum: 40 } #Adding limitation as title can be maximum 40 characters
    validates :content, presence: true
    validates :author, presence: true
    validates :category, presence: true
    validates :published_at, presence: true
  end