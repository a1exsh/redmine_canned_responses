class CannedResponse < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :title, :text

  named_scope :global, :conditions => { :project_id => nil }, :order => :title

  def global?
    project.nil?
  end
end
