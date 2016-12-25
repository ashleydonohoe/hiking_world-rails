class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new 
    can :manage, User, id: user.id
    can :manage, Picture, id: user.id
    can :manage, Video, id: user.id
    can :manage, Story, id: user.id

        # User admin added later
    # if user.admin?
    #   can :manage, Trail
    # else 
    #   can :read, Trail
    # end
  end
end
