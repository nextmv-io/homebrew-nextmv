class Nextmv < Formula
  desc "The Nextmv CLI allows you to manage and deploy decision models and interact with them."
  homepage "https://www.nextmv.io"
  version "1.10.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-arm64.zip"
      sha256 "3c712abcb8d83ae983bf776fe5efe0e3b9b738d4c919803f45ca5a6b886f25bd"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-x64.zip"
      sha256 "2cac1b9c06124a5ec2326836f0dc42b2244ace25cc1adf0b4dd07963a99f6b56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-arm64.zip"
      sha256 "48dbf4d83411f430de953dac2be1aeb4fbaa99d7e9e9c3b438fbd7e2ede37c91"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-x64.zip"
      sha256 "2b7dfbdf0bce533823fcf86a70efdd1653330bd939e90d4ca42e96c40f8ab705"
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
