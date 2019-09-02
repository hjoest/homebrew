require 'formula'

class Gcloud < Formula
  homepage 'https://cloud.google.com/sdk'
  url 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-260.0.0-darwin-x86_64.tar.gz'
  version '260.0.0'
  sha256 '325ee7cbf6dd006111d9b8f68b9e99fba01d3b8bcf11365ad91ad9bf3237975f'

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
