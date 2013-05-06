class ApplicationController < ActionController::Base
  protect_from_forgery

  def initialize
    super
    @repo = Grit::Repo.new(Settings.git_repo_path)
  end
end
