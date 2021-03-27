# frozen_string_literal: true

class FeedsController < ApplicationController
  include Pagy::Backend

  helper Pagy::Frontend

  before_action :set_feed, only: %i[show edit update destroy]

  # GET /feeds
  def index
    @pagy, @feeds = pagy(Feed.all)
  end

  # GET /feeds/1
  def show; end

  # GET /feeds/new
  def new
    @webpack_dropzone = true
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
    @webpack_dropzone = true
  end

  # POST /feeds
  def create
    result = FeedCreator.run(feed_params)

    return redirect_to result, notice: I18n.t('feeds.create_success') if result.errors.blank?

    redirect_to :new_feed, alert: result.errors
  end

  # PATCH/PUT /feeds/1
  def update
    if @feed.update(feed_params)
      redirect_to @feed, notice: I18n.t('feeds.update_success')
    else
      render :edit
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: I18n.t('feeds.destroy_success')
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:title, :url)
  end
end
