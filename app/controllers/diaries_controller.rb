class DiariesController < ApplicationController
  include SocialStream::Controllers::Objects

  def new
    @diary = Diary.new diary_params
  end

  def create
    params[:diary].merge!(:owner_id => current_subject.try(:actor_id), :relation_ids => Relation::Public.instance.id,
      :author_id => current_subject.try(:actor_id), :user_author_id => current_user.id)
    create!
  end

  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def diary_params
    params.require(:diary).permit(:title, :owner_id, :relation_ids, :author_id, :user_author_id)
  end
end
