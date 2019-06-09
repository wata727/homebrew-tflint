class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.8.3.tar.gz"
  sha256 "288e281a54514b866b99e7f42d961c00fa2543b2d7436b3ed94728e02eb70af7"

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
