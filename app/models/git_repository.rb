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

  def file_data path
    path = path[1..-1] if path[0] == '/'
    (@gitrepo.tree / (path.unpack("M")[0])) . data
  end
end
