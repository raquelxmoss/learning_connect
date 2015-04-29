require 'rails_helper'

RSpec.describe RatingsController, type: :controller do

  let(:user){create(:user)}
  let(:connection){create(:connection, receiver: user)}
  let(:course){connection.courses.create}
  let(:params){ {connection_id: connection.to_param, course_id: course.to_param, rating: 3, rating_type: "tutor_rate_learner"} }


  describe 'POST #create' do 
    subject {post :create, params}
    context 'When not signed_in' do 
      it 'redirects to the login page' do 
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in' do 
      before {sign_in user}
      subject {post :create, params}
      
      it 'create a new rating' do 
        expect{subject}.to change(course.ratings,:count).by(1)
      end

      it 'renders the partial show without layout' do 
        expect(subject).to render_template(:partial => '_show')
      end

      it 'assigns rating to the correct @rating' do 
        post :create, params
        expect(assigns(:rating)).to eq(Rating.last)
      end

      it 'assigns course to the correct @course' do 
        post :create, params
        expect(assigns(:course)).to eq(course)
      end

    end

  end

end
