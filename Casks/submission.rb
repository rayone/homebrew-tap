cask "submission" do
  version "2"
  sha256 "ecc7f49c0245f26555ddea02a731896e6cb2c0ee232382aa5c822bb540880875"

  url "https://github.com/rayone/subMission/releases/download/v#{version}/subMission.dmg"
  name "subMission"
  desc "Native macOS client for Transmission"
  homepage "https://github.com/rayone/subMission"

  depends_on macos: :ventura

  app "subMission.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/subMission.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/subMission.plist",
  ]
end
