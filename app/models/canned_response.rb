class CannedResponse < ActiveRecord::Base
  belongs_to :project

  validate :title, :text
  attr_accessible :title, :text

  scope :global, where(:project_id => nil)
  default_scope order(:title)

  def global?
    project.nil?
  end
end
