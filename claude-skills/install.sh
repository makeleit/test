#!/usr/bin/env bash
# Deploy these Claude Code skills, agents and commands to a .claude directory
# so they are available across all your projects (and devices).
#
# Usage:
#   ./install.sh                       Install GLOBALLY into ~/.claude
#                                      (available in every project on this machine)
#   ./install.sh --link                Same, but symlink instead of copy
#                                      (a `git pull` then auto-updates everything)
#   ./install.sh --project /path/repo  Install into that repo's .claude/ only
#   ./install.sh --target /custom/dir  Install into a custom .claude dir
#
# Re-run any time after `git pull` to update.

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

MODE="copy"
TARGET="$HOME/.claude"

while [ $# -gt 0 ]; do
  case "$1" in
    --link) MODE="link"; shift ;;
    --project) TARGET="${2:?path required}/.claude"; shift 2 ;;
    --target)  TARGET="${2:?path required}"; shift 2 ;;
    -h|--help) sed -n '2,18p' "$0"; exit 0 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

echo "Installing Claude skills hub"
echo "  source: $HERE"
echo "  target: $TARGET   (mode: $MODE)"
echo

for kind in skills agents commands; do
  src="$HERE/$kind"
  [ -d "$src" ] || continue
  dst="$TARGET/$kind"
  mkdir -p "$dst"
  # Operate per top-level entry so we never clobber unrelated skills you
  # already have in the target directory.
  for entry in "$src"/*; do
    name="$(basename "$entry")"
    if [ "$MODE" = "link" ]; then
      ln -sfn "$entry" "$dst/$name"
      echo "  linked  $kind/$name"
    else
      rm -rf "${dst:?}/$name"
      cp -R "$entry" "$dst/$name"
      echo "  copied  $kind/$name"
    fi
  done
done

echo
echo "Done. Restart Claude Code, then check with /  (slash) — you should see:"
echo "  /ui-ux-pro-max  /stop-slop  /impeccable  /global-design  /remotion"
echo "  /context-engineering  marketing skills (/cro, /seo-audit, ...)"
echo "  /accessibility:audit  and 80 accessibility agents."
echo
echo "Note: ui-ux-pro-max uses a Python CLI — make sure python3 is installed."
