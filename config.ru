require_relative './config/environment'

#only if needed, commet out for now. USER
# if ActiveRecord::Migrator.needs_migration?
# raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride


use UsersController
use GameItemsController
run ApplicationController



rake db:migrate

rake db:seed
