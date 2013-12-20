class UserVotesController < ApplicationController

  def create
    @user_vote = UserVote.new(params[:user_vote])
    @user_vote
    flash[:errors] = @user_vote.errors.full_messages
    redirect_to link_url(params[:link_id])
  end


end
