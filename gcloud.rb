require 'formula'

class Gcloud < Formula
  homepage 'https://cloud.google.com/sdk'
  url 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-239.0.0-darwin-x86_64.tar.gz'
  version '239.0.0'
  sha256 '4867c21d93552b6da46d5d55b97682725105eeef61f1b0baadadf5fe2ed2bd76'

  depends_on "python"

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
