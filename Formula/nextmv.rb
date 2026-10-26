class Nextmv < Formula
  desc "The Nextmv CLI allows you to manage and deploy decision models and interact with them."
  homepage "https://www.nextmv.io"
  version "1.13.0"
  license "Apache-2.0"

  # Only Apple silicon is supported on macOS; there is no Intel macOS binary.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-arm64.zip"
    sha256 "74cb7d2252d277620f7f24b7470137b44f39b5ca3b567cebad8872d58c84e408"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-arm64.zip"
      sha256 "79c8811de3e2e749da42fe2de0a7e0f10b98d17cca9827ac77cf65592dc244b2"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-x64.zip"
      sha256 "44d39173196c766d03aba88be0b627a76d6a66c3ec9e1a8734d2d591ddf9c724"
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
