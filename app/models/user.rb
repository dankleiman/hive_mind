class User < ActiveRecord::Base
  has_many :votes
  has_many :achievements

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.save!
    end
  end

  def admin?
    role == 'admin'
  end

end
