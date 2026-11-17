class Nextmv < Formula
  desc "The Nextmv CLI allows you to manage and deploy decision models and interact with them."
  homepage "https://www.nextmv.io"
  version "1.13.1"
  license "Apache-2.0"

  # Only Apple silicon is supported on macOS; there is no Intel macOS binary.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-macos-arm64.zip"
    sha256 "a901ffc4964dd53bcc8c4247587b4fb9be10d83d2efefb9c3ce9b5e907ef7b53"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-arm64.zip"
      sha256 "b465cc419243bb190241ee5097e119033cd9fe826197d94a727f47bea308a77a"
    else
      url "https://github.com/nextmv-io/nextmv-py/releases/download/nextmv-v#{version}/nextmv-linux-x64.zip"
      sha256 "6f331de5ce3e644d04d03aebd7ee33a6922246e1e8e3bc074a3f52ca1b10b095"
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
