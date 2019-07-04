class MicropostsController < ApplicationController
  before_action :search_id, only:[:show,:destroy,:edit,:update]

  def index
    @microposts=Micropost.all
  end

  def new
    @micropost=Micropost.new
  end

  def confirm
    @micropost=Micropost.new(micropost_params)
  end

  def create
    @micropost=Micropost.new(micropost_params)
    if @micropost.save
      redirect_to microposts_path
    else
      render 'new'
    end
  end

  def destroy
    if @micropost.destroy
      redirect_to microposts_path
    else
      render 'microposts/index'
    end
  end

  def edit
  end

  def update
    if @micropost.update(micropost_params)
      redirect_to microposts_path
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def search_id
    @micropost=Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
