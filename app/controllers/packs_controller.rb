class PacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pack, only: %i[show edit update destroy]

  def index
    @packs = User.find_by(uid: current_user['uid'].to_i).packs.all
  end

  def show
  end

  def new
    @pack = Pack.new
  end

  def edit
  end

  def create
    @pack = Pack.new(pack_params)
    @pack.user_id = User.find_by(uid: current_user['uid'].to_i).id

    if @pack.save
      redirect_to packs_path, notice: 'Pack was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pack.update(pack_params)
      redirect_to packs_path, notice: 'Pack was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pack.destroy
    redirect_to packs_url, notice: 'Pack was successfully destroyed.'
  end

  private

  def set_pack
    @pack = Pack.find(params[:id])
  end

  def pack_params
    params.require(:pack).permit(:name, :user_id)
  end
end
