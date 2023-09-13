class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.admin?
        scope.all
      else
        # Additional authorization logic for non-admin users
        # For example, return only cars that belong to the current user:
        scope.where(user: user)
      end
    end
  end

  def show?
    true # All users can view a car.
  end

  def new?
    true # All users can create a new car.
  end

  def create?
    true # All users can create a new car.
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def mycars?
    true # All users can view their own cars.
  end

  private

  def owner?
    # Check if the user is the owner of the car.
    record.user == user
  end
end
