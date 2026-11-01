cask "mad-designer" do
  version "9.1.0"
  sha256 "e50fd3f3eb2c25b1f9f3f14ac2e776924d8054fde8ca4047047a7b6275cf2539"

  url "https://github.com/mthomason/MAD/releases/download/v#{version}-macos/MAD-Designer-macOS.dmg"
  name "MAD Designer"
  desc "Ad-hoc SQL query builder, visual report designer, and viewer"
  homepage "https://docs.everydayapps.com/macos.html"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "MAD Designer.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MAD Designer.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.thomason.report.mac.plist",
    "~/Library/Saved Application State/com.thomason.report.mac.savedState",
  ]
end
