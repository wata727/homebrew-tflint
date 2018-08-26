class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.7.2.tar.gz"
  sha256 "621cbe84145143063a8f993bc90af8b0129ff9bb64f047083ed78a4436b6da4c"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/wata727/tflint").install buildpath.children
    cd "src/github.com/wata727/tflint" do
      system "dep", "ensure", "-vendor-only"
      system "go", "build", "-o", "tflint"

      bin.install "tflint"
    end
  end

  test do
    system "#{bin}/tflint", "--version"
  end
end
