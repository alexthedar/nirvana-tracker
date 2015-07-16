class FeatsController < ApplicationController
  load_and_authorize_resource

  def index
    @feats = Feat.all
  end

  def show
    @feat = Feat.find(params[:id])

  end

  def new
    @feat = Feat.new
  end

  def create
    @feat = Feat.new(feat_params)
    if @feat.save
      flash[:notice] = "Added"
      redirect_to feat_path(@feat)
    else
      render :new
    end
  end

  def update
    @feat = Feat.find(params[:id])
    if @feat.update(feat_params)
      flash[:notice] = "Modified"
      redirect_to feat_path(@feat)
    else
      render :edit
    end
  end

  def edit
    @feat = Feat.find(params[:id])
  end

  def destroy
    @feat = Feat.find(params[:id])
    @feat.destroy
    redirect_to actions_path
  end

  private
  def feat_params
    params.require(:feat).permit(:name, :description, :bliss_pts, :creator_id)
  end
end
