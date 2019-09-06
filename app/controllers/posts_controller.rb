# frozen_string_literal: true

class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = PostsAggregator.run
  end
end
