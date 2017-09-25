class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.4.2.tar.gz"
  sha256 "068d77cba6b2df5b136a8e9c954a95681c6ec919c413fd461f8d78cee8700aa0"

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
