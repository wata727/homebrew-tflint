class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.9.0.tar.gz"
  sha256 "349bb353a0b182dbb112ce1a8c5ee23eed7d7c4e042b7fbdc273b0c09e700569"

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
