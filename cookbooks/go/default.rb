# PATHはdotfilesで指定。

package 'golang' do
  action :install
  user 'root'
end

# TODO: pecoがインストールできないため、パッケージからインストールするなどする。
# https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
