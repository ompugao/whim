require 'redcarpet'
require 'cgi'

module ApplicationHelper

  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)

  def listup_gittree(tree, path = "")
    ret = ""
    tree.contents.each do |elm|
      if elm.class == Grit::Tree
        ret += "<li>#{elm.name}</li>"
        ret += <<-EOF
        <li><ul class='nav nav-list'>
          #{listup_gittree(elm, (path==''?'':path + '/') + elm.name)}
        </ul></li>
        EOF
      else
        ret += <<-EOS
        <li>
        <%= link_to "#{(elm.name)}",
         {:controller => 'viewer',
          :action => 'show',
          :id => "#{CGI.escape((path==''?'':path+'/') + File.basename(elm.name, '.*'))}",
          :format => "#{File.extname(elm.name)[1..-1]}"} %>
         </li>
        EOS
      end
    end
    ret
  end

  def mkd2html(data)
    @@markdown.render(data)
  end
end
