class CannedResponsesController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  def index
    @canned_responses = @canned_responses.all(:order => :title)
  end

  def show
  end

  def new
    @canned_response = @canned_responses.new
  end

  def edit
  end

  def create
    @canned_response = @canned_responses.new
    if @canned_response.update_attributes(params[:canned_response])
      flash[:notice] = l(:notice_canned_response_created)
      redirect_to @canned_response
    else
      render :new
    end
  end

  def update
    if @canned_response.update_attributes(params[:canned_response])
      flash[:notice] = l(:notice_canned_response_updated)
      redirect_to @canned_response
    else
      render :edit
    end
  end

  def destroy
    @canned_response.destroy
    redirect_to :action => :index
  end

  def preview
    @text = params[:canned_response][:text]
    render :partial => 'common/preview'
  end

  private

  def find_project
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
      @canned_responses = @project.canned_responses
    else
      @canned_responses = CannedResponse
    end
    if params[:id].present?
      @canned_response = @canned_responses.find(params[:id])
      if !@project && @canned_response.project_id
        @project = Project.find(@canned_response.project_id)
      end
    end
    @canned_responses = CannedResponse.global unless @project
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
