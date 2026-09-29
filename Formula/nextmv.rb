class Nextmv < Formula
  desc "The Nextmv CLI allows you to manage and deploy decision models and interact with them."
  homepage "https://www.nextmv.io"
  version "1.11.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-arm64.zip"
      sha256 "32774654b60995259480a40684773249741aef7c43f10488b323626bbadf41f4"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-x64.zip"
      sha256 "1c7fd07ff29bf190f036abe1cda2603cd800fbc75ea80e4851cf4b48c33a9b03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-arm64.zip"
      sha256 "30c9c09c194992185045a5dffc17863e6f189df309633c236c5fd6ff7aada4c1"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-x64.zip"
      sha256 "dbe07fda354a5afe6ffdaefbd97aebcd4578ca4fe7b2c030fe79e9c144d54cd9"
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
