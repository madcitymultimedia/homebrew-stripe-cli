# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.5.6"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/stripe/stripe-cli/releases/download/v1.5.6/stripe_1.5.6_mac-os_x86_64.tar.gz"
    sha256 "83d9dd66b70a7bf12c25e0d816ab05a8e008834dbf193935ab57335060598079"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.5.6/stripe_1.5.6_linux_x86_64.tar.gz"
      sha256 "b724b479e3075af860a8b22db7b695b9c762f67941697c6ad3cea3a322c59df0"
    end
  end

  def install
    bin.install "stripe"
    rm Dir["#{bin}/{stripe-completion.bash,stripe-completion.zsh}"]
    system bin/"stripe", "completion", "--shell", "bash"
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

  def caveats; <<~EOS
    ❤ Thanks for installing the Stripe CLI! If this is your first time using the CLI, be sure to run `stripe login` first.
  EOS
  end
end
