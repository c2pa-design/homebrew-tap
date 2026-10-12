class C2paCheck < Formula
  desc "Verify Content Credentials (C2PA) in files and URLs"
  homepage "https://c2pa.design"
  url "https://github.com/c2pa-design/c2pa-check/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "a801303f9bc12c551c2c4449a0f4194b35265aab1a7f28eb997d3bb87d55840e"
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
