# frozen_string_literal: true

require "./config/environment"
require_relative "app/controllers/artists_controller"
require_relative "app/controllers/songs_controller"
require_relative "app/controllers/genres_controller"

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise "Migrations are pending. Run `rake db:migrate` to resolve the issue."
end

use Rack::MethodOverride

use SongsController
use ArtistsController
use GenresController
run ApplicationController
