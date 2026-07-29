cask "viewr" do
  version "2"
  sha256 "85425d64a2f1dc62c482085980b61a40a041806e490675b57bca0babb28be16d"

  url "https://github.com/rayone/viewR/releases/download/v#{version}/viewR.dmg"
  name "viewR"
  desc "Native macOS image viewer with parallel decode pipeline"
  homepage "https://github.com/rayone/viewR"

  depends_on macos: :ventura

  app "viewR.app"

  postflight do
    # Remove quarantine so unsigned app launches without Gatekeeper prompt
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/viewR.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/viewR.plist",
  ]
end
