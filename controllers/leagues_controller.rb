class LeaguesController < ApplicationController
  before_action :set_league, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:photo_upload, :update]

  def index
    @leagues = current_user.leagues
  end

  def new
    @league = current_user.leagues.build
  end

  def create
    @league = current_user.leagues.build(league_params)
    if @league.save
      redirect_to photo_upload_league_path(@league), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show
    

  end

  

  def photo_upload
   
  end


  def update

    
    if @league.update(new_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  

  private


    def set_league
      @league = League.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You don't have permission" unless current_user.id == @league.user_id
    end


    def league_params
      params.require(:league).permit(:league_name, :members, :opening)
    end
end

