require 'redcarpet'
require 'cgi'

module ApplicationHelper

  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :tables => true, :fenced_code_blocks => true, :autolink => true)


  def listup_gittree(tree, path = "")
    ret = ""
    tree.contents.each do |elm|
      if elm.class == Grit::Tree
        ret += "<li class='nav-header'>#{elm.name}/</li>"
        ret += <<-EOF
        <li><ul class='nav nav-list'>
          #{listup_gittree(elm, path + '/' + elm.name)}
        </ul></li>
        EOF
      else
        filepath = path + '/' + File.basename(elm.name, '.*')
        def trim_first_slashes p
          if p[0] == '/'
            trim_first_slashes p[1..-1]
          else
            p
          end
        end
        filepath = escape_path(trim_first_slashes(filepath))
        ret += <<-EOS
        <li id='blobelem'>
        <%= link_to "#{(elm.name)}",
         {:controller => 'pages', :action => 'show', :id => "#{filepath}",
          :format => "#{File.extname(elm.name)[1..-1]}"}, {:class => "bloblink"} %>
         </li>
        EOS
      end
    end
    ret
  end

  def mkd2html(data)
    @@markdown.render(data)
  end

  def escape_path path
    path.split('/').map{|x| CGI.escape(x)}.join('/')
  end

  def unescape_path path
    path.split('/').map{|x| CGI.unescape(x)}.join('/')
  end
end
