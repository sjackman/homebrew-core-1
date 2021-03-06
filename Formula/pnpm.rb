class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-5.13.6.tgz"
  sha256 "37e2598f9f2ed31a72cf5d5da23ce907e40af61835e2835a61f1e2e6bab568a3"
  license "MIT"

  livecheck do
    url :stable
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "305d518b807fca5a85961c2dd221f38eef02db74a88829148c5e590e35b2960f" => :big_sur
    sha256 "ab3e788f9a96b2a61a6e7505936511abd8de9464d4ad30762897674e13f0f614" => :catalina
    sha256 "b3de6dbc9f138ede9ae5f9b43883b0b42c63502aa356d6267e718bb3be99e07d" => :mojave
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/pnpm", "init", "-y"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
