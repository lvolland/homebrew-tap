cask "claude-monitor" do
  version "1.5"
  sha256 "cef754b60f923b33945c3307f17c1470a40a02ba18c225d0519b9f5b5c2f5974"

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
