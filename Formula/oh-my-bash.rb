class OhMyBash < Formula
  desc "Delightful community-driven framework for managing your bash configuration"
  homepage "https://github.com/ohmybash/oh-my-bash"
  url "https://github.com/ohmybash/oh-my-bash/archive/0bd2d2c79e2ffb94dc25b4f039c0e7edbf1ae48e.tar.gz"
  version "2026-08-30"
  sha256 "cf8d33ba2de0595c43913d13d6acac403f5633c60a446c5fbed6619e768126b2"
  license "MIT"
  head "https://github.com/ohmybash/oh-my-bash.git", branch: "master"

  # oh-my-bash never tags releases, so there is no stable version to track:
  # the URL is pinned to a commit and `version` is that commit's date.
  livecheck do
    skip "Project has no tags or releases; version is pinned to the commit date"
  end

  def install
    libexec.install Dir["*"]
  end

  def caveats
    <<~EOS
      Add Oh My Bash to your interactive shell by appending to ~/.bashrc:

        export OSH="#{opt_libexec}"
        source "$OSH/oh-my-bash.sh"

      Oh My Bash's built-in auto-updater expects a git checkout, which a
      Homebrew install is not. Add this line to ~/.bashrc to disable it and
      update via Homebrew instead (brew upgrade oh-my-bash):

        export DISABLE_AUTO_UPDATE=true

      Runtime caches and customisations are written under
      ~/.local/state/oh-my-bash and ~/.local/share/oh-my-bash rather than the
      read-only Cellar keg.
    EOS
  end

  test do
    ENV["DISABLE_AUTO_UPDATE"] = "true"
    output = shell_output(
      "bash --noprofile --norc -ic 'export OSH=#{opt_libexec}; " \
      "source \"$OSH/oh-my-bash.sh\"; printf \"%s\" \"$OMB_VERSION\"' 2>/dev/null",
    )
    assert_match(/1\.0\.0/, output)
  end
end
