# typed: false
# frozen_string_literal: true

class ClidableServer < Formula
  desc "CLI coding agents for everyone — Clidable server"
  homepage "https://github.com/openclide/clidable"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/openclide/clidable/releases/download/v0.1.0/clidable-server-darwin-arm64"
      sha256 "55217e69b238c682f176f2893a36d000560738c542087461894575c08912369f"
    end
    on_intel do
      url "https://github.com/openclide/clidable/releases/download/v0.1.0/clidable-server-darwin-x64"
      sha256 "2452ee86844f6d90476e86353e17705ac3ee34b116d7e8f7d1ea0430b4607023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/openclide/clidable/releases/download/v0.1.0/clidable-server-linux-arm64"
      sha256 "1f61863a4b84495981ac6d75736e71d30a7618ee041987a589398fd522820f8f"
    end
    on_intel do
      url "https://github.com/openclide/clidable/releases/download/v0.1.0/clidable-server-linux-x64"
      sha256 "907aa9fc1ac3aa76e4332eb3d9652ee70e1b2bf0169608c5c0cf7efa5098b4ac"
    end
  end

  def install
    bin.install Dir["clidable-server-*"].first => "clidable-server"
  end

  test do
    assert_path_exists bin/"clidable-server"
    assert_predicate bin/"clidable-server", :executable?
  end
end
