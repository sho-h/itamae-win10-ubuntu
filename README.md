# itamae-win10-ubuntu

## 構成

```
├── recipe.rb
├── node.yml
├── cookbooks
│   ├── ruby
│   │   ├── default.rb
│   │   └── templates
│   │       └── etc
│   │           └── nginx
│   │               └── nginx.conf.erb
│   └── ...
│       └── ...
...
```

c.f. http://techlife.cookpad.com/entry/2015/05/12/080000

## 実行

### vagrant

```
$ vagrant up
$ bundle exec itamae ssh --vagrant --node-yaml node.yml recipe.rb
```

### 実機(ローカルのBash on Ubuntu on Windowsを想定)

```
$ bundle exec itamae local --node-yaml node.yml recipe.rb
```
