# mental-gym-TOPIC

> **Template placeholder.** This README describes the template, not a gym.
> When the gym session starts, replace it with the actual topic: what is being
> built, the reference implementation, and the topic's own notes. The
> `AI-mental-gym-checklist` skill does this when it generates `CHECKLIST.md`.

A [mental gym](https://github.com/lun-ai/skills) for building TOPIC from scratch.
Reference implementation: TBD.

Progress lives in [`CHECKLIST.md`](CHECKLIST.md). Blog post: TBD.

## Setting up the mental gym skill

The gym is driven by two Claude Code skills from
[lun-ai/skills](https://github.com/lun-ai/skills): `AI-mental-gym` runs the
reps and `AI-mental-gym-checklist` generates `CHECKLIST.md`.

**Option A: install globally (recommended).** Every repo you open in Claude
Code can use them.

```bash
git clone https://github.com/lun-ai/skills.git "$HOME/.claude/skills"
```

If `~/.claude/skills` already exists, clone elsewhere and copy the two skill
directories in:

```bash
git clone https://github.com/lun-ai/skills.git /tmp/skills
cp -R /tmp/skills/AI-mental-gym /tmp/skills/AI-mental-gym-checklist "$HOME/.claude/skills/"
```

**Option B: vendor into this repo.** Freezes a copy under `.claude/skills/`
so the repo is self-contained when shared. It copies from your global install,
so do Option A first. Re-run to refresh.

```bash
scripts/sync-skill.sh
```

**Check it worked.** Open this repo in Claude Code and type `/`. Both skills
should appear in the list. Then start:

```text
Use the AI-mental-gym-checklist skill to create the checklist for this gym.
```

## How the gym works

Open this repo in Claude Code and say which checklist item you are on. The
skill coaches one item at a time without writing the solution for you.

![One rep per checklist item](docs/diagrams/gym-loop.png)

Each checklist item is one rep: the AI scaffolds a skeleton with hints, you
fill the blanks, the AI critiques, then asks a depth question once it is
correct. The last item of a phase also triggers that phase's depth checkpoint.

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

## Python setup

```
uv sync
uv run pytest
```

## Starting a new gym from this template

1. Create the repo from this template as `mental-gym-<topic>`.
2. Rename `src/topic/` to `src/<topic>/` and set `name` and `packages` in `pyproject.toml`.
3. Install the skills (see "Setting up the mental gym skill" above).
4. Open the repo in Claude Code and run the `AI-mental-gym-checklist` skill. It
   generates `CHECKLIST.md` and rewrites this README for the actual topic.
5. Fill in the reference implementation link if the skill could not infer it.
6. Delete this section.
