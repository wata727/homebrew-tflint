class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.6.0.tar.gz"
  sha256 "e89235e41cb7f6a056aef0d6bed4e3d306a3a78f3d209abb4264f95005d9cfa3"

  depends_on "glide" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home"
    (buildpath/"src/github.com/wata727/tflint").install buildpath.children
    cd "src/github.com/wata727/tflint" do
      system "glide", "install"
      system "go", "build", "-o", "tflint"

      bin.install "tflint"
    end
  end

  test do
    system "#{bin}/tflint", "--version"
  end
end
