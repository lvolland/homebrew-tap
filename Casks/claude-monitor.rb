cask "claude-monitor" do
  version "1.0.0"
  sha256 "ee0167c58c0f65cb5d5aae90844da4850df8285e5383992095e94b14b9f39423"

  url "https://github.com/lvolland/claude-monitor/releases/download/v#{version}/ClaudeMonitor-v#{version}-macOS.zip"
  name "Claude Monitor"
  desc "macOS menu bar app to monitor Claude subscription usage"
  homepage "https://github.com/lvolland/claude-monitor"

  depends_on macos: ">= :ventura"

  app "ClaudeMonitor.app"

  zap trash: [
    "~/Library/Preferences/com.lvolland.claude-monitor.plist",
  ]
end
