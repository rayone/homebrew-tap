cask "submission" do
  version "2.1"
  sha256 "41af2d561c5fe9aee337d5cc386f644164c5eb5112235a1497375c6cfaf98c3f"

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
