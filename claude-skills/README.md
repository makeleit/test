# Claude Skills Hub

A portable collection of Claude Code **skills**, **agents** and **commands**, so they're
available on every device you use — desktop app, CLI, IDE extension, VPS.

> There is no built-in "skills follow your Anthropic account" sync. Portability works by
> keeping everything in this one GitHub folder and deploying it into `~/.claude/` on each
> device with the included `install.sh`.

## What's inside

| Folder | Count | Notes |
|--------|-------|-------|
| `skills/` | 8 skills | stop-slop, ui-ux-pro-max, impeccable, global-design, remotion, context-engineering, marketing-skills (43 sub-skills) |
| `agents/accessibility/` | 80 agents | Accessibility Agents plugin |
| `commands/accessibility/` | 17 commands | `/accessibility:audit`, `/accessibility:contrast`, … |

Sources of every skill are listed in [`INSTALLED.md`](./INSTALLED.md).

## Install on a new device

```bash
git clone https://github.com/makeleit/test.git
cd test/claude-skills

# Global: available in EVERY project on this machine
./install.sh

# …or symlink so a future `git pull` auto-updates everything
./install.sh --link

# …or install into a single project only
./install.sh --project /path/to/your/repo
```

Then **restart Claude Code**. Type `/` and you'll see the new skills/commands.

## Update everywhere

```bash
cd test && git pull
./claude-skills/install.sh        # (skip if you used --link — pull is enough)
```

## Per-environment notes

- **Desktop app / CLI / IDE** — `./install.sh` (global into `~/.claude`). Same `~/.claude`
  is shared by all three.
- **VPS over SSH** — run `./install.sh` once on the VPS; skills live in the VPS `~/.claude`.
- **Claude Code on the web** — web sessions start from a fresh clone, so the simplest path is
  to keep working in this repo, or add a SessionStart/setup step that runs
  `claude-skills/install.sh` at session start. Ask Claude to "set up a SessionStart hook to
  install the skills hub" and it will wire it up.

## Requirements

- `ui-ux-pro-max` runs a small **Python 3** CLI (`scripts/search.py`) for its design database.
- The Accessibility **hooks** (`skills`/plugin `hooks/hooks.json`) are NOT auto-enabled — they
  run shell scripts on every prompt/edit and must be added to `settings.json` deliberately.
