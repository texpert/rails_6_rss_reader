# frozen_string_literal: true

class PostsController < ApplicationController
  include Pagy::Backend

  helper Pagy::Frontend

  # GET /posts
  def index
    @pagy, @posts = pagy_array(PostsAggregator.run)
  end
end
