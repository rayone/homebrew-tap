cask "submission" do
  version "2.1"
  sha256 "74530510040fc1fbc597651e11ab171acbf7b102e18c1ff724b5e735f18b6fe2"

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
