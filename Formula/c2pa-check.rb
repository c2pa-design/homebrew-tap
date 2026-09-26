class C2paCheck < Formula
  desc "Verify Content Credentials (C2PA) in files and URLs"
  homepage "https://c2pa.design"
  url "https://github.com/c2pa-design/c2pa-check/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "44e35a2b942c6cc0877201159aea601ab1cd495d360334a00cffdf6358b828d4"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/c2pa-check")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/c2pa-check --version")
  end
end
