class Post < ApplicationRecord
  include RailsDetail::Post

end unless defined? Post
