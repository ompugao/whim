module ApplicationHelper

  def listup_gittree(tree, path = "")
    ret = ""
    tree.contents.each do |elm|
      if elm.class == Grit::Tree
        ret += "<li>#{elm.name}</li>"
        ret += <<-EOF
        <li><ul class='nav nav-list'>
          #{listup_gittree(elm, path + '/' + elm.name)}
        </ul></li>
        EOF
      else
        ret += <<-EOS
        <li>
        <%= link_to '#{elm.name}',
         {:controller => 'viewer',
          :action => 'show',
          :id => '#{path + '/' + File.basename(elm.name, '.*')}',
          :format => '#{File.extname(elm.name)[1..-1]}'} %>
         </li>
        EOS
      end
    end
    ret
  end
end
