class Nextmv < Formula
  desc "The Nextmv CLI allows you to manage and deploy decision models and interact with them."
  homepage "https://www.nextmv.io"
  version "1.9.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-arm64.zip"
      sha256 "3cc48a9301571978764af9b8b6bb5ac0262159366d4de62bb2ea658099f9b0ba"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-x64.zip"
      sha256 "74b733bf28f45f2062c21892a2b9cf64eb0fb7ffbf1771d5ed45e66840e94fb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-arm64.zip"
      sha256 "9ff14a56445f64555826bbb3481e11542e640febcd10d28869956427c98f52b0"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-x64.zip"
      sha256 "9ab091426129ee9662409911794ebe33e867a637e99df1a2bdc5d970c1e745e6"
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
