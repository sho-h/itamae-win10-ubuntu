# Rubyのインストール。
# c.f. https://github.com/k0kubun/itamae-plugin-recipe-rbenv

# include_recipe "rbenv::system"
include_recipe "rbenv::user"

template "/home/#{node['target_user']}/.rbenv.sh" do
  source "templates/dot.rbenv.sh.erb"
  mode '0755'
  user node['target_user']
end

execute "update bashrc" do
  command "echo '. /home/#{node['target_user']}/.rbenv.sh' >> ~/.bashrc"
  user node['target_user']
  not_if "grep 'rbenv.sh' ~/.bashrc"
end
