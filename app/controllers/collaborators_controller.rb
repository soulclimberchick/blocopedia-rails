class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:email])
    @collaborator = Collaborator.where(wiki: @wiki, user: @user).first_or_initialize

  if @collaborator.persisted?
    flash[:alert] = "Oooops! This collaborator has already been added to this wiki."
    redirect_to edit_wiki_path(@wiki)
  else
    if @collaborator.save
      flash[:notice] = "You have successfully added collaborator to your wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash.now[:alert] = "There was an error adding the collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end

def destroy
  @wiki = Wiki.find(params[:wiki_id])
  @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed from your wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash.now[:alert] = "There was an error removing the collaborator."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
