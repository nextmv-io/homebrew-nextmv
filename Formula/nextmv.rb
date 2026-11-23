class Nextmv < Formula
  desc "The Nextmv CLI allows you to manage and deploy decision models and interact with them."
  homepage "https://www.nextmv.io"
  version "1.14.1"
  license "Apache-2.0"

  # Only Apple silicon is supported on macOS; there is no Intel macOS binary.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-arm64.zip"
    sha256 "db6fda22b18ee5a327f98b07f18d218cade638ebe0735f83864d2371a89fb341"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-arm64.zip"
      sha256 "7476a508fba9db623148b39736198051730faa36f5f48c3b20fd0d936bd4a766"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-x64.zip"
      sha256 "f5067187e0b581e1b1635b98583b26e25296327677899fdcff66530a82100206"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"nextmv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nextmv --version")
  end
end
