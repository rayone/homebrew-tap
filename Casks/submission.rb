cask "submission" do
  version "2.1"
  sha256 "4e5a3ca982c51422396d2af0fa2699f564cffb3cd3b0d2be53c4ab4b32ead2cd"

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
