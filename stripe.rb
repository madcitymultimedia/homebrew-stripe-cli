# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "0.5.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/stripe/stripe-cli/releases/download/v0.5.0/stripe_0.5.0_mac-os_x86_64.tar.gz"
    sha256 "8577a7b53a7db6502952e93a30a61b6aabac8a51d66af17c5e42d96c7104324b"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v0.5.0/stripe_0.5.0_linux_x86_64.tar.gz"
      sha256 "bfbaaa8bc837a031315a2c908ea4d679b0d5bdd3e532d1459d08313abe22ec3d"
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