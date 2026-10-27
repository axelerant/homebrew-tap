cask "fynn" do
  version "1.8.0"
  sha256 "6cbd7f4475f5356ef9fa9734700e881f4f4dee9f4317616617c2db7315b32a27"

  # Immutable, versioned key. Never point this at the "latest" pointer object
  # (desktop/Fynn.pkg) — its bytes change on every release and the pinned
  # sha256 would break for everyone the moment a new version ships.
  url "https://fynn-downloads-959068696076.s3.ap-south-1.amazonaws.com/desktop/desktop-v#{version}/Fynn.pkg",
      verified: "fynn-downloads-959068696076.s3.ap-south-1.amazonaws.com/desktop/"
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
