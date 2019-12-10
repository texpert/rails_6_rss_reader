# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe FeedsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Feed. As you add validations to Feed, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { url: Faker::Internet.url } }

  let(:invalid_attributes) { { url: 'bad url' } }

  let(:feed) { create :feed }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FeedsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Feed.create! valid_attributes

      get :index, params: {}, session: valid_session

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      feed = Feed.create! valid_attributes

      get :show, params: { id: feed.to_param }, session: valid_session

      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session

      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      feed = Feed.create! valid_attributes

      get :edit, params: { id: feed.to_param }, session: valid_session

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before do
        allow(FeedCreator).to receive(:run).and_return(feed)

        post :create, params: { feed: valid_attributes }, session: valid_session
      end

      it 'calls the FeedCreator with the received params sanitized' do
        expect(FeedCreator).to have_received(:run).with(ActionController::Parameters.new(valid_attributes).permit!)
      end

      it 'redirects to the created feed' do
        expect(response).to redirect_to(feed)
      end

      it { is_expected.to set_flash[:notice].to('Feed was successfully created') }
    end

    context 'with invalid params' do
      before do
        feed.errors.add(:url, 'isn\'t valid')
        allow(FeedCreator).to receive(:run).and_return(feed)

        post :create, params: { feed: invalid_attributes }, session: valid_session
      end

      it 'redirects to the new feed page' do
        expect(response).to redirect_to(new_feed_url)
      end

      it { is_expected.to set_flash[:alert].to(feed.errors) }
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { url: Faker::Internet.url } }

      it 'updates the requested feed' do
        feed = Feed.create! valid_attributes
        put :update, params: { id: feed.to_param, feed: new_attributes }, session: valid_session

        feed.reload
        expect(feed.url).to eql(new_attributes[:url])
      end

      it 'redirects to the feed' do
        feed = Feed.create! valid_attributes
        put :update, params: { id: feed.to_param, feed: valid_attributes }, session: valid_session

        expect(response).to redirect_to(feed)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        feed = Feed.create! valid_attributes
        put :update, params: { id: feed.to_param, feed: invalid_attributes }, session: valid_session

        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested feed' do
      feed = Feed.create! valid_attributes
      expect { delete :destroy, params: { id: feed.to_param }, session: valid_session }.to change(Feed, :count).by(-1)
    end

    it 'redirects to the feeds list' do
      feed = Feed.create! valid_attributes
      delete :destroy, params: { id: feed.to_param }, session: valid_session
      expect(response).to redirect_to(feeds_url)
    end
  end
end
