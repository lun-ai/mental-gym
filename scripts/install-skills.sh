#!/usr/bin/env bash
# Install (or refresh) the mental gym skills into the user's global Claude Code
# skills directory. Idempotent: safe to run on every session start.
#
#   scripts/install-skills.sh            # installs into ~/.claude/skills
#   SKILLS_DIR=/path scripts/install-skills.sh
set -euo pipefail

REPO="https://github.com/lun-ai/skills.git"
DST="${SKILLS_DIR:-$HOME/.claude/skills}"
SKILLS=(AI-mental-gym AI-mental-gym-checklist)

# Already a clone of the skills repo: just pull.
if [ -d "$DST/.git" ] && git -C "$DST" remote get-url origin 2>/dev/null | grep -q "lun-ai/skills"; then
  git -C "$DST" pull -q --ff-only
  echo "updated $DST from lun-ai/skills"
  exit 0
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
git clone -q --depth 1 "$REPO" "$TMP/skills"

mkdir -p "$DST"
for skill in "${SKILLS[@]}"; do
  rm -rf "${DST:?}/$skill"
  cp -R "$TMP/skills/$skill" "$DST/$skill"
  echo "installed $skill -> $DST/$skill"
done
