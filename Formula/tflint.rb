class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.7.3.tar.gz"
  sha256 "ce61422683287330e50802a02dbd092fb7787c5bb33e45ab6c02081f6aa2d902"

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
