class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(type,method,word)
    if type == "user_match"
              if method == "forward_match"
                      @users = User.where("name LIKE?","#{word}%")
              elsif method == "backward_match"
                      @users = User.where("name LIKE?","%#{word}")
              elsif method == "perfect_match"
                      @users = User.where("name","#{word}")
              elsif method == "partial_match"
                      @users = User.where("name LIKE?","%#{word}%")
              else
                      @users = User.all
              end
    elsif type == "book_match"
              if method == "forward_match"
                      @books = Book.where("title LIKE?","#{word}%")
              elsif method == "backward_match"
                      @books = Book.where("title LIKE?","%#{word}")
              elsif method == "perfect_match"
                      @books = Book.where("title","#{word}")
              elsif method == "partial_match"
                      @books = Book.where("title LIKE?","%#{word}%")
              else
                      @books = Book.all
              end
            end
  end

end
