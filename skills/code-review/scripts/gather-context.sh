#!/usr/bin/env bash
# gather-context.sh — Collect repo metadata to inform code review.
# Called by the code-review skill before analyzing the diff.

set -euo pipefail

echo "=== Language Breakdown ==="
if command -v tokei &>/dev/null; then
  tokei --compact
elif command -v scc &>/dev/null; then
  scc --no-cocomo
else
  # Fallback: count files by extension
  find . -type f -name '*.*' \
    ! -path './.git/*' \
    ! -path './node_modules/*' \
    ! -path './vendor/*' \
    | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -15
fi

echo ""
echo "=== Recent Contributors (last 30 days) ==="
git log --since="30 days ago" --format='%aN' | sort | uniq -c | sort -rn | head -10

echo ""
echo "=== Open TODOs / FIXMEs ==="
grep -rn --include='*.ts' --include='*.js' --include='*.py' --include='*.go' --include='*.rs' \
  -E '(TODO|FIXME|HACK|XXX):' . 2>/dev/null | head -20 || echo "(none found)"
