cask "lidkeep" do
  version "2.2.0"
  sha256 "180958c5f43d722cf3137ed2bca6bff2977850c655561a137bae99153a4f66d0"

  url "https://github.com/Mihooni/lidkeep/releases/download/v#{version}/LidKeep-#{version}.dmg",
      verified: "github.com/Mihooni/lidkeep/"
  name "LidKeep"
  desc "Keep a Mac awake with the lid closed while turning the display off"
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
end
