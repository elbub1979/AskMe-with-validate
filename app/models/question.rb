class Question < ApplicationRecord
  before_save :remove_tags
  validates :body, presence: true, length: { maximum: 280 }

  private

  def remove_tags
    body.gsub!(/(?:<).*?(?:>)/, '')
  end
end
