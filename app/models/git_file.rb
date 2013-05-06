require 'grit'

class GitFile
  attr_reader :path
  def initialize path
    @gitrepo = Grit::Repo.new(Settings.git_repo_path)

    path = path[1..-1] if path[0] == '/'
    @path = path
    @encoded_path = (@path.unpack("M")[0])

    if @gitrepo.tree / @encoded_path
      @blob = @gitrepo.tree / @encoded_path
    else
      @blob = Grit::Blob.create(@gitrepo, {:name => @encoded_path, :data => ''})
    end
  end

  def data
    @blob.data
  end

  def data= dat
    File.open(File.join(@gitrepo.working_dir,@path), "w") do |f|
        f.write(dat)
    end
    self
  end

  def save commit_msg
    Dir.chdir(@gitrepo.working_dir) { @gitrepo.add(@path) }
    commit commit_msg
  end

  def delete commit_msg
    Dir.chdir(@gitrepo.working_dir) { @gitrepo.remove(@path) }
    commit commit_msg
  end

  private
  def commit msg
    @gitrepo.commit_index(msg)
  end
end
