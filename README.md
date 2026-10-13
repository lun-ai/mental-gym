# mental-gym-TOPIC

> **Template placeholder.** This README describes the template, not a gym.
> When the gym session starts, replace it with the actual topic: what is being
> built, the reference implementation, and the topic's own notes. The
> `AI-mental-gym-checklist` skill does this when it generates `CHECKLIST.md`.

A [mental gym](https://github.com/lun-ai/skills) for building TOPIC from scratch.
Reference implementation: TBD.

Progress lives in [`CHECKLIST.md`](CHECKLIST.md). Blog post: TBD.

## How the gym works

Install the `AI-mental-gym` and `AI-mental-gym-checklist` skills from
[lun-ai/skills](https://github.com/lun-ai/skills) into `~/.claude/skills`,
open this repo in Claude Code, and say which checklist item you are on. The
skill coaches one item at a time without writing the solution for you.

![How the gym works: one rep per checklist item](docs/diagrams/gym-loop.png)

Each checklist item is one rep. The AI writes a concept brief, then the
function signature and a gap-fill skeleton straight into `src/TOPIC/`. You fill
every blank in your own editor. The AI re-reads the file, critiques it, and
only once it is correct asks a depth question scoped to that item. The last
item of a phase also triggers the phase's depth checkpoint from
`CHECKLIST.md`. Then the item is checked off and the loop restarts.

To vendor a frozen copy of the skills into this repo instead, run
`scripts/sync-skill.sh`.

## Layout

![Repo layout](docs/diagrams/repo-layout.png)

```
src/TOPIC/    the code you write
tests/        unit tests per checklist item
data/         datasets (gitignored)
outputs/      generated artifacts (gitignored)
CHECKLIST.md  phases, items and depth checkpoints
docs/         diagrams (.excalidraw sources and rendered .png)
```

The diagrams are editable at [excalidraw.com](https://excalidraw.com): open the
`.excalidraw` file in `docs/diagrams/`, or regenerate with the
`excalidraw-diagram` skill.

## Setup

```
uv sync
uv run pytest
```

## Starting a new gym from this template

1. Create the repo from this template as `mental-gym-<topic>`.
2. Rename `src/topic/` to `src/<topic>/` and set `name` and `packages` in `pyproject.toml`.
3. Open the repo in Claude Code and run the `AI-mental-gym-checklist` skill. It
   generates `CHECKLIST.md` and rewrites this README for the actual topic.
4. Fill in the reference implementation link if the skill could not infer it.
5. Delete this section.
