require 'rails_helper'

RSpec.describe WikisController, type: :controller do

describe "WIKI create" do
  it "increases the number of Wiki by 1" do
    expect{ wiki :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(wiki,:count).by(1)
  end

  it "assigns the new wiki to @wiki" do
    wiki :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(assigns(:wiki)).to eq wiki.last
  end

  it "redirects to the new wiki" do
    wiki :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to wiki.last
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { id: my_wiki.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, params: { id: my_wiki.id }
      expect(response).to render_template :show
    end

    it "assigns my_wiki to @wiki" do
      get :show, params: { id: my_wiki.id }
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      expect(reponse).to render_template :new
    end

    it "instantiates @wiki" do
      get :new
        epect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: {id: my_wiki.id}
      expect(response).to render_template :edit
    end

    it "assigns wiki to be updated to @wiki" do
      get :edit, params: {id: my_wiki.id}
      wiki_instance = assigns(:wiki)

      expect(wiki_instance.id).to eq my_wiki.id
      expect(wiki_instance.title).to eq my_wiki.title
      expect(wiki_instance.body).to eq my_wiki.body
    end
  end

  describe "PUT #update" do
    it "updates the wiki with the expected attributes" do
      new_title = "Updated Wiki Title"
      new_body = "Updated Wiki Body"

      put :update, params: {id: my_wiki.id, wiki: {title: new_title, body: new_body } }

      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq my_wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end

    it "redirects to the updated wiki" do
      new_title = "Updated Wiki Title"
      new_body = "Updated Wiki Body"

      put :update, params: {id: my_wiki.id, wiki: {title: new_title, body: new_body } }
      expect(response).to redirect_to my_wiki
    end
  end

  describe "DELETE #destroy" do
    it "deletes the wiki" do
      delete :destroy, params: {id: my_wiki.id}

      count = Wiki.where({id: my_wiki.id}).size
      expect(count). to eq 0
    end

    it "redirects to wikis index view" do
      delete :destroy, params: {id: my_wiki.id}

      expect(response).to redirect_to wikis_path
    end
  end
end
