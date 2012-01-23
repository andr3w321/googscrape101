MyApp::Application.configure do
  config.middleware.insert_after(::Rack::Lock, "::Rack::Auth::Basic", "Staging") do |u, p|
    [u, p] == ['user', 'pass']
  end
end
