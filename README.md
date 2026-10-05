# Hoodas101's Homebrew tap

## LidKeep

Turn the display off without putting the Mac to sleep, and keep running with the lid closed.

```bash
brew install --cask hoodas101/tap/lidkeep
```

### One extra step, for now

The build is signed ad-hoc, not notarized, and Homebrew applies the quarantine attribute on
install. Gatekeeper therefore blocks the first launch, and on recent macOS it can move the app
straight to the Trash. Clear the flag once after installing:

```bash
xattr -dr com.apple.quarantine "/Applications/LidKeep.app"
```

Homebrew cannot skip this (`--no-quarantine` no longer exists in Homebrew 6), and the cask
cannot disable quarantine on the user's behalf. Notarized builds will remove this step
entirely, and that is the highest-priority item upstream.

Upstream: <https://github.com/Hoodas101/lidkeep>

## Support this project

If this project saves you time, you can buy me a coffee.

<p align="center">
  <img src="docs/donate-wechat.png" alt="WeChat Pay" width="220">&nbsp;&nbsp;
  <img src="docs/donate-alipay.jpg" alt="Alipay" width="220">
</p>

**Elsewhere in the world?** These QR codes need a WeChat or Alipay account with a mainland
bank card, so they won't work for everyone. [GitHub Sponsors](https://github.com/sponsors/Hoodas101)
takes a card. A star or a bug report also helps.
