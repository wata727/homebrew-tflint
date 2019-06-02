class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.8.2.tar.gz"
  sha256 "8676340cad93a117a5338c6ff13b7127ff0c394fd4b8ab8b979d864a9f74e03a"

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
