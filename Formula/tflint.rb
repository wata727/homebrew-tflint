class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.9.2.tar.gz"
  sha256 "ba34b6ce3b4a525f3d3af0cd1a96322e0acbc90a6db11ea45c5e9c2579b685ab"

  depends_on "go" => :build

  def install
    ENV["GO111MODULE"] = "on"
    system "go", "build", "-o", "dist/tflint"
    bin.install "dist/tflint"
  end

  test do
    system "#{bin}/tflint", "--version"
  end
end
