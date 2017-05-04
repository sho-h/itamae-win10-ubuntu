doc_dir = "/home/#{node['target_user']}/local/src/rubydoc/"
execute 'create doc directory' do
  command "mkdir -p #{doc_dir}"
  user node['target_user']
end

=begin
# TODO: gitリソースでブランチが指定できる方法がわかれば変更する。
%w(doctree bitclust).each do |repos|
  execute "clone rurema #{repos}" do
    command "git clone git@github.com:rurema/#{repos}.git git"
    user node['target_user']
    cwd doc_dir
    not_if "ls #{doc_dir}/#{repos}"
  end
end
=end
