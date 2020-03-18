require "language/node"

class Cdk8s < Formula
  desc "Define Kubernetes native apps using object-oriented programming"
  homepage "https://github.com/awslabs/cdk8s"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-0.15.1.tgz"
  sha256 "31b1f47b3d6c74ed50c029d16765d0f7b22ba513927f1987ebbc7e5eec401465"

  depends_on "node"

  def install
    rm_rf "bin/cdk8s"

    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    shell_output("#{bin}/cdk8s import k8s -l python")

    assert_predicate testpath/"imports/k8s", :exist?, "cdk8s import did not work"
  end
end
