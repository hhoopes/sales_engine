module JsonHelpers
  def json
    JSON.parse(response.body)
  end

  RSpec.configure do |config|
    config.include JsonHelpers, type: :request
  end
end
