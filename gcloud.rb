require 'formula'

class Gcloud < Formula
  homepage 'https://cloud.google.com/sdk'
  url 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-157.0.0-linux-x86_64.tar.gz'
  version '157.0.0'
  sha256 '95b98fc696f38cd8b219b4ee9828737081f2b5b3bd07a3879b7b2a6a5349a73f'

  depends_on :python

  option "without-completions", "Disable bash/zsh completions"

  def install
    system './install.sh --disable-installation-options --usage-reporting false --path-update false < /dev/null'
    prefix.install Dir['bin']
    prefix.install Dir['help']
    prefix.install Dir['lib']
    prefix.install Dir['platform']
    prefix.install Dir['.install']
    prefix.install 'properties'
    if build.with? "completions"
      bash_completion.install 'completion.bash.inc' => '_gcloud'
      zsh_completion.install 'completion.zsh.inc' => '_gcloud'
    end
  end

  test do
    system "#{bin}/gcloud", "version"
  end

end
