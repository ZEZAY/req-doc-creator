class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  enum status: { active: 0, disable: 1}

  validates :name, uniqueness: true, presence: true

  before_commit :check_slug

  def check_slug
    self.slug = name.gsub(' ', '-')
    save
  end
end
