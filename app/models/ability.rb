class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Post do |post|
        post.user == user
      end

      can :destroy, Comment do |comment|
        comment.user == user
      end

      can :create, Post
      can :create, Comment
    end
  end
end
