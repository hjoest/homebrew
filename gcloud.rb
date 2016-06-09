require 'formula'

class Gcloud < Formula
  homepage 'https://cloud.google.com/sdk'
  url 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-113.0.0-linux-x86_64.tar.gz'
  version '113.0.0'
  sha256 'd963dbac5c1bfaa9b640ef32476b9c7f0f04fb1e9cde5b56bcf77f1d22404cba'

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
