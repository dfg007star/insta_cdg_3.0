require "rails_helper"

RSpec.describe PostsController, type: :controller do

    let (:user) { create :user }
    let (:params) { { user_id: user } }

    before { sign_in user }

    describe '#index' do 
        subject { get :index, params: params }

        let!(:post) { create :post, user: user }

        it 'assigns @posts' do 
            subject
            expect(assigns(:posts)).to eq([post])
        end
        it { is_expected.to render_template('index') }
    end
     
end