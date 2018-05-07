class League < ActiveRecord::Base
  
  def to_param
    [id, league_name.parameterize].join("-")
  end
  
  belongs_to :user
  has_many :seasons
  
  validates :league_name, presence:true
  
  
end
