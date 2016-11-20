class AccessPolicy
  include AccessGranted::Policy
  def configure
    role :admin, proc { |user| user.admin? } do
      can :manage, Alert
      can :manage, Alerter
      can :manage, Check
      can :manage, Datasource
      can [:read, :create, :update], Event
      can :manage, Team
      can :manage, User
      can :manage, Worker
    end
    role :user, proc { |user| user.user? } do
      can :manage, Alert
      can :manage, Check
      can [:read, :create], Event
      can :update, User
    end
    role :worker, proc { |user| user.worker? } do
      can [:read, :update], Check
      can :read, Datasource
      can [:read, :create, :update], Event
      can :manage, Worker
    end
    role :alerter, proc { |user| user.alerter? } do
      can :read, Alert
      can :manage, Alerter
      can [:read, :create, :update], Event
      can :read, Team
    end
  end
end
