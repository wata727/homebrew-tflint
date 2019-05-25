class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.8.0.tar.gz"
  sha256 "6d384360e7ea6dba6861b7f6628c5eccba32401d18a0eb3aa2a8c2eb5134a9d7"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/wata727/tflint").install buildpath.children
    cd "src/github.com/wata727/tflint" do
      system "dep", "ensure", "-vendor-only"
      system "go", "build", "-o", "dist/tflint"

      bin.install "dist/tflint"
    end
  end

  test do
    system "#{bin}/tflint", "--version"
  end
end
