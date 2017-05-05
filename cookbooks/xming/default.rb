# TODO: cbwin(https://github.com/xilun/cbwin)などを使ってXmingをインストールする。
# できれば分岐もしたいところ。(uname -rで4.4.0-43-Microsoftなどが使えるとよいが)
if false
  base_url = 'https://ja.osdn.net/projects/sfnet_xming/downloads'
  execute "download Ximg" do
    url = File.join(base_url, 'Xming/6.9.0.31/Xming-6-9-0-31-setup.exe')
    command "wget #{url}"
  end

  execute "download Ximg-fonts" do
    url = File.join(base_url, 'Xming-fonts/7.7.0.10/Xming-fonts-7-7-0-10-setup.exe')
    command "wget #{url}"
  end
end
