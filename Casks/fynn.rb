cask "fynn" do
  version "1.36.0"
  sha256 "30221a7fa3cfef36578820c3a574f7669c6f2a4a4c8b9f0603f8203fe92fe8ed"

  # Immutable, versioned key. Never point this at the "latest" pointer object
  # (desktop/Fynn.pkg) — its bytes change on every release and the pinned
  # sha256 would break for everyone the moment a new version ships.
  url "https://fynn-downloads-959068696076.s3.ap-south-1.amazonaws.com/desktop/desktop-v#{version}/Fynn.pkg"
  name "Fynn"
  desc "Meeting and note capture with real-time transcription"
  homepage "https://fynn.team/"

  # tauri.conf.json → bundle.macOS.minimumSystemVersion
  depends_on macos: :sonoma

  pkg "Fynn.pkg"

  # The installer is built with BundleIsRelocatable false and install-location /,
  # so the receipt enumerates /Applications/Fynn.app exactly — pkgutil removes
  # the payload and forgets the receipt.
  uninstall quit:    "team.fynn.desktop",
            pkgutil: "team.fynn.desktop"

  zap trash: [
    "~/Library/Application Support/team.fynn.desktop",
    "~/Library/Caches/team.fynn.desktop",
    "~/Library/HTTPStorages/team.fynn.desktop",
    "~/Library/Preferences/team.fynn.desktop.plist",
    "~/Library/Saved Application State/team.fynn.desktop.savedState",
    "~/Library/WebKit/team.fynn.desktop",
  ]
end
