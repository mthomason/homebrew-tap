cask "mad-designer" do
  version "0.7.0"
  sha256 "c175819cae0be7a31499ac3e85de5603fbe09b61466c63c7bcab07983af8a31b"

  url "https://github.com/mthomason/MAD/releases/download/v#{version}/MAD-Designer-macOS.dmg"
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
