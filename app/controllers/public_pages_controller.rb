class PublicPagesController < ApplicationController

  def show
    if valid_page?
      render template: "public_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/public_pages/#{params[:page]}.html.erb"))
  end

end
