class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.4.1.tar.gz"
  sha256 "286b7a21d24a117fc8c9a4063092d8ab1f7c77537a9d9ffa7c6504a6fe8a67a4"

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
