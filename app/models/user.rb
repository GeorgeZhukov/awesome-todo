class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :projects, dependent: :destroy

  def get_image
    if image
      image
    else
      "gravatar"
    end
  end
end
