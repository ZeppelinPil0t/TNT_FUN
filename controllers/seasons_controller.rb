class SeasonsController < ApplicationController
  before_action :set_season, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:update]

  def index
    @seasons = current_user.seasons
  end

  def new
    @season = current_user.seasons.build
  end

  def create
    @season = current_user.seasons.build(league_params)
    if @season.save
      redirect_to sub_season_path(@season), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show
    
  end

  

  def sub
   
  end


  def update

    
    if @season.update(new_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  

  private


    def set_season
      @season = Season.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You don't have permission" unless current_user.id == @season.user_id
    end


    def season_params
      params.require(:season).permit(:season_name, :sub, :start_date_time, :end_date_time)
    end
end

