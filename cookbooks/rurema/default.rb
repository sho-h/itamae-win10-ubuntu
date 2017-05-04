doc_dir = "/home/#{node['target_user']}/local/src/rubydoc/"
execute 'create doc directory' do
  command "mkdir -p #{doc_dir}"
  user node['target_user']
end

# TODO: gitリソースでブランチが指定できる方法がわかれば変更する。
%w(doctree bitclust).each do |repos|
  repos_dir = File.join(doc_dir, repos)
  execute "clone rurema #{repos}" do
    command "git clone git@github.com:sho-h/#{repos}.git"
    user node['target_user']
    cwd doc_dir
    not_if "ls #{repos_dir}"
  end

  execute "add #{repos} upstream" do
    command "git remote add upstream git@github.com:rurema/#{repos}.git"
    user node['target_user']
    cwd repos_dir
    not_if "git remote -v | grep upstream"
  end
end

# bitclustのDB用の領域をRAMに確保。
bitclust_dir = File.join(doc_dir, 'bitclust')
db_dir = File.join(bitclust_dir, 'db')
execute "create bitclust db directory" do
  command "mkdir #{db_dir}"
  user node['target_user']
  cwd bitclust_dir
  not_if "ls | grep db"
end

execute "mount db directory" do
  command "mount -t tmpfs -o size=128M tmpfs #{db_dir}"
  user 'root'
  not_if "mount | grep tmpfs | grep bitclust/db"
end
