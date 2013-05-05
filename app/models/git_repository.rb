require 'grit'
class GitRepository 
  attr_reader :gitrepo
  def initialize(repo_path)
    @gitrepo = Grit::Repo.new(repo_path)
  end

  def tree
    @gitrepo.tree
  end

  def repo_path
    @gitrepo.working_dir
  end
end
