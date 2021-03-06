class TimeReport < ApplicationRecord
  belongs_to :user
  has_one :experience_record, dependent: :destroy
  has_many :time_report_tag_links, dependent: :destroy
  has_many :tags, -> { order(:name) }, through: :time_report_tag_links
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy

  scope :newest, -> { order(created_at: :desc) }

  validates :study_time, presence: true
  validates :memo, length: { maximum: 280 }

  def links
    time_report_tag_links
  end
end