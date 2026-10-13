# mental-gym-TOPIC

A [mental gym](https://github.com/lun-ai/skills) for building TOPIC from scratch.
Reference implementation: TBD.

Progress lives in [`CHECKLIST.md`](CHECKLIST.md). Blog post: TBD.

## How the gym works

Install the `AI-mental-gym` and `AI-mental-gym-checklist` skills from
[lun-ai/skills](https://github.com/lun-ai/skills) into `~/.claude/skills`,
open this repo in Claude Code, and say which checklist item you are on. The
skill coaches one item at a time without writing the solution for you.

To vendor a frozen copy of the skills into this repo instead, run
`scripts/sync-skill.sh`.

## Layout

```
src/TOPIC/    the code you write
tests/        unit tests per checklist item
data/         datasets (gitignored)
outputs/      generated artifacts (gitignored)
CHECKLIST.md  phases, items and depth checkpoints
```

## Setup

```
uv sync
uv run pytest
```

## Starting a new gym from this template

1. Create the repo from this template as `mental-gym-<topic>`.
2. Rename `src/topic/` to `src/<topic>/` and set `name` and `packages` in `pyproject.toml`.
3. Replace every `TOPIC` in this README and fill in the reference implementation.
4. Open the repo in Claude Code and run the `AI-mental-gym-checklist` skill to generate `CHECKLIST.md`.
5. Delete this section.
