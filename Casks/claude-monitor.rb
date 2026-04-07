cask "claude-monitor" do
  version "1.3"
  sha256 "18ad46a72d6afce26a120ee718949038d64213b3c5c2bfa803917fbd0d0ac733"

  url "https://github.com/lvolland/claude-monitor/releases/download/v#{version}/ClaudeMonitor-v#{version}-macOS.zip"
  name "Claude Monitor"
  desc "macOS menu bar app to monitor Claude subscription usage"
  homepage "https://github.com/lvolland/claude-monitor"

  depends_on macos: ">= :ventura"

  app "Claude Monitor.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "#{appdir}/Claude Monitor.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.lvolland.claude-monitor.plist",
  ]
end
