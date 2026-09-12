# Mihooni's Homebrew tap

## LidKeep

Turn the display off without sleeping the Mac, and keep it running with the lid closed.

```bash
brew install --cask mihooni/tap/lidkeep
```

### One extra step, for now

The build is signed **ad-hoc, not notarized**, and Homebrew applies the quarantine
attribute on install. Gatekeeper therefore blocks the first launch — and on recent
macOS it can move the app straight to the Trash. Clear the flag once after installing:

```bash
xattr -dr com.apple.quarantine "/Applications/LidKeep.app"
```

Homebrew cannot skip this (`--no-quarantine` no longer exists in Homebrew 6), and the
cask cannot disable quarantine on the user's behalf. **Notarized builds will remove this
step entirely** — it is the single highest-priority item upstream.

Upstream: <https://github.com/Mihooni/lidkeep>

## Support this project

If this project saves you time, buying me a coffee keeps it going ☕

<p align="center">
  <img src="docs/donate-wechat.png" alt="WeChat Pay" width="220">&nbsp;&nbsp;
  <img src="docs/donate-alipay.jpg" alt="Alipay" width="220">
</p>
