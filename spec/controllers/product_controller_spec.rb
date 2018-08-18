require 'rails_helper'

RSpec.describe ProductController, type: :controller do
	
	describe "GET #show" do
		before do
			get :index
		end

		it "return http success" do
			expect(response).to have_http_status(200)
		end
	end

end
