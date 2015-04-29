class MessagesController < ApplicationController

  def update
  #  {"message"=>{"labels"=>"dev gschool"}, "controller"=>"messages", "action"=>"update", "id"=>"6"}    @message = Message.find(params[:id])
    @message = Message.find(params[:id])
      if params[:message][:labels]
        @message.labels = params[:message][:labels].split(" ").uniq
        @message.save
      else
        @message.update!(params.require(:message).permit(:read, :unread, :starred, :labels))
      end
    render nothing: true
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    render nothing: true
  end

end
