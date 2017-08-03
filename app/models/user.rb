class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, class_name: 'Post', source: :post

  attr_accessor :current_user

  devise :omniauthable

  #username needs to be present for forms etc.
  validates :username, presence: true

  enum role: [ :client, :admin ]

  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth, signed_in_resource = nil)
  user = User.where(provider: auth.provider, uid: auth.uid).first
  if user.present?
    user
  else
    # Check wether theres is already a user with the same
    # email address
    user_with_email = User.find_by_email(auth.info.email)
    if user_with_email.present?
      user = user_with_email
    else
        user = User.new
        if auth.provider == "facebook"

          user.provider = auth.provider
          user.uid = auth.uid
          user.password = Devise.friendly_token[0,20]
          user.username = auth.extra.raw_info.name
          user.email = auth.extra.raw_info.email
          user.skip_confirmation! unless user.confirmed?
          user.save

      elsif auth.provider == "twitter"

          user.provider = auth.provider
          user.uid = auth['uid'],
          user.email = auth['email']
          user.password = auth.credentials.token
          #user.oauth_user_name = auth['info']['name']
          user.skip_confirmation! unless user.confirmed?
          user.save

      elsif auth.provider == "github"

          user.provider = auth["provider"]
          user.uid = auth["uid"]

          user.email = auth["email"]
          user.skip_confirmation! unless user.confirmed?
          user.save

      elsif auth.provider == "google_oauth2"

          user.provider = auth.provider
          user.uid = auth.uid
          user.password = Devise.friendly_token[0,20]
          user.username= auth.info.name
          user.email = auth.info.email
          user.skip_confirmation! unless user.confirmed?
          user.save
        end
    end
  end

  return user
  end

  def is_admin?
    self.role.include?("admin")
  end
  # For Twitter (save the session eventhough we redirect user to registration page first)
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  # For Twitter (disable password validation)
  def password_required?
    super && provider.blank?
  end

  def current_user
    self
  end

end