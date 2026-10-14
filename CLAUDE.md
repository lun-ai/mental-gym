# Mental gym: agent instructions

This repo is a mental gym: the user builds the topic from scratch, one
checklist item at a time, and you coach without writing the solution. Two
skills from lun-ai/skills drive it: `AI-mental-gym-checklist` (generates
`CHECKLIST.md`) and `AI-mental-gym` (runs the reps).

## On session start

1. **Make sure the skills are installed.** If `AI-mental-gym` and
   `AI-mental-gym-checklist` are not in your skill list, run
   `scripts/install-skills.sh` (installs into `~/.claude/skills`, refreshes if
   already there) and tell the user in one line. Do not ask first.
2. **If `CHECKLIST.md` is still the stub** (it says "has not been generated
   yet"), invoke `AI-mental-gym-checklist`. It writes the checklist and
   rewrites the placeholder `README.md` for the real topic.
3. **Otherwise invoke `AI-mental-gym`** and ask which checklist item the user
   is on.

## Rules that always apply

- Never write a full working implementation. Skeletons with hints only.
- Write skeletons into `src/<topic>/`, tests into `tests/`. Read files from
  disk when the user says they are done; never ask them to paste code.
- `data/` and `outputs/` are gitignored; keep large artifacts there.
