# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.11.2"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.11.2/stripe_1.11.2_mac-os_arm64.tar.gz"
      sha256 "1e19d91235f01e37fd602c5e88be1e612c6d7478a40407cbe0cbc356007a8e4f"

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
      url "https://github.com/stripe/stripe-cli/releases/download/v1.11.2/stripe_1.11.2_mac-os_x86_64.tar.gz"
      sha256 "ca8d575a3ed924a1aff4bc3c5c92393784d6293c5d0a3847996aa0de3531ee96"

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
