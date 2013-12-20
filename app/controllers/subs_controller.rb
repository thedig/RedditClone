class SubsController < ApplicationController

  before_filter :require_logged_in, :only => [:new, :create]

  def create
    @sub = Sub.new(params[:sub])
    @sub.user_id = current_user.id

    params[:links] = params[:links].reject do |key, val|
      val.all? { |k, v| v == "" }
    end

    params[:links].each do |key, val|
      val[:user_id] = current_user.id
    end

    if @sub.save
      params[:links].each do |i, link|
        @sub.make_link(link)
      end
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def new
    render :new
  end

  def show
    @sub = Sub.find(params[:id])
    @mod = @sub.moderator
    @links = @sub.links
    render :show
  end

end

