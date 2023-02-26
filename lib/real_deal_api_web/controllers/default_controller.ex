defmodule RealDealApiWeb.DefaultController do
  use RealDealApiWeb, :controller

  #Add router en router.ex

  def index(conn, _params) do
    text conn, "The real deal API is Live - #{Mix.env()}"
  end
end
