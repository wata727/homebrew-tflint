class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.3.2.tar.gz"
  sha256 "3bfda08c2de26a956db1fec6de7ea8a2b1e79837b4dd4a2067b50d4021d4f336"

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
