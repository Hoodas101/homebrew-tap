cask "lidkeep" do
  version "2.2.1"
  sha256 "ad3af21aefdb660032a5395d902c0c59cd86980aabfce21f417efe484881976c"

  url "https://github.com/Mihooni/lidkeep/releases/download/v#{version}/LidKeep-#{version}.dmg"
  name "LidKeep"
  desc "Turn the display off without sleeping the Mac, and keep it running with the lid closed"
  homepage "https://github.com/Mihooni/lidkeep"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "LidKeep.app"
  binary "lidkeep"

  uninstall launchctl: [
                "com.lidkeep.bar",
                "com.lidkeep.nosleep.reset",
              ],
            quit:      "com.lidkeep.bar",
            delete:    [
              "/etc/sudoers.d/lidkeep",
              "/Library/LaunchDaemons/com.lidkeep.nosleep.reset.plist",
              "~/Library/LaunchAgents/com.lidkeep.bar.plist",
            ]

  zap trash: [
    "~/Library/Application Support/LidKeep",
  ]

  caveats <<~EOS
    This build is signed ad-hoc rather than notarized, and Homebrew applies the
    quarantine attribute on install. Gatekeeper therefore blocks the first
    launch — on recent macOS it may move the app straight to the Trash.

    Clear the flag once, then open the app as usual:

      xattr -dr com.apple.quarantine "#{appdir}/LidKeep.app"

    Check whether the flag is present with:

      xattr -p com.apple.quarantine "#{appdir}/LidKeep.app"

    Notarized builds will remove the need for this step.
  EOS
end
