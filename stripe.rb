# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.10.2"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.10.2/stripe_1.10.2_mac-os_arm64.tar.gz"
      sha256 "775711aee1253f3fb9d9466813e242c05ac12695aa32e7197c68f8c52254aa07"

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
    end
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.10.2/stripe_1.10.2_mac-os_x86_64.tar.gz"
      sha256 "f158f12562058163ad14c747b9351635a24837b65462851b168e71120954a6fa"

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
    end
  end

  def caveats; <<~EOS
    ❤ Thanks for installing the Stripe CLI! If this is your first time using the CLI, be sure to run `stripe login` first.
  EOS
  end
end
