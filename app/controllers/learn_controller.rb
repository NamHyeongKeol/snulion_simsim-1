class LearnController < ApplicationController
  def index
    @ask = params[:ask]
  end
  
  def create
    ask = params[:ask]
    answer = params[:answer]
    talk = Talk.find_by_message(ask)

    if talk
      Resp.create(talk: talk, message: answer)
    else
      talk = Talk.create(message: ask)
      Resp.create(talk: talk, message: answer)
    end
    
    redirect_to "/"
  end
end
