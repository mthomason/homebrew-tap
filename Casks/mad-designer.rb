cask "mad-designer" do
  version "0.8.0"
  sha256 "aaca5da0882484f2b4317fccada312886834448a43e8d680b12107930c033bb0"

  url "https://github.com/mthomason/MAD/releases/download/v#{version}/MAD-Designer-macOS.dmg"
  name "MAD Designer"
  desc "Ad-hoc SQL query builder, visual report designer, and viewer"
  homepage "https://docs.everydayapps.com/macos.html"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "MAD Designer.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/MAD Designer.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.thomason.report.mac.plist",
    "~/Library/Saved Application State/com.thomason.report.mac.savedState",
  ]
end
