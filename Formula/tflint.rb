class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.8.1.tar.gz"
  sha256 "b9d6ed1b368f52a7a050b6ad989b196f1acf2a6765553b315d3fe8eb29ce8cb8"

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
