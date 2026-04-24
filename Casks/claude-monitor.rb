cask "claude-monitor" do
  version "1.8"
  sha256 "736c742696bf7f31397238910836f9f4b783396175ffa439eb9413204a8eb568"

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
