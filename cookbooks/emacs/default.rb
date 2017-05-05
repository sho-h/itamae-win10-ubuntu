
%w(emacs24 cmigemo python).each do |pkg|
  package pkg do
    action :install
    user 'root'
  end
end

# Caskのインストール。
execute 'Install Cask command' do
  # c.f. https://github.com/cask/cask
  command 'curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python'
  user node['target_user']
  not_if "ls /home/#{node['target_user']}/.cask"
end

execute 'Exec cask install' do
  command "PATH=$PATH:/home/#{node['target_user']}/.cask/bin cask install"
  user node['target_user']
  cwd "/home/#{node['target_user']}/.emacs.d/"
end
