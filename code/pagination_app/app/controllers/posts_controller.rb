class PostsController < ApplicationController

  def index
    @posts = Post.paginate(:page => current_page)
  end

  def destroy
    @post = Post.find(params[:id])

    respond_to do |wants|
      if @post.destroy
        @posts = Post.paginate(:page => current_page)

        wants.html { redirect_to adjusted_page_url || :back }
        wants.js do
          render(:update) { |page| page.redirect_to @back_url } if @back_url = adjusted_page_url
        end
      end
    end

  end

  private
    def current_page
      return params[:page] if params[:page].present?
      return '1' if request.env['HTTP_REFERER'].blank?
      
      uri = URI.parse(request.env['HTTP_REFERER'])
      query_hash = Rack::Utils.parse_query(uri.query)
      query_hash['page'] || 1
    end

    def adjusted_page_url
      return nil unless @posts.out_of_bounds?

      uri = URI.parse(request.env['HTTP_REFERER'])
      query_hash = Rack::Utils.parse_query(uri.query)

      query_hash['page'] = [1, (query_hash['page'].to_i - 1)].max
      uri.query = query_hash.to_query
      return uri.to_s
    end

end
