cask "submission" do
  version "2.1"
  sha256 "fcf514f87257e022b134ae97ba9932a43e2e0b8741bab8bf6d099b6d637881b8"

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
