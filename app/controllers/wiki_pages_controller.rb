class WikiPagesController < Admin::BaseController
  layout 'admin'
  before_filter :authenticate_user!
  acts_as_wiki_pages_controller
end
