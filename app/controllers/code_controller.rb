class CodeController < ApplicationController
  def code200
    delay
    render json: {code: 200} , :status => 200, :content_type => 'text/html'
  end
  def code404
    delay
    render json: {code: 500} , :status => 500, :content_type => 'text/html'
  end
  def code500
    delay
    render json: {code: 500} , :status => 500, :content_type => 'text/html'
  end


  private

  def delay
    delay_length = params["delay"].to_f / 1000 || 0
    sleep delay_length
  end
end