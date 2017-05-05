package 'zsh' do
  action :install
  user 'root'
end

zsh_path = '/bin/zsh'
execute 'change shell' do
  command "chsh --shell #{zsh_path}"
  user node['target_user']
  not_if "grep #{node['target_user']} /etc/passwd | grep #{zsh_path}"
end
