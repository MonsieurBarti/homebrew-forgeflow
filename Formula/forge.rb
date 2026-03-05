class Forge < Formula
  desc "Project orchestration for Claude Code, backed by beads"
  homepage "https://github.com/MonsieurBarti/forge"
  url "https://github.com/MonsieurBarti/forge/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "57ebc5b7c5b823b34a477ccdd9f8f7763bef0b9e87c58e22874d16ae60cbe7f7"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"install.js" => "forge-install"
  end

  def caveats
    <<~EOS
      Run the installer to set up Forge in Claude Code:
        node #{libexec}/install.js
    EOS
  end

  test do
    assert_match "Forge", shell_output("node #{libexec}/install.js --help 2>&1")
  end
end
