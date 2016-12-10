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

    role :lead, proc { |user| user.lead? } do
      can :manage, Alert do |alert, user|
        alert.team_id == user.team_id
      end
      can :manage, Check do |check, user|
        check.team_id == user.team_id
      end
      can [:read], Datasource
      can [:read, :create], Event do |event, user|
        event.team_id == user.team_id
      end
      can [:read, :update], User do |user1, user2|
        user1.team_id == user2.team_id
      end
    end

    role :user, proc { |user| user.user? } do
      can :manage, Alert do |alert, user|
        alert.team_id == user.team_id
      end
      can :manage, Check do |check, user|
        check.team_id == user.team_id
      end
      can [:read], Datasource
      can [:read, :create], Event do |event, user|
        event.team_id == user.team_id
      end
      can [:read, :update], User do |user1, user2|
        user1.id == user2.id
      end
    end

    role :worker, proc { |user| user.worker? } do
      can [:read, :update], Check
      can :read, Datasource
      can [:read, :create], Event
      can [:read, :update], User do |user1, user2|
        user1.id == user2.id
      end
      can :manage, Worker
    end

    role :alerter, proc { |user| user.alerter? } do
      can :read, Alert
      can :manage, Alerter
      can [:read, :create, :update], Event
      can :read, Team
      can [:read, :update], User do |user1, user2|
        user1.id == user2.id
      end
    end

  end
end
