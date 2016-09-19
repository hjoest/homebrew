require 'formula'

class Gcloud < Formula
  homepage 'https://cloud.google.com/sdk'
  url 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-126.0.0-linux-x86_64.tar.gz'
  version '126.0.0'
  sha256 '3497d851b366c2ed2ce00dc36c91f8539873c30219cd5e4e7f8db64a7d732f1a'

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
