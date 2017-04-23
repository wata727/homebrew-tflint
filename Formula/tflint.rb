class Tflint < Formula
  desc "Terraform linter"
  homepage "https://github.com/wata727/tflint"
  url "https://github.com/wata727/tflint/archive/v0.3.5.tar.gz"
  sha256 "20bb53e3c774f2f6e7aaeeb6e7cad2f3be89b0815f3b527714cc30d17a4375a0"

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
