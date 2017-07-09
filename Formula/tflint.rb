class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.4.0.tar.gz"
  sha256 "f1a67e5ffe4d4554f49818fac756d5802de4a66940aa2e0a920776974c3790ea"

  depends_on "glide" => :build
  depends_on "go" => :build
  depends_on "terraform" => [:recommended]
  depends_on "tfenv" => [:optional]

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
