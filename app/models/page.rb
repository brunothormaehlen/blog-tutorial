class Page < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :content, presence: true

  before_validation :make_slug

  scope :published, -> { where(published: true) }

  private

  def make_slug
    return unless title.present?
    self.slug = title
                  .downcase
                  .gsub(/[_ ]/, '-')
                  .gsub(/[^-a-z0-9+]/, '')
                  .gsub(/-{2,}/, '-')
                  .gsub(/^-/, '')
                  .chomp('-')
  end
end
