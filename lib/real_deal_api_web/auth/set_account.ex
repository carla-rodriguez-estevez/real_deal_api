defmodule RealDealApiWeb.Auth.SetAccount do
  import Plug.Conn
  alias RealDealApiWeb.Auth.ErrorResponse
  alias RealDealApi.Accounts

  def init(_options) do

  end

  def call(conn, _options) do
    if conn.assigns[:account] do
      conn
    else
      account_id = get_session(conn, :account_id)

      case account_id do
        nil -> raise ErrorResponse.Unauthorized
        _ -> account = Accounts.get_account!(account_id)
            cond  do account_id && account -> assign(conn, :account, account)
            true -> assign(conn, :account, account)
        end
      end
    end

  end


end
