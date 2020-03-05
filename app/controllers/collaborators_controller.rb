class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:email])
    @collaborator = Collaborator.where(wiki: @wiki, user: @user).first_or_initialize

    if @collaborator.persisted?
      flash[:alert] = "Oops! This collaborator has already been added to this wiki."
    else
      if @collaborator.save
        flash[:notice] = "You have successfully added a collaborator to your wiki."
      else
        flash.now[:alert] = "There was an error adding the collaborator. Please try again."
      end
    end
    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "The collaborator was removed from your wiki."
    else
      flash.now[:alert] = "There was an error removing the collaborator."
    end
    redirect_to edit_wiki_path(@wiki)
  end
end
