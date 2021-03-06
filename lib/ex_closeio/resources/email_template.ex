defmodule ExCloseio.EmailTemplate do
  @moduledoc """
    EmailTemplate handles communication with the email template related
    methods of the Close.io API.

    See http://developer.close.io/#email-templates
  """

  alias ExCloseio.{ResultStream}
  import ExCloseio.Base
  @url_part "/email_template"

  def all(params \\ [], api_key \\ :global) do
    get(@url_part, api_key, params)
  end

  def render(id, params, api_key \\ :global) do
    get(@url_part <> id <> "/render/", api_key, params)
  end

  def paginate(params, api_key \\ :global) do
    templates = params |> ResultStream.new(api_key, __MODULE__) |> Enum.to_list
    {:ok, templates}
  end

  def find(id, api_key \\ :global) do
    get(@url_part <> id, api_key)
  end

  def create(params, api_key \\ :global) do
    post(@url_part, api_key, params)
  end

  def update(id, params, api_key \\ :global) do
    put(@url_part <> id, api_key, params)
  end

  def destroy(id, api_key \\ :global) do
    delete(@url_part <> id, api_key)
  end

end
