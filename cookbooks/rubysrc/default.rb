# Rubyのソースコードのダウンロード。

rubysrc_dir = "/home/#{node['target_user']}/local/src/rubysrc"
execute 'create src directory' do
  command "mkdir -p #{rubysrc_dir}"
  user node['target_user']
end

node['rbenv']['versions'].each do |version|
  v = version.split('.')[0,2].join('.')
  execute "download ruby #{version}" do
    command "wget https://cache.ruby-lang.org/pub/ruby/#{v}/ruby-#{version}.tar.bz2"
    user node['target_user']
    cwd rubysrc_dir
    not_if "ls #{rubysrc_dir}/ruby-#{version}.tar.bz2"
  end

  execute "extract ruby #{version}" do
    command "tar xjf ruby-#{version}.tar.bz2"
    user node['target_user']
    cwd rubysrc_dir
    not_if "ls #{rubysrc_dir}/ruby-#{version}"
  end
end

package 'git' do
  action :install
  user 'root'
end

# TODO: gitリソースでブランチが指定できる方法がわかれば変更する。
execute "clone ruby" do
  command "git clone https://github.com/ruby/ruby.git git"
  user node['target_user']
  cwd rubysrc_dir
  not_if "ls #{rubysrc_dir}/git"
end
