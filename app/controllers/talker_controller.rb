class TalkerController < ApplicationController
  def index
    @history = History.all
    
    @talk = Talk.new
  end
  
  def ask
    ask = params[:ask]
    talk = Talk.find_by_message(ask)
    
    if talk
      History.create(receive: ask, resp: talk.resps.sample.message)
      redirect_to "/talker/index"
    else
      redirect_to controller: "learn", action: "index", ask: ask
    end
  end
end
