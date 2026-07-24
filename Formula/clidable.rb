# typed: false
# frozen_string_literal: true

# The Clidable server/CLI. The download artifact is named `clidable-server-*`
# (kept distinct from the `Clidable_*` desktop installers in the release
# listing), but the installed command is `clidable`. This formula owns the
# bare name so `brew install openclide/tap/clidable` means the CLI on every
# platform; the desktop app ships separately as the `clidable-desktop` cask.
class Clidable < Formula
  desc "GUI for CLI coding agents — server and CLI"
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
    # Download artifact is clidable-server-<os>-<arch>; the command is `clidable`.
    bin.install Dir["clidable-server-*"].first => "clidable"
  end

  test do
    assert_path_exists bin/"clidable"
    assert_predicate bin/"clidable", :executable?
  end
end
