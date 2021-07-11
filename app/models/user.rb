class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :invitations, foreign_key: :attendee_id
        has_many :attended_events, through: :invitations
        has_many :events, foreign_key: :user_id, class_name: "Event"
end
