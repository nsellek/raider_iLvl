require 'rails_helper'

RSpec.describe PlayerController, type: :controller do

  describe "GET #view_player" do
    it "returns http success" do
      get :view_player
      expect(response).to have_http_status(:success)
    end
  end

end
