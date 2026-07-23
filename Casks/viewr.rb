cask "viewr" do
  version "1"
  sha256 "e42967d289444d544913e36c41f9b4f349baf3691e6af0196e96f2f254ba6607"

  url "https://github.com/rayone/viewR/releases/download/v#{version}/viewR.dmg"
  name "viewR"
  desc "Native macOS image viewer with parallel decode pipeline"
  homepage "https://github.com/rayone/viewR"

  depends_on macos: ">= :ventura"

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
