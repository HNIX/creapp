class Ability
  include CanCan::Ability

  def initialize(user)
    if !user
      can :read, [Investor, AssetListing], visibility: 'public'
      #can :read, [ResumeItem, EducationItem, PortfolioItem]
    else
      can :manage, User, id: user.id
      #can :manage, PaymentInfo, user_id: user.id
      can :read, Investor do |investor|
        if investor.visible_to_others?
          true
        else
          investor.user_id == user.id
        end
      end
      can :read, Client
      can [:create, :update, :destroy], [Investor, Client], user_id: user.id
      #can :read, [ResumeItem, EducationItem, PortfolioItem]
      # can [:create, :update, :destroy], [ResumeItem, EducationItem, PortfolioItem] do |item|
      #   if user.investor.present?
      #     user.investor.id == item.investor_id
      #   else
      #     false
      #   end
      # end
      can :read, AssetListing do |item|
        if item.ended
          user.client.present? && (item.client_id == user.client_id)
        else
          true
        end
      end
      can :create, AssetListing do |item|
        user.client.present?
      end
      can [:update, :destroy], AssetListing do |item|
        if user.client.present?
          user.client.id == item.client_id
        else
          false
        end
      end

      can_see_for_assets(user)
    end
  end

  protected

  def can_see_for_assets(user)
    can [:create], Asset do |asset|
      user.client.present?
    end
    can [:read, :update, :destroy], Asset do |asset|
      can_see = false
      can_see = true if user.client.present? && asset.client_id == user.client.id
      can_see = true if user.investor.present? && asset.investor_id == user.investor.id
      can_see
    end
    can :update_as_client, Asset do |asset|
      user.client.present? && asset.client_id == user.client.id
    end
    can :update_as_investor, Asset do |asset|
      user.investor.present? && asset.investor_id == user.investor.id
    end
  end
end