require 'formula'

class Gcloud < Formula
  homepage 'https://cloud.google.com/sdk'
  url 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-129.0.0-linux-x86_64.tar.gz'
  version '129.0.0'
  sha256 '3f37970330bd824805e9ec23ef82e7bd79324ab685186ee52339a07c01f9a950'

  depends_on :python

  def install
    system './install.sh --disable-installation-options --usage-reporting false --path-update false --bash-completion true < /dev/null'
    prefix.install Dir['bin']
    prefix.install Dir['help']
    prefix.install Dir['lib']
    prefix.install Dir['platform']
    prefix.install Dir['.install']
    prefix.install 'properties'
  end

  test do
    system "#{bin}/gcloud", "version"
  end

end
