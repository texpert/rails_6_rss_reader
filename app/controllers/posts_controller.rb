# frozen_string_literal: true

class PostsController < ApplicationController
  include Pagy::Backend

  helper Pagy::Frontend

  # GET /posts
  def index
    result = PostsAggregator.run(params)
    result.respond_to?(:errors) ? (flash[:alert] = result.errors.messages) : (@pagy, @posts = pagy_array(result))
    @posts ||= [] # rubocop:disable Naming/MemoizedInstanceVariableName
  end
end
