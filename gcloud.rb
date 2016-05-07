require 'formula'

class Gcloud < Formula
  homepage 'https://cloud.google.com/sdk'
  url 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-109.0.0-linux-x86_64.tar.gz'
  version '109.0.0'
  sha256 '0dea2fd2ad1556d9a60bb4d62741c8b71a0d238bfa670cdd1829292be08e22c6'

  depends_on :python

  def install
    system './install.sh --disable-installation-options --usage-reporting false --path-update false --bash-completion false < /dev/null'
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
