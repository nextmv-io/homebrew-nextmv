class Nextmv < Formula
  desc "The Nextmv CLI allows you to manage and deploy decision models and interact with them."
  homepage "https://www.nextmv.io"
  version "1.10.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-arm64.zip"
      sha256 "ef888d8f6a18c9d0bb5e5838a119e3593405ad34d4a2f9981f732d3ee8084d6c"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-x64.zip"
      sha256 "a04b035f75fc55add551b0f931bc8185879d8efa2a9672e6435fdc11c1501045"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-arm64.zip"
      sha256 "af8ff9f696904e6a8c4a2c2e9327984c9e94c628b2911cdfc90e9375fcf73ea1"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-x64.zip"
      sha256 "198ae7f246efc84f0ec14cf371aac3d5c4394cadf2e226d42087dddc53523b39"
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
