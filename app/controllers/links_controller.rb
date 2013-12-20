class LinksController < ApplicationController
  def create
    @link = Link.new(params[:link])

    @link.user = current_user

    if @link.save
      params[:subs].each do |sub|
        next if sub == ""
        @link.connect_to_sub(sub)
      end

      redirect_to link_url(@link)
    else
      @subs = Sub.all
      flash.now[:errors] = [@link.errors.full_messages]
      render :new
    end
  end

  def new
    @subs = Sub.all
    render :new
  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.top_level_comments
    render :show
  end
end
