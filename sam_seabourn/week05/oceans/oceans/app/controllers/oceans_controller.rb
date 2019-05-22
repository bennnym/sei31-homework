class OceansController < ApplicationController


def index
  @oceans = Ocean.all
end


end
