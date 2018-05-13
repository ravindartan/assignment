class Token
  include Mongoid::Document
  belongs_to :user

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  
  field :uid, type: String
  field :access_token, type: String
  field :provider, type: String

  def self.find_for_oauth(auth)
    binding.pry
    find_or_create_by(uid: auth.uid, provider: auth.provider, access_token: auth.credentials.token)
  end
end
