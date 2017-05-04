module RecipeHelper
  def include_cookbook(name)
    include_recipe File.join(__dir__, "cookbooks", name, "default.rb")
  end
end

Itamae::Recipe::EvalContext.include(RecipeHelper)

# 基本ツールのインストール。
%w(lv curl wget).each do |pkg|
  package pkg do
    action :install
  end
end

include_cookbook("ruby")
include_cookbook("dotfiles")

# 以降の順番は入れ替わっても問題ない。
include_cookbook("git")
include_cookbook("rubysrc")
include_cookbook("rurema")
include_cookbook("screen")
include_cookbook("svn")
include_cookbook("zsh")