# Installed skills

Skills vendored from the Instagram reel (and a recommended repo from its comments).
Each entry lists the upstream GitHub source.

| # | Skill | Source repo | Type | Location |
|---|-------|-------------|------|----------|
| 1 | Marketing Skills | `coreyhaines31/marketingskills` | 43 sub-skills | `.claude/skills/marketing-skills/*` |
| 2 | Stop Slop | `hardikpandya/stop-slop` | skill | `.claude/skills/stop-slop/` |
| 3 | UI UX Pro Max | `nextlevelbuilder/ui-ux-pro-max-skill` | skill (+ data/scripts) | `.claude/skills/ui-ux-pro-max/` |
| 4 | ReMotion | `wshuyi/remotion-video-skill` | skill | `.claude/skills/remotion/` |
| 5 | Context Engineering | `NeoLabHQ/context-engineering-kit` | skill | `.claude/skills/context-engineering/` |
| 6 | Impeccable | `pbakaus/impeccable` | skill | `.claude/skills/impeccable/` |
| 7 | Accessibility Agents | `Community-Access/accessibility-agents` | plugin (80 agents + 17 commands) | `.claude/agents/accessibility/`, `.claude/commands/accessibility/` |
| 8 | Global Design | `staurus86/global-design-skill` | skill (+ rules/patterns/refs) | `.claude/skills/global-design/` |

## Not installed (intentionally)

- **Frontend Design** (`anthropics/claude-code` plugin) — official Anthropic skill, already
  available in Claude Code; nothing to vendor.
- **21st.dev Magic** (`21st-dev/magic-mcp`) — an MCP server, not a skill. Needs an API key
  and an `.mcp.json` entry, so it is not installed as a file-based skill.

## Notes

- Skills 2–6 and 8 are SKILL.md-based and auto-discovered by Claude Code under `.claude/skills/`.
- "Marketing Skills" is a collection of 43 individual SKILL.md skills.
- "Accessibility Agents" is a plugin: its agents and commands were wired into
  `.claude/agents/accessibility/` and `.claude/commands/accessibility/`. Its **hooks were NOT
  enabled** — `hooks/hooks.json` runs shell scripts on every prompt/edit and must be added to
  `settings.json` manually if you want them.
- For the ambiguous names (Marketing / ReMotion / Context Engineering) the most popular
  matching repository was chosen.
