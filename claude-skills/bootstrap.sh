#!/usr/bin/env bash
# One-line bootstrap: clone this repo's skills hub and install into ~/.claude.
#
#   curl -fsSL https://raw.githubusercontent.com/makeleit/test/claude/instagram-reel-links-skills-p9i46n/claude-skills/bootstrap.sh | bash
#
# Re-run any time to update. Set BRANCH=main once the hub is merged to main.

set -euo pipefail

REPO="https://github.com/makeleit/test.git"
BRANCH="${BRANCH:-claude/instagram-reel-links-skills-p9i46n}"
DEST="${DEST:-$HOME/.claude-skills-hub}"

echo "Claude skills hub — bootstrap"
echo "  repo:   $REPO ($BRANCH)"
echo "  clone:  $DEST"
echo

if [ -d "$DEST/.git" ]; then
  echo "Updating existing clone..."
  git -C "$DEST" fetch --depth 1 origin "$BRANCH"
  git -C "$DEST" checkout -q "$BRANCH"
  git -C "$DEST" reset --hard -q "origin/$BRANCH"
else
  git clone --depth 1 -b "$BRANCH" "$REPO" "$DEST"
fi

bash "$DEST/claude-skills/install.sh" "$@"
