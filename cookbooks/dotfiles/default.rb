execute 'clone dotfiles' do
  command '. ~/.rbenv.sh && homesick clone sho-h/dotfiles'
  user node['target_user']
  not_if "ls ~/.homesick/repos/dotfiles"
end

execute 'update dotfiles' do
  command '. ~/.rbenv.sh && homesick pull dotfiles'
  user node['target_user']
end

# itamaeのプラグインでdefault-gemsが作成されるため、一時的に削除。
execute 'rm default-gems dotfiles' do
  command 'rm ~/.homesick/repos/dotfiles/home/.rbenv/default-gems || true'
  user node['target_user']
end

execute 'symlink dotfiles' do
  command '. ~/.rbenv.sh && homesick symlink dotfiles'
  user node['target_user']
end

# 一時的に削除したファイルを復旧。
execute 'restore default-gems dotfiles' do
  command 'cd ~/.homesick/repos/dotfiles/ && git checkout home/.rbenv/default-gems'
  user node['target_user']
end
