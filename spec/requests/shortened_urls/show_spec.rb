require "rails_helper"

RSpec.describe "Shortened URLs show" do
  it "redirects to root path for valid shortened URL" do
    get "/valid"

    expect(response).to redirect_to root_path
  end

  it "raises error for invalid shortened URL" do
    expect { get "/invalid" }.to raise_error ActionController::RoutingError
  end
end
