# frozen_string_literal: true

class PostsController < ApplicationController
  include Pagy::Method

  # GET /posts
  def index
    result = PostsAggregator.run(params)
    result.respond_to?(:errors) ? (flash.now[:alert] = result.errors.messages) : (@pagy, @posts = pagy(:offset, result))
    @posts ||= [] # rubocop:disable Naming/MemoizedInstanceVariableName
  end
end
