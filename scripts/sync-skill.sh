#!/usr/bin/env bash
# Optional: vendor a frozen copy of the AI-mental-gym skills into this repo.
#
# The primary way to use this gym is to install the skills from
# https://github.com/lun-ai/skills into ~/.claude/skills. Run this script only
# if you want the repo to be self-contained at the moment you share it.
# Remember the copies go stale: re-run to refresh them.
set -euo pipefail

SRC="${SKILLS_DIR:-$HOME/.claude/skills}"
DST="$(cd "$(dirname "$0")/.." && pwd)/.claude/skills"

for skill in AI-mental-gym AI-mental-gym-checklist; do
  if [ ! -f "$SRC/$skill/SKILL.md" ]; then
    echo "missing $SRC/$skill/SKILL.md — install lun-ai/skills first" >&2
    exit 1
  fi
  mkdir -p "$DST/$skill"
  cp "$SRC/$skill/SKILL.md" "$DST/$skill/SKILL.md"
  echo "synced $skill"
done
