class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy ]
  
  def index
    @messages = Message.all
  end

  def show
    #@message = Message.find(params[:id])
    #set_message
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'Message が正常に投稿されました'
      #redirect_to messages_url
      redirect_to @message
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end

  def edit
    #@message = Message.find(params[:id])
    #set_message
  end

  def update
    #@message = Message.find(params[:id])
    #set_message
    if @message.update(message_params)
      flash[:success] = 'Message は正常に更新されましたぜ。'
      redirect_to messages_url
    else
      flash.now[:danger] = 'Message は更新されませんでしたぜ。'
      render :edit
    end
  end
end

  def destroy
    #@message = Message.find(params[:id])
    #set_message
    @message.destroy
    
    flash[:success] = 'Message は正常に削除されました。。'
    redirect_to messages_url
  end

private
#共通メソッドとして。
def set_message
  @message = Message.find(params[:id])
end

# Strong Parameter
def message_params
  params.require(:message).permit(:content, :title)
end