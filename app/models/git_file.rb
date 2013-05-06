require 'grit'

class GitFile
  attr_reader :path
  def initialize path
    @gitrepo = Grit::Repo.new(Settings.git_repo_path)

    path = path[1..-1] if path[0] == '/'
    @path = (path.unpack("M")[0])
  end

  def data
    (@gitrepo.tree / @path) . data
  end

  def data= dat
    (@gitrepo.tree / @path) . data = dat
    self
  end
  alias :save :data=
end
