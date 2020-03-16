require "language/node"

class Cdk8sCli < Formula
  desc "Define Kubernetes native apps using object-oriented programming"
  homepage "https://github.com/awslabs/cdk8s"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-0.15.1.tgz"
  sha256 "31b1f47b3d6c74ed50c029d16765d0f7b22ba513927f1987ebbc7e5eec401465"

  depends_on "node"

  def install
    rm_rf "bin/cdk8s-cli"

    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"testfile.txt").write "Making a non-empty directory"
    begin
      # {bin}/cdk8s init typescript-app
    rescue SystemExit=>e
      expect(e.status).to eq(1)
      expect(e.message).to eq("Cannot initialize a project in a non-empty directory")
    end
  end
end
