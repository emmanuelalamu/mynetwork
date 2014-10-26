class HomeController < ApplicationController
  def homepage
    @statuses=Status.all.order('id desc')
  end

  def follow
    @addfollow=Follow.create(:follower_id=>params[:follower_id], :following_id=>params[:following_id])
  end
  
  def unfollow
    @removefollow=Follow.destroy_all(:follower_id=>params[:follower_id], :following_id=>params[:following_id])
  end
  
  def about
  end

  def dashboard
    @peopleifollow= Follow.where(:follower_id=>current_user.id)
    @id_peopleifollow = @peopleifollow.collect { |f| f["following_id"] }
    @id_peopleifollow= @id_peopleifollow.push(current_user.id)
    @statuses=Status.where('user_id in (?)', @id_peopleifollow).order("id desc")
  end

  def userlist
    @users=User.all
  end

  def profile
    @profile=User.find(params[:id])
  end

  def follower
    @profile=User.find(params[:id])
    @followers=Follow.where(:following_id=>params[:id]).joins("INNER JOIN users ON users.id = follows.follower_id")
  end

  def following
  end
end
