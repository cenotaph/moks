class WikiPagesController < Admin::BaseController
  layout 'admin'
  before_action :authenticate_user!
  acts_as_wiki_pages_controller
end
