cask "claude-monitor" do
  version "1.2"
  sha256 "44e5ea38f906c75d3568ead147549c2bcf4bf175f59adc5471da81f9e60cb588"

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
