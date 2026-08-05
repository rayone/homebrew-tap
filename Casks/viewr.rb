cask "viewr" do
  version "3"
  sha256 "a921ded973a91284c99c76baef5bfa6587242e061025f6309f78258db5cf1cd1"

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
