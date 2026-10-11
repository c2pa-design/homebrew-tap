class C2paCheck < Formula
  desc "Verify Content Credentials (C2PA) in files and URLs"
  homepage "https://c2pa.design"
  url "https://github.com/c2pa-design/c2pa-check/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "eca9e8a7163dfbe62d1d9a33bab7705da7bc71ae4cb925a73b4ed8c789faccf9"
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
