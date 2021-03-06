class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Added a child relationship for managed albums
  # This user can have one or more managed albums
  has_many :managed_albums, class_name: 'ManagedAlbums', dependent: :destroy # Should be singular by convention

  # Has many through
  has_many :albums, through: :managed_albums
end
