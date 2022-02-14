class HomesController < ApplicationController
  def index
    @gym1 = Gym.order(id: 'DESC').first
    @gym2 = Gym.order(id: 'DESC').second
    @gym3 = Gym.order(id: 'DESC').third
    @gym4 = Gym.order(id: 'DESC').fourth
    @gym5 = Gym.order(id: 'DESC').fifth
  end
end
