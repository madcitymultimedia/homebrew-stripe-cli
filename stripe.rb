# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "0.8.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/stripe/stripe-cli/releases/download/v0.8.2/stripe_0.8.2_mac-os_x86_64.tar.gz"
    sha256 "f22bdc25c5993ea5df6dd436e5fd10b133c37b79ee6be3e87b1c5f12394a2d85"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v0.8.2/stripe_0.8.2_linux_x86_64.tar.gz"
      sha256 "dfcf825f3bcd4a71a369170000857911b2457937efa5204ca5c5ec1f99f51bde"
    end
  end

  def install
    bin.install "stripe"
    rm Dir["#{bin}/{stripe-completion.bash,stripe-completion.zsh}"]
    system bin/"stripe", "completion"
    system bin/"stripe", "completion", "--shell", "zsh"
    bash_completion.install "stripe-completion.bash"
    zsh_completion.install "stripe-completion.zsh"
    (zsh_completion/"_stripe").write <<~EOS
      #compdef stripe
      _stripe () {
        local e
        e=$(dirname ${funcsourcetrace[1]%:*})/stripe-completion.zsh
        if [[ -f $e ]]; then source $e; fi
      }
    EOS
  end
end
