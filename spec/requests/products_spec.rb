require 'rails_helper'

RSpec.describe ProductController, type: :controller do

	# describe 'GET /products' do
	# 	before { get :index }

	# 	it 'return HTTP status 200' do
	# 		expect(response).to have_http_status(200)
	# 	end

	# end

	# describe 'GET /product/show' do
	# 	before { get :show }

	# 	it 'return HTTP status 200' do
	# 		expect(response).to have_http_status(200)
	# 	end	
	# end

	describe 'POST /product' do
		let(:product_params) do
			{
				"product": {
					"name": "kemeja",
					"description": "kemeja anak"
				}
			}
		end
		before { post :create, params: product_params }
		it 'return HTTP status 200' do
			expect(response).to have_http_status(201)
		end
	end

	describe 'DELETE /product/delete' do
		let(:product_id) {	{	"id": 1	}	}
		before { delete :destroy, params: product_id }
		it 'return HTTP status 422 if error' do
			expect(response).to have_http_status(422)
		end
	end

end
