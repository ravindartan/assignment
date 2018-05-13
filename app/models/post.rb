class Post
  include Mongoid::Document
  field :uid,   type: String
  field :data, type: Hash

  belongs_to :user
  def self.add_post(data, current_user)
    # binding.pry
    @post = Post.where(id: data["id"])
    if @post.count == 0 
      Post.create(id: data["id"],data: data, user: current_user)
    end
  end
end
