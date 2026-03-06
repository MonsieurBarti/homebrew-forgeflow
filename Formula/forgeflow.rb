class Forgeflow < Formula
  desc "Project orchestration for Claude Code, backed by beads"
  homepage "https://github.com/MonsieurBarti/forgeflow"
  url "https://github.com/MonsieurBarti/forgeflow/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d87991b00364ea0e77bc1cbe117cdcc75eea6428ceaa62b66f4726b997882733"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"install.js" => "forgeflow-install"
  end

  def caveats
    <<~EOS
      Run the installer to set up Forgeflow in Claude Code:
        node #{libexec}/install.js
    EOS
  end

  test do
    assert_match "Forge", shell_output("node #{libexec}/install.js --help 2>&1")
  end
end
