<<<<<<< HEAD
# BloggerApp
This website is developed by Rails 7 and Bootstrap 5
=======
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

**************Authentication*************
1. inside the gemfile
    => gem 'devise' (in last)
2. in terminal 
    => rails g devise:install
    => rails generate devise MODEL_NAME (User)
    => rails db:migrate
3. setup the app/views/devise all files

************Active_storage**************
1. rails active_storage:install
2. inside post model  post.rb
    => has_one_attached :image
3. rails generate model Post image:attachment
4. inside post controller update the post_params permit [:image]

**************Bloging app*****************
*generate model
    rails generate model Post title:string description:text
    rails generate model Comment content:text post:references user:references


rails db:migrate
*generate controller
    rails generate controller Posts
    rails generate controller Comments

*generats views pages  for controllers
    rails generate erb:scaffold posts title:string description:text
    rails generate erb:scaffold_comment comments content:text post:references

indide Model user.rb
  has_many :posts
  has_many :comments

inside Model post.rb
    belongs_to :user
    has_many :comments

inside Model comment.rb
  belongs_to :post
  belongs_to :user


>>>>>>> b0bd4e8 (likes add)
