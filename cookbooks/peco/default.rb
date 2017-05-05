=begin
execute 'Install peco' do
  command 'GOPATH="$HOME/.go" PATH=$PATH:$HOME/.go/bin go get github.com/peco/peco/cmd/peco'
  user node['target_user']
  not_if 'GOPATH="$HOME/.go" PATH=$PATH:$HOME/.go/bin peco --help'
end
=end
